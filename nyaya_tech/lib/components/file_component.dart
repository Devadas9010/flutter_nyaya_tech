import 'dart:io';
import 'dart:isolate';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:nyaya_tech/responses/get_list_documents_response.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:nyaya_tech/data_components/shared_preference.dart';

class FileComponent extends StatefulWidget {
  final ListDocumentData document;
  final Function() onDelete;
  final Function() onDownload;

  const FileComponent({
    super.key,
    required this.document,
    required this.onDelete,
    required this.onDownload,
  });

  @override
  _FileComponentState createState() => _FileComponentState();
}

class _FileComponentState extends State<FileComponent> {
  String fileId = "";
  int progress = 0;
  DownloadTaskStatus? status;
  ReceivePort _port = ReceivePort();
  late ListDocumentData document; // Destructure the widget.document

  @override
  void initState() {
    super.initState();
    document = widget.document; // Initialize the document

    IsolateNameServer.registerPortWithName(
        _port.sendPort, 'downloader_send_port');

    _port.listen((dynamic data) {
      setState(() {
        fileId = data[0];
        status = DownloadTaskStatus.fromInt(data[1]);
        progress = data[2];
      });

      if (status == DownloadTaskStatus.complete) {
        print('Download Completed');
      } else if (status == DownloadTaskStatus.running) {
        print('Download is running');
      } else if (status == DownloadTaskStatus.paused) {
        print('paused');
      } else if (status == DownloadTaskStatus.failed) {
        print('Failed');
      }
    });

    FlutterDownloader.registerCallback(downloadCallback);
  }

  @override
  void dispose() {
    IsolateNameServer.removePortNameMapping('downloader_send_port');
    super.dispose();
  }

  static void downloadCallback(String id, int status, int progress) {
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

  Future<void> startDownload() async {
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

  @override
  Widget build(BuildContext context) {
    IconData fileIcon = Icons.insert_drive_file;
    Color backgroundColor = const Color(0x14003FE9);

    if (document.fileType!.contains('pdf')) {
      fileIcon = Icons.picture_as_pdf;
      backgroundColor = Color(0XFFD7120A).withOpacity(0.1);
    } else if (document.fileType!.contains('image')) {
      fileIcon = Icons.image;
      backgroundColor = Color(0XFF5C30CD).withOpacity(0.1);
    } else if (document.fileType!.contains('text')) {
      fileIcon = Icons.text_snippet;
      backgroundColor = Color(0XFFFF5C00).withOpacity(0.1);
    } else if (document.fileType!.contains('word')) {
      fileIcon = Icons.description;
      backgroundColor = Color(0XFF003FE9).withOpacity(0.1);
    }

    return InkWell(
      onTap: () {
        SharedPrefernce.setfileId(document.id.toString());
      },
      child: Container(
        decoration: BoxDecoration(
          color: backgroundColor,
          border: Border.all(color: const Color(0x3B000000)),
        ),
        alignment: AlignmentDirectional.center,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Icon(fileIcon, size: 40, color: Colors.blue),

                  // Show progress indicator and buttons only when downloading
                  if (status == DownloadTaskStatus.running ||
                      status == DownloadTaskStatus.paused)
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 35,
                          height: 35,
                          child: Center(),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          "$progress%",
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 5),

                        // Pause & Cancel buttons (Only when downloading)
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              if (status == DownloadTaskStatus.running)
                                IconButton(
                                  icon: const Icon(Icons.pause_circle_outline,
                                      color: Colors.orange),
                                  onPressed: pauseDownload,
                                ),
                              if (status == DownloadTaskStatus.paused)
                                IconButton(
                                  icon: const Icon(Icons.play_circle_outline,
                                      color: Colors.green),
                                  onPressed: resumeDownload,
                                ),
                              if (status != DownloadTaskStatus.complete)
                                IconButton(
                                  icon: const Icon(Icons.cancel,
                                      color: Colors.red),
                                  onPressed: cancelDownload,
                                ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  if (status == DownloadTaskStatus.complete)
                    Padding(
                      padding: EdgeInsets.all(8),
                      child: Text('Download complete'),
                    ),
                ],
              ),
            ),
            Container(
              decoration: const BoxDecoration(color: Colors.white),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 1),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        document.filename.toString(),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    PopupMenuButton<String>(
                      onSelected: (value) async {
                        if (value == 'Delete') {
                          SharedPrefernce.setfileId(document.id.toString());
                          widget.onDelete();
                        } else if (value == 'Download') {
                          SharedPrefernce.sets3Url(document.key.toString());
                          SharedPrefernce.setfileName(
                              document.filename.toString());
                          SharedPrefernce.setfileSize(
                              document.fileSize!.toInt());
                              widget.onDownload();
                        //  startDownload();
                        }
                      },
                      itemBuilder: (context) => [
                        PopupMenuItem(value: 'Delete', child: Text('Delete')),
                        PopupMenuItem(
                            value: 'Download', child: Text('Download')),
                      ],
                      icon: const Icon(Icons.more_horiz),
                      elevation: 8,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}