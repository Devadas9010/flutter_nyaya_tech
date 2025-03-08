// Importing Dart Packages.
import 'dart:io';
import 'dart:ui';
import 'dart:typed_data';
import 'dart:convert';
// import 'dart:isolate';

// Importing Predefined Packages.
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path_provider_foundation/messages.g.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:dio/dio.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';

// Importing Userdefined Modules.
import 'package:nyaya_tech/backend/custom_response.dart';
import 'package:nyaya_tech/backend/services/files_upload_api.dart';
import 'package:nyaya_tech/data_components/get_routing.dart';
import 'package:nyaya_tech/data_components/shared_prefernce.dart';
import 'package:nyaya_tech/dtos/file_upload_dto.dart';
import 'package:nyaya_tech/pages/login_page/files/preview_widget.dart';
import 'package:nyaya_tech/pages/login_page/view_case/drafting_and_signing_model.dart';
import 'package:nyaya_tech/response/caes_dox_response.dart';
import 'package:nyaya_tech/response/caes_dox_response.dart';
import 'package:nyaya_tech/response/caes_dox_response.dart';
import 'package:nyaya_tech/response/file_upload_response.dart';
import 'package:nyaya_tech/response/s3_upload_respons.dart';

// Importing the FlutterFlow Module.
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';

// Defining DraftingWidget Class.
class DraftingWidget extends StatefulWidget {
  const DraftingWidget({super.key});

  @override
  State<DraftingWidget> createState() => _DraftingWidgetState();
}

class _DraftingWidgetState extends State<DraftingWidget> {
  late DraftingModel _model;
  late ScrollController _scrollController;
  late Future<void> _future;

  bool isUploading = false;
  bool isLoading = false;
  bool refreshLoading = false;
  bool Loading = false;
  bool ishasMoreLoading = false;
  bool loading = false;

  int progress = 0;

  String uploadMessage = "";
  String? filePath;
  String fileId = "";
  String? downloadError;

  DownloadTaskStatus? status;

  List<Documents> docs = [];

  final Dio dio = Dio();

  // ReceivePort _port = ReceivePort();
  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DraftingModel());
    _scrollController = ScrollController();
    _future = fetchData();

    /*
    _initializeDownloader();
    IsolateNameServer.registerPortWithName(
        _port.sendPort, 'downloader_send_port');

    _port.listen((dynamic data) {
      if (mounted) {
        setState(() {
          fileId = data[0];
          status = DownloadTaskStatus.fromInt(data[1]);
          progress = data[2];

          if (status == DownloadTaskStatus.failed) {
            downloadError = "Download failed";
          } else if (status == DownloadTaskStatus.complete) {
            downloadError = null;
          }
        });
      }
    });
  */
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {}
    });
  }

  Future<void> _initializeDownloader() async {
    await FlutterDownloader.initialize(
      debug: true,
      ignoreSsl: false,
    );
    // FlutterDownloader.registerCallback(downloadCallback);
  }
  /*
  @pragma('vm:entry-point')
  static void downloadCallback(String id, int status, int progress) {
    final SendPort? send =
        IsolateNameServer.lookupPortByName('downloader_send_port');
    send?.send([id, status, progress]);
  }
  */

  /*
    Method Name : async requestPermission()
    Parms       : void
    Return Type : bool type - Allowed or Not on files.
    Use         : Async requestPermission() is used for file storage with granted permistions with bool retunr type.
  */
  Future<bool> requestPermission() async {
    if (Platform.isAndroid) {
      final androidInfo = await DeviceInfoPlugin().androidInfo;
      Map<Permission, PermissionStatus> statuses;

      if (androidInfo.version.sdkInt >= 33) {
        statuses = await [
          Permission.storage,
          Permission.notification,
        ].request();
      } else {
        statuses = await [
          Permission.storage,
          Permission.manageExternalStorage,
        ].request();
      }

      return statuses[Permission.storage]!.isGranted &&
          statuses[Permission.notification]!.isGranted;
    }
    return true;
  }

  Future<void> downloadFile() async {
    try {
      if (await requestPermission()) {
        setState(() {
          downloadError = "Permissions denied";
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content:
                  Text("Please grant storage and notification permissions")),
        );
        return;
      }

      String? s3Url = SharedPrefernce.getsdownloadS3Url();
      String? fileName = SharedPrefernce.getdownloadfileName();

      if (s3Url == null || fileName == null) {
        setState(() {
          downloadError = "Invalid file URL or name";
        });
        return;
      }

      final directory =
          await getExternalStoragePublicDirectory(DirectoryType.downloads) ??
              await getExternalStorageDirectory();

      if (directory == null) {
        setState(() {
          downloadError = "Unable to access storage directory";
        });
        return;
      }

      final saveDir = Directory("/storage/emulated/0/Nyaya_Tech");
      if (!await saveDir.exists()) {
        await saveDir.create(recursive: true);
      }

      setState(() {
        downloadError = null;
        status = DownloadTaskStatus.running;
      });
      print('s3url --${s3Url}');
      print('filename --${fileName}');
      final taskId = await FlutterDownloader.enqueue(
        url: s3Url,
        savedDir: saveDir.path,
        fileName: fileName,
        showNotification: true,
        openFileFromNotification: true,
        saveInPublicStorage: true,
      );

      if (taskId != null) {
        setState(() {
          fileId = taskId;
        });
      }
    } catch (e) {
      setState(() {
        downloadError = "Download error: $e";
        status = DownloadTaskStatus.failed;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Download failed: $e")),
      );
    }
  }

  Future<Directory?> getExternalStoragePublicDirectory(
      DirectoryType type) async {
    try {
      final dir = await getExternalStorageDirectory();
      return dir;
    } catch (e) {
      return null;
    }
  }

// Future<bool> requestPermission() async {
//     if (Platform.isAndroid) {
//       if (await Permission.notification.request().isGranted) {
//         return true;
//       } else {
//         return false;
//       }
//     }
//     return true;
//   }

//   Future<void> downloadFile() async {
//     if (await requestPermission()) {
//       String? s3Url = SharedPrefernce.getsdownloadS3Url();
//       String? fileName = SharedPrefernce.getdownloadfileName();

//       if (Platform.isAndroid &&
//           await Permission.manageExternalStorage.request().isDenied) {
//         print('Storage permission denied');
//         return;
//       }

//       if (s3Url == null || fileName == null) {
//         print('Invalid URL or file name');
//         return;
//       }

//       String downloadPath = "/storage/emulated/0/Nyaya_Tech";
//       Directory directory = Directory(downloadPath);
//       if (!await directory.exists()) {
//         await directory.create(recursive: true);
//       }

//       try {
//         print('s3url -- ${s3Url}');
//         final id = await FlutterDownloader.enqueue(
//           url: s3Url,
//           savedDir: downloadPath,
//           fileName: fileName,
//           showNotification: true,
//           openFileFromNotification: true,
//           allowCellular: true,
//           requiresStorageNotLow: true,
//         );

//         setState(() {
//           fileId = id!;
//           status = DownloadTaskStatus.running;
//         });

//         // Show a notification with pause and cancel actions
//         // await _showDownloadNotification(fileId, fileSize, progress);

//         print('Download started with ID: $fileId');
//       } catch (e) {
//         print('Download failed: $e');
//       }
//     } else {
//       print('Permission denied');
//     }
//   }

  @override
  void dispose() {
    IsolateNameServer.removePortNameMapping('downloader_send_port');
    _scrollController.dispose();
    super.dispose();
  }

  Future<void> fetchListDocumentsData() async {
    CustomResponse<ListCaseDox> response = await ListDocumentsApi().call();
    if (response.statusCode == 200) {
      docs = response.data!.data!.records!;
    } else {
      throw Exception('error');
    }
  }

  Future<void> fetchData() async {
    setState(() => isLoading = true);
    try {
      await _model.fetchListDocumentData();
    } finally {
      setState(() => isLoading = false);
    }
  }

  Future<void> _refreshDox() async {
    setState(() => refreshLoading = true);
    try {
      await _model.fetchListDocumentData();
    } finally {
      setState(() => refreshLoading = false);
    }
  }

  Future<void> _uploadFile() async {
    try {
      setState(() {
        isUploading = true;
        isLoading = true;
        uploadMessage = "";
      });

      final selectedFiles = await FilePicker.platform.pickFiles(
        type: FileType.any,
        allowMultiple: true,
      );

      if (selectedFiles != null && selectedFiles.files.isNotEmpty) {
        for (PlatformFile file in selectedFiles.files) {
          setState(() => uploadMessage = "Uploading ${file.name}...");

          Uint8List? fileBytes =
              file.bytes ?? await File(file.path!).readAsBytes();
          String base64Content = base64Encode(fileBytes);

          FileUploadDto fileUploadObject = FileUploadDto(
            fileType: file.extension ?? 'unknown',
            fileName: file.name,
            fileSize: file.size,
            fileContent: base64Content,
          );

          CustomResponse<S3UploadResponse> response =
              await FilesUploadApi().call(fileDto: fileUploadObject);
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
              stage: "Case Filing",
              sub_stage: "Signing",
              file_name: file.name,
              file_size: file.size,
              key: fileKey,
            );

            setState(() {
              uploadMessage = isUpdated
                  ? "${file.name} uploaded successfully!"
                  : "${file.name} uploaded but failed to update S3.";
            });
          }
        }
        await fetchData();
      }
    } catch (e) {
      setState(() => uploadMessage = "Error uploading file: $e");
    } finally {
      setState(() {
        isUploading = false;
        isLoading = false;
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
      default:
        return 'application/octet-stream';
    }
  }

  Future<bool> _updateS3Url(
      String s3Url, Uint8List fileContent, String? fileExtension) async {
    try {
      final response = await http.put(
        Uri.parse(s3Url),
        headers: {'Content-Type': _getMimeType(fileExtension)},
        body: fileContent,
      );
      return response.statusCode == 200;
    } catch (e) {
      return false;
    }
  }

  IconData _getFileIcon(String extension) {
    switch (extension.toLowerCase()) {
      case 'pdf':
        return Icons.picture_as_pdf;
      case 'jpg':
      case 'jpeg':
      case 'png':
        return Icons.image;
      case 'doc':
      case 'docx':
        return Icons.description;
      default:
        return Icons.insert_drive_file;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      InkWell(
                        onTap: () {
                          Get.back();
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
                              size: 24,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  'Drafting and Signing Approval',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'DM Sans',
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                ),
                SizedBox(height: 8),
                Text(
                  'You have successfully uploaded the required documents. The final draft will be prepared for your review and signing',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'DM Sans',
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                ),
                SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton.icon(
                          onPressed: isUploading ? null : _uploadFile,
                          icon: isUploading
                              ? SizedBox(
                                  width: 18,
                                  height: 18,
                                  child: CircularProgressIndicator(
                                      color: Colors.black),
                                )
                              : Icon(Icons.add),
                          label: Text(isUploading ? 'Uploading...' : 'Upload'),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.black),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 16),
                Expanded(
                  child: RefreshIndicator(
                    onRefresh: _refreshDox,
                    child: SingleChildScrollView(
                      physics: AlwaysScrollableScrollPhysics(),
                      child: FutureBuilder<void>(
                        future: _future,
                        builder: (context, snapshot) {
                          if (isLoading ||
                              snapshot.connectionState ==
                                  ConnectionState.waiting) {
                            return Center(
                              child: Lottie.asset(
                                'assets/lottie_animations/loading_animation.json',
                                width: 150,
                                height: 150,
                              ),
                            );
                          } else if (snapshot.hasError) {
                            return Center(
                              child: Text('No connection'),
                            );
                          }
                          if (_model.documentData.isEmpty) {
                            return Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                    'assets/images/No_Files1.svg',
                                    height: 100,
                                    width: 100,
                                  ),
                                  SizedBox(height: 16),
                                  Text('No Documents Available'),
                                ],
                              ),
                            );
                          }
                          return Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ..._model.documentData.map((doc) {
                                final isImage = ['jpg', 'jpeg', 'png']
                                    .contains(doc.fileType?.toLowerCase());
                                return Container(
                                  width: 220,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Color(0xFFDADADA),
                                    ),
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          SharedPrefernce.setfileId(
                                              doc.id.toString());
                                          Get.toNamed(Routes.preview);
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                          ),
                                          child: Padding(
                                            padding: EdgeInsets.all(4),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(0),
                                              child: isImage
                                                  ? Image.network(
                                                      doc.downloadUrl ?? '',
                                                      fit: BoxFit.cover,
                                                      errorBuilder: (context,
                                                              error,
                                                              stackTrace) =>
                                                          Center(
                                                        child: Icon(
                                                          _getFileIcon(
                                                              doc.fileType ??
                                                                  ''),
                                                          size: 20,
                                                          color:
                                                              Colors.grey[600],
                                                        ),
                                                      ),
                                                    )
                                                  : Center(
                                                      child: Icon(
                                                        
                                                        _getFileIcon(
                                                            doc.fileType ?? ''),
                                                        size: 40,
                                                        
                                                        color: Colors.grey[600],
                                                      ),
                                                    ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  12, 10, 12, 10),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                '${doc.fileName}',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'DM Sans',
                                                          color:
                                                              Color(0xFF1E293B),
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                              ),
                                              Divider(
                                                thickness: 1,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .alternate,
                                              ),
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    '${doc.createdAt == null ? '--' : DateFormat('dd-MM-yyyy').format(DateTime.tryParse(doc.createdAt.toString()) ?? DateTime.now())}   |   ${doc.fileSize != null ? (doc.fileSize! / 1024).toStringAsFixed(2) : "0"} KB',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'DM Sans',
                                                          fontSize: 12,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                  ),
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(0),
                                                        child: InkWell(
                                                          onTap: () async {
                                                            SharedPrefernce
                                                                .setsdownloadS3Url(doc
                                                                    .downloadUrl
                                                                    .toString());
                                                            SharedPrefernce
                                                                .setdownloadfileName(doc
                                                                    .fileName
                                                                    .toString());
                                                            await downloadFile();
                                                          },
                                                          child: Icon(
                                                              Icons.download),
                                                        ),
                                                      ),
                                                    ].divide(
                                                        SizedBox(width: 3)),
                                                  ),
                                                ],
                                              ),
                                            ].divide(SizedBox(height: 12)),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              }).toList(),
                            ],
                          );
                        },
                      ),
                    ),
                  ),
                ),
                Padding(
                    padding: EdgeInsets.only(top: 16),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        FFButtonWidget(
                          onPressed: () {
                            print('Button pressed ...');
                          },
                          text: 'Submit',
                          options: FFButtonOptions(
                            height: 40,
                            padding:
                                EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                            iconPadding:
                                EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                            color: FlutterFlowTheme.of(context).primaryText,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Poppins',
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.normal,
                                ),
                            elevation: 0,
                            borderRadius: BorderRadius.circular(0),
                          ),
                        ),
                      ],
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// enum DirectoryType {
//   downloads,
// }
