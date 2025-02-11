import 'dart:convert';
import 'dart:io';
import 'dart:isolate';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:image_picker/image_picker.dart';
import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';
import 'package:nyaya_tech/backend/custom_response.dart';
import 'package:nyaya_tech/backend/services/files_api.dart';
import 'package:nyaya_tech/chat_box/chat_box_widget.dart';
import 'package:nyaya_tech/classes/file_upload_class.dart';
import 'package:nyaya_tech/components/file_component.dart';
import 'package:nyaya_tech/components/menu_item_card.dart';
import 'package:nyaya_tech/data_components/shared_preference.dart';
import 'package:nyaya_tech/hearing_summary/hearing_summary_widget.dart';
import 'package:nyaya_tech/logs/logs_widget.dart';
import 'package:nyaya_tech/notes_screen/notes_screen_widget.dart';
import 'package:nyaya_tech/responses/file_upload_response.dart';
import 'package:nyaya_tech/responses/upload_multiple_documents_response.dart';
import 'package:nyaya_tech/view_case/view_case_widget.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:popover/popover.dart';
import 'package:http/http.dart' as http;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'files_model.dart';
export 'files_model.dart';

class FilesWidget extends StatefulWidget {
  const FilesWidget({super.key});

  @override
  State<FilesWidget> createState() => _FilesWidgetState();
}

class _FilesWidgetState extends State<FilesWidget> {
  late FilesModel _model;

  String message = '';
  bool isLoading = false;
  bool Loading = false;
  late Future<void> _future;
  bool ishasMoreLoading = false;
  bool isUploading = false;
  String uploadMessage = "";
  final Dio dio = Dio();
  bool loading = false;
  int progress = 0;
  String? filePath;

  ReceivePort _port = ReceivePort();
  String fileId = "";

  DownloadTaskStatus? status;

  Future<void> fetchData() async {
    await _model.fetchListDocumentData();
  }

  Future<void> _deleteFile() async {
    await _model.fetchDeleteFileData();
  }

  @override
  void initState() {
    super.initState();
    IsolateNameServer.registerPortWithName(
        _port.sendPort, 'downloader_send_port');

    _port.listen((dynamic data) {
  if (mounted) {
    setState(() {
      fileId = data[0];
      status = DownloadTaskStatus.fromInt(data[1]);
      progress = data[2];
    });
  }
});


    FlutterDownloader.registerCallback(downloadCallback);

    _model = createModel(context, () => FilesModel());
    _future = fetchData();
  }

  @override
  void dispose() {
    IsolateNameServer.removePortNameMapping('downloader_send_port');
    super.dispose();
  }

 static void downloadCallback(String id, int status, int progress) {
  print("Download Callback - ID: $id, Status: $status, Progress: $progress");
  final SendPort? send =
      IsolateNameServer.lookupPortByName('downloader_send_port');
  send?.send([id, status, progress]);
}

  Future<bool> requestPermission() async {
    if (Platform.isAndroid) {
      if (await Permission.notification.request().isGranted) {
        return true;
      } else {
        return false;
      }
    }
    return true;
  }

  Future<void> downloadFile() async {
    if (await requestPermission()) {
      String? s3Url = SharedPrefernce.gets3Url();
      String? fileName = SharedPrefernce.getfileName();
      if (Platform.isAndroid &&
          await Permission.manageExternalStorage.request().isDenied) {
        print('Storage permission denied');
        return;
      }

      if (s3Url == null || fileName == null) {
        print('Invalid URL or file name');
        return;
      }

      String downloadPath = "/storage/emulated/0/Nyaya_Tech";
      Directory directory = Directory(downloadPath);
      if (!await directory.exists()) {
        await directory.create(recursive: true);
      }

      try {
        final id = await FlutterDownloader.enqueue(
          url: s3Url,
          savedDir: downloadPath,
          fileName: fileName,
          showNotification: true,
          openFileFromNotification: true,
          allowCellular: true,
          requiresStorageNotLow: true,
        );

        setState(() {
          fileId = id!;
          status = DownloadTaskStatus.running;
        });

        print('Download started with ID: $fileId');
      } catch (e) {
        print('Download failed: $e');
      }
    } else {
      print('Permission denied');
    }
  }

  Future<void> pauseDownload() async {
    if (fileId.isNotEmpty) {
      await FlutterDownloader.pause(taskId: fileId);
      setState(() {
        status = DownloadTaskStatus.paused;
      });
      print("Download paused: $fileId");
    }
  }

  Future<void> resumeDownload() async {
    if (fileId.isNotEmpty) {
      String? newTaskId = await FlutterDownloader.resume(taskId: fileId);
      if (newTaskId != null) {
        setState(() {
          fileId = newTaskId;
          status = DownloadTaskStatus.running;
        });
        print("Download resumed with new task ID: $fileId");
      }
    }
  }

  Future<void> cancelDownload() async {
    if (fileId.isNotEmpty) {
      await FlutterDownloader.cancel(taskId: fileId);
      setState(() {
        status = null;
        fileId = "";
      });
      print("Download cancelled: $fileId");
    }
  }

  FilePickerResult? selectedFiles;

  Future<void> _uploadFile() async {
    try {
      setState(() {
        isUploading = true;
        isLoading = true; // Set loading true before upload starts
        uploadMessage = "";
      });

      selectedFiles = await FilePicker.platform
          .pickFiles(type: FileType.any, allowMultiple: true);

      if (selectedFiles != null && selectedFiles!.files.isNotEmpty) {
        for (PlatformFile file in selectedFiles!.files) {
          setState(() {
            uploadMessage = "Uploading ${file.name}...";
          });

          Uint8List? fileBytes;
          if (file.bytes != null) {
            fileBytes = file.bytes;
          } else if (file.path != null) {
            final pickedFile = File(file.path!);
            fileBytes = await pickedFile.readAsBytes();
          } else {
            setState(() {
              uploadMessage = "Unable to read content of ${file.name}.";
            });
            continue;
          }

          String base64Content = base64Encode(fileBytes!);
          FileUploadClass fileUploadObject = FileUploadClass(
            fileType: file.extension ?? 'unknown',
            fileName: file.name,
            fileSize: file.size,
            fileContent: base64Content,
          );

          try {
            CustomResponse<FilesUploadResponse> response =
                await FilesUploadApi().call(fileClass: fileUploadObject);

            if (response.statusCode == 200 || response.statusCode == 201) {
              String s3Url = response.data!.data!.targetUrl.toString();
              String fileKey = response.data!.data!.fileKey.toString();
              SharedPrefernce.setfileKey(fileKey);
              SharedPrefernce.sets3Url(s3Url);

              bool isUpdated =
                  await _updateS3Url(s3Url, fileBytes, file.extension);
              await _model.fetchUploadDocumentsData(
                  case_id: SharedPrefernce.getcaseId(),
                  file_type: file.extension ?? '--',
                  file_name: file.name,
                  file_size: file.size,
                  key: SharedPrefernce.getfileKey());

              setState(() {
                uploadMessage = isUpdated
                    ? "${file.name} uploaded and updated on S3 successfully!"
                    : "${file.name} uploaded but failed to update S3.";
              });
              isLoading = true;
              await _model.fetchListDocumentData();
            } else {
              setState(() {
                uploadMessage = "Failed to upload ${file.name}.";
              });
            }
          } catch (e) {
            debugPrint("Error uploading ${file.name}: $e");
            setState(() {
              uploadMessage =
                  "An error occurred during upload of ${file.name}.";
            });
          }
        }
      } else {
        setState(() {
          uploadMessage = "No file selected.";
        });
      }
    } catch (e) {
      debugPrint("Error during file upload: $e");
      setState(() {
        uploadMessage = "An error occurred during file upload.";
      });
    } finally {
      setState(() {
        isUploading = false;
        isLoading = false; // Ensure loading is set to false after completion
      });
    }
  }

  String _getMimeType(String? extension) {
    switch (extension?.toLowerCase()) {
      case 'jpg':
      case 'jpeg':
        return 'image/jpeg';
      case 'png':
        return 'image/png';
      case 'pdf':
        return 'application/pdf';
      case 'doc':
        return 'application/msword';
      case 'docx':
        return 'application/vnd.openxmlformats-officedocument.wordprocessingml.document';
      case 'xls':
        return 'application/vnd.ms-excel';
      case 'xlsx':
        return 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet';
      default:
        return 'application/octet-stream';
    }
  }

  Future<bool> _updateS3Url(
      String s3Url, Uint8List fileContent, String? fileExtension) async {
    try {
      final response = await http.put(
        Uri.parse(s3Url),
        headers: {
          'Content-Type': _getMimeType(fileExtension),
        },
        body: fileContent,
      );

      if (response.statusCode == 200) {
        return true;
      } else {
        debugPrint("Failed to update S3 URL: ${response.body}");
        return false;
      }
    } catch (e) {
      debugPrint("Error in PUT request: $e");
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        floatingActionButton: SizedBox(
          height: 50,
          width: 50,
          child: Builder(
            builder: (context) => FloatingActionButton(
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.zero)),
              onPressed: () {
                showPopover(
                    context: context,
                    bodyBuilder: (context) => Container(
                          padding: const EdgeInsets.only(top: 30, bottom: 20),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              MenuItem(
                                text: 'Case Details',
                                color: Colors.white.withOpacity(0.5),
                                ontap: () {
                                  Navigator.pushReplacement(
                                    context,
                                    PageTransition(
                                      type: PageTransitionType.fade,
                                      child: const ViewCaseWidget(),
                                    ),
                                  );
                                },
                              ),
                              MenuItem(
                                  text: 'Files',
                                  color: Colors.white.withOpacity(1.0),
                                  ontap: () {
                                    Navigator.pushReplacement(
                                        context,
                                        PageTransition(
                                          type: PageTransitionType.fade,
                                          child: const FilesWidget(),
                                        ));
                                  }),
                              MenuItem(
                                text: 'Chat Box',
                                color: Colors.white.withOpacity(0.5),
                                ontap: () {
                                  Navigator.pushReplacement(
                                    context,
                                    PageTransition(
                                      type: PageTransitionType.fade,
                                      child: const ChatBoxWidget(),
                                    ),
                                  );
                                },
                              ),
                              MenuItem(
                                text: 'Notes',
                                color: Colors.white.withOpacity(0.5),
                                ontap: () {
                                  Navigator.pushReplacement(
                                    context,
                                    PageTransition(
                                      type: PageTransitionType.fade,
                                      child: const NotesScreenWidget(),
                                    ),
                                  );
                                },
                              ),
                              MenuItem(
                                text: 'Hearing Summary',
                                color: Colors.white.withOpacity(0.5),
                                ontap: () {
                                  Navigator.pushReplacement(
                                    context,
                                    PageTransition(
                                      type: PageTransitionType.fade,
                                      child: const HearingSummaryWidget(),
                                    ),
                                  );
                                },
                              ),
                              MenuItem(
                                text: 'Logs',
                                color: Colors.white.withOpacity(0.5),
                                ontap: () {
                                  Navigator.pushReplacement(
                                    context,
                                    PageTransition(
                                      type: PageTransitionType.fade,
                                      child: const LogsWidget(),
                                    ),
                                  );
                                },
                              ),
                            ].divide(const SizedBox(height: 16)),
                          ),
                        ),
                    direction: PopoverDirection.left,
                    width: 250,
                    height: 230,
                    arrowHeight: 15,
                    arrowWidth: 30,
                    backgroundColor: Colors.black);
              },
              backgroundColor: Colors.black,
              elevation: 8,
              child:
                  const Icon(Icons.menu_rounded, color: Colors.white, size: 32),
            ),
          ),
        ),
        backgroundColor: Colors.white,
        body: SafeArea(
          top: true,
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          context.pushNamed('View_case');
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            border: Border.all(
                              color: FlutterFlowTheme.of(context).primaryText,
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(8),
                            child: Icon(
                              Icons.arrow_back,
                              color: FlutterFlowTheme.of(context).primaryText,
                              size: 20,
                            ),
                          ),
                        ),
                      ),
                      // Generated code for this Container Widget...
                      Container(
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          border: Border.all(
                            color: FlutterFlowTheme.of(context).primaryText,
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(8),
                          child: Icon(
                            Icons.help_outline_rounded,
                            color: FlutterFlowTheme.of(context).primaryText,
                            size: 20,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Icon(
                          Icons.grid_view,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 24.0,
                        ),
                        Icon(
                          Icons.list_outlined,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 24.0,
                        ),
                      ].divide(const SizedBox(width: 12.0)),
                    ),
                    InkWell(
                      onTap: isUploading ? null : _uploadFile,
                      child: Container(
                        decoration: BoxDecoration(color: Colors.black),
                        child: Padding(
                          padding: EdgeInsets.all(8),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              if (isUploading)
                                SizedBox(
                                  width: 18,
                                  height: 18,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                    color: Colors.white,
                                  ),
                                )
                              else
                                Icon(Icons.add, color: Colors.white, size: 18),
                              SizedBox(
                                  width:
                                      8), // Spacing between icon/loading and text
                              Text(
                                isUploading ? 'Uploading...' : 'Upload',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'DM Sans',
                                      color: Colors.white,
                                      letterSpacing: 0,
                                      fontWeight: FontWeight.w400,
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: FutureBuilder(
                    future: _future,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(
                          child: CircularProgressIndicator(color: Colors.black),
                        );
                      } else if (snapshot.hasError) {
                        return Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                'assets/images/no_internet.svg',
                                height: 100,
                                width: 100,
                              ),
                              Text('No Connection',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500))
                            ],
                          ),
                        );
                      } else {
                        return _model.listDocumentData.isNotEmpty
                            ? Column(
                                children: [
                                  Expanded(
                                    child: GridView.builder(
                                      physics:
                                          const AlwaysScrollableScrollPhysics(),
                                      gridDelegate:
                                          SliverGridDelegateWithFixedCrossAxisCount(
                                              crossAxisCount: 2),
                                      itemCount: _model.listDocumentData.length,
                                      itemBuilder: (context, index) {
                                        return Padding(
                                          padding: const EdgeInsets.all(8),
                                          child: FileComponent(
                                            document:
                                                _model.listDocumentData[index],
                                            onDelete: () async {
                                              await _deleteFile();
                                              if (!_model.error &&
                                                  _model.message.isNotEmpty) {
                                                Navigator.push<void>(
                                                  context,
                                                  MaterialPageRoute<void>(
                                                    builder: (BuildContext
                                                            context) =>
                                                        const FilesWidget(),
                                                  ),
                                                );
                                              }
                                            },
                                            onDownload: () async {
                                              await _model
                                                  .fetchDownloadFileData(
                                                      key: SharedPrefernce
                                                          .getfileKey());
                                              await downloadFile(); // Ensure state updates after this
                                              setState(
                                                  () {}); // Update UI after starting the download
                                            },
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                  if (status != null)
  Padding(
    padding: const EdgeInsets.all(16.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (status == DownloadTaskStatus.running || status == DownloadTaskStatus.paused)
          Column(
            children: [
              LinearProgressIndicator(
                value: progress > 0 ? progress / 100 : null, // Fix for build APK
                minHeight: 5,
                backgroundColor: Colors.grey[300],
                color: Colors.blue,
              ),
              const SizedBox(height: 10),
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 500), // Ensures smooth updates
                child: Text(
                  "$progress% Downloaded",
                  key: ValueKey<int>(progress), // Forces rebuild in release mode
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (status == DownloadTaskStatus.running)
              ElevatedButton(
                onPressed: pauseDownload,
                child: const Text('Pause'),
              ),
            if (status == DownloadTaskStatus.paused)
              ElevatedButton(
                onPressed: resumeDownload,
                child: const Text('Resume'),
              ),
            if (status != DownloadTaskStatus.complete)
              ElevatedButton(
                onPressed: cancelDownload,
                child: const Text('Cancel'),
              ),
          ].divide(const SizedBox(width: 12)),
        ),
        if (status == DownloadTaskStatus.complete)
          const Padding(
            padding: EdgeInsets.only(top: 10),
            child: Text(
              'Download completed successfully',
              style: TextStyle(
                color: Colors.green,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
      ],
    ),
  ),


                                ],
                              )
                            : Center(
                                child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [Text('No Files')],
                              ));
                      }
                    },
                  ),
                ),
                if (ishasMoreLoading)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Center(
                        child: CircularProgressIndicator(color: Colors.black)),
                  )
              ].divide(const SizedBox(height: 24.0)),
            ),
          ),
        ),
      ),
    );
  }
}
