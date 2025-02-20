import 'dart:convert';
import 'dart:io';
import 'dart:isolate';
import 'dart:math';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
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




final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

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
  int fileSize = SharedPrefernce.getfileSize();

  String _getStatusName(int statusCode) {
    switch (statusCode) {
      case 0:
        return 'Undefined';
      case 1:
        return 'Enqueued';
      case 2:
        return 'Running';
      case 3:
        return 'Complete';
      case 4:
        return 'Failed';
      case 5:
        return 'Canceled';
      case 6:
        return 'Paused';
      default:
        return 'Unknown';
    }
  }

  Future<void> fetchData() async {
    await _model.fetchListDocumentData();
  }

  Future<void> _deleteFile() async {
    await _model.fetchDeleteFileData();
  }

  @override
  void initState() {
    super.initState();

    // Initialize Flutter Local Notifications
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    const InitializationSettings initializationSettings =
        InitializationSettings(
      android: initializationSettingsAndroid,
    );

    flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (NotificationResponse response) async {
        // Handle notification tap
        if (response.payload != null) {
          debugPrint('Notification payload: ${response.payload}');

          // Handle actions based on the action ID
          switch (response.actionId) {
            case 'pause':
              await pauseDownload();
              break;
            case 'resume':
              await resumeDownload();
              break;
            case 'cancel':
              await cancelDownload();
              break;
            default:
              // Handle default case (e.g., open the file when download is complete)
              break;
          }
        }
      },
    );

    // Register download callback
    IsolateNameServer.registerPortWithName(
        _port.sendPort, 'downloader_send_port');

    _port.listen((dynamic data) {
      if (mounted) {
        setState(() {
          fileId = data[0];
          status = DownloadTaskStatus.fromInt(data[1]);
          progress = data[2];
        });

        String statusName = _getStatusName(data[1]);
        print("Download Update - ID: $fileId, Status: $statusName, Progress: $progress");

        if (status == DownloadTaskStatus.paused) {
          _updateNotification(fileId, 'Download Paused', 'Tap to resume');
        } else if (status == DownloadTaskStatus.running) {
          _showDownloadNotification(fileId, fileSize, progress);
        } else if (status == DownloadTaskStatus.failed) {
          _updateNotification(fileId, 'Download Failed', 'Please retry');
        } else if (status == DownloadTaskStatus.complete) {
          _updateNotification(fileId, 'Download Complete', 'Tap to open');
        } else if (status == DownloadTaskStatus.canceled) {
          _updateNotification(fileId, 'Download Canceled', 'Download stopped');
        }
      }
    });

    FlutterDownloader.registerCallback(downloadCallback);
    _model = createModel(context, () => FilesModel());
    _future = fetchData();
    initializeBackgroundService();
  }

  @pragma('vm:entry-point')
  static void downloadCallback(String id, int status, int progress) {
    String _getStatusName(int statusCode) {
      switch (statusCode) {
        case 0:
          return 'Undefined';
        case 1:
          return 'Enqueued';
        case 2:
          return 'Running';
        case 3:
          return 'Complete';
        case 4:
          return 'Failed';
        case 5:
          return 'Canceled';
        case 6:
          return 'Paused';
        default:
          return 'Unknown';
      }
    }
    String statusName = _getStatusName(status);
    print("Download Callback - ID: $id, Status: $statusName, Progress: $progress");

    final SendPort? send = IsolateNameServer.lookupPortByName('downloader_send_port');
    send?.send([id, status, progress]);
  }

  Future<void> initializeBackgroundService() async {
    final service = FlutterBackgroundService();

    await service.configure(
      iosConfiguration: IosConfiguration(
        autoStart: true,
        onForeground: onStart,
        onBackground: onIosBackground,
      ),
      androidConfiguration: AndroidConfiguration(
        onStart: onStart,
        isForegroundMode: true,
        autoStart: true,
        autoStartOnBoot: true,
      ),
    );
    service.startService();
  }

  @pragma('vm:entry-point')
  void onStart(ServiceInstance service) async {
    if (service is AndroidServiceInstance) {
      service.on('pauseDownload').listen((event) async {
        await pauseDownload();
      });

      service.on('resumeDownload').listen((event) async {
        await resumeDownload();
      });

      service.on('cancelDownload').listen((event) async {
        await cancelDownload();
      });
    }
  }

  @pragma('vm:entry-point')
  Future<bool> onIosBackground(ServiceInstance service) async {
    return true;
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
      int? fileSize = SharedPrefernce.getfileSize();
      if (Platform.isAndroid &&
          await Permission.manageExternalStorage.request().isDenied) {
        print('Storage permission denied');
        return;
      }

      if (s3Url == null || fileName == null || fileSize == null) {
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
          showNotification: false,
          openFileFromNotification: true,
          allowCellular: true,
          requiresStorageNotLow: true,
        );

        setState(() {
          fileId = id!;
          status = DownloadTaskStatus.running;
        });

        // Show a notification with pause and cancel actions
        await _showDownloadNotification(fileId, fileSize, progress);

        print('Download started with ID: $fileId');
      } catch (e) {
        print('Download failed: $e');
      }
    } else {
      print('Permission denied');
    }
  }

  Future<void> _showDownloadNotification(String id, int fileSize, int progress) async {
    double downloadedSize = (progress / 100) * fileSize;

    final AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      'download_channel',
      'Download Notifications',
      channelDescription: 'File download progress',
      importance: Importance.max,
      priority: Priority.high,
      showWhen: false,
      enableVibration: false,
      onlyAlertOnce: true,
      showProgress: true,
      maxProgress: 100,
      progress: progress,
      indeterminate: progress == 0,
      actions: [
        if (status == DownloadTaskStatus.running)
          AndroidNotificationAction('pause', 'Pause', cancelNotification: false),
        if (status == DownloadTaskStatus.paused)
          AndroidNotificationAction('resume', 'Resume', cancelNotification: false),
        if (status != DownloadTaskStatus.complete)
          AndroidNotificationAction('cancel', 'Cancel', cancelNotification: true),
      ],
    );

    final NotificationDetails platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);

    await flutterLocalNotificationsPlugin.show(
      0,
      'Downloading File',
      '${_formatFileSize(downloadedSize.round())} / ${_formatFileSize(fileSize)}',
      platformChannelSpecifics,
      payload: id,
    );
  }

  String _formatFileSize(int bytes) {
    if (bytes <= 0) return "0 MB";
    const suffixes = ["B", "KB", "MB", "GB", "TB"];
    final i = (log(bytes) / log(1024)).floor();
    return '${(bytes / pow(1024, i)).toStringAsFixed(2)} ${suffixes[i]}';
  }

  Future<void> pauseDownload() async {
    if (fileId.isNotEmpty) {
      await FlutterDownloader.pause(taskId: fileId);
      setState(() {
        status = DownloadTaskStatus.paused;
      });
      await _updateNotification(fileId, 'Download Paused', 'Tap to resume');
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
        await _updateNotification(newTaskId, 'Downloading File', 'Download in progress...');
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
      await flutterLocalNotificationsPlugin.cancel(0);
      print("Download canceled: $fileId");
    }
  }

  Future<void> _updateNotification(String id, String title, String body) async {
    AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      'download_channel',
      'Download Notifications',
      channelDescription: 'Notifications for file downloads',
      importance: Importance.max,
      priority: Priority.high,
      showWhen: false,
      enableVibration: false,
      onlyAlertOnce: true,
      actions: [
        if (status == DownloadTaskStatus.running)
          AndroidNotificationAction('pause', 'Pause', cancelNotification: false),
        if (status == DownloadTaskStatus.paused)
          AndroidNotificationAction('resume', 'Resume', cancelNotification: false),
        if (status != DownloadTaskStatus.complete)
          AndroidNotificationAction('cancel', 'Cancel', cancelNotification: true),
      ],
    );
    NotificationDetails platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);

    await flutterLocalNotificationsPlugin.show(
      0,
      title,
      body,
      platformChannelSpecifics,
      payload: id,
    );
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
        // debugPrint("Failed to update S3 URL: ${response.body}");
        return false;
      }
    } catch (e) {
      // debugPrint("Error in PUT request: $e");
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
    future: _future, // Ensure this is properly initialized in initState()
    builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return const Center(
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
              const SizedBox(height: 10),
              const Text(
                'No Connection',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        );
      } else {
        return _model.listDocumentData.isNotEmpty
            ? Column(
                children: [
                  Expanded(
                    child: GridView.builder(
                      physics: const AlwaysScrollableScrollPhysics(),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                      ),
                      itemCount: _model.listDocumentData.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8),
                          child: FileComponent(
                            documents: _model.listDocumentData[index],
                            onDelete: () async {
                              await _deleteFile();
                              if (!_model.error && _model.message.isNotEmpty) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute<void>(
                                    builder: (BuildContext context) => const FilesWidget(),
                                  ),
                                );
                              }
                            },
                            onDownload: () async {
                              await downloadFile();
                              setState(() {}); // Ensure UI updates
                            },
                          ),
                        );
                      },
                    ),
                  ),

                  // Download Progress UI
                  if (status != null && status != DownloadTaskStatus.undefined)
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            if (status == DownloadTaskStatus.running || status == DownloadTaskStatus.paused)
                              Column(
                                children: [
                                  LinearProgressIndicator(
                                    value: progress / 100,
                                    minHeight: 5,
                                    backgroundColor: Colors.grey[300],
                                    color: Colors.blue,
                                  ),
                                  const SizedBox(height: 10),
                                  AnimatedSwitcher(
                                    duration: const Duration(milliseconds: 500),
                                    child: Text(
                                      "$progress% Downloaded",
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
                                if (status == DownloadTaskStatus.failed)
                                  ElevatedButton(
                                    onPressed: downloadFile,
                                    child: const Text('Start'),
                                  ),
                                const SizedBox(width: 5),
                                if (status == DownloadTaskStatus.running)
                                  ElevatedButton(
                                    onPressed: pauseDownload,
                                    child: const Text('Pause'),
                                  ),
                                const SizedBox(width: 10),
                                if (status == DownloadTaskStatus.paused)
                                  ElevatedButton(
                                    onPressed: resumeDownload,
                                    child: const Text('Resume'),
                                  ),
                                const SizedBox(width: 10),
                                if (status != DownloadTaskStatus.complete)
                                  ElevatedButton(
                                    onPressed: cancelDownload,
                                    child: const Text('Cancel'),
                                  ),
                              ],
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
                    ),
                ],
              )
            : const Center(
                child: Text('No Files'),
              );
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