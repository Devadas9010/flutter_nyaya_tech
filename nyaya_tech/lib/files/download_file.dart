
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:nyaya_tech/backend/custom_response.dart';
import 'package:nyaya_tech/backend/services/files_api.dart';
import 'package:nyaya_tech/data_components/shared_preference.dart';
import 'package:nyaya_tech/responses/download_file_response.dart';
import 'package:nyaya_tech/responses/file_upload_response.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class DownloadFileScreen extends StatefulWidget {
  @override
  _DownloadFileScreenState createState() => _DownloadFileScreenState();
}

class _DownloadFileScreenState extends State<DownloadFileScreen> {
  final Dio dio = Dio();
  bool loading = false;
  double progress = 0.0;
  String? filePath;
  String message = '';

  /// Request storage permission with Allow/Deny popup
  Future<bool> requestPermission() async {
    if (Platform.isAndroid) {
      PermissionStatus status =
          await Permission.manageExternalStorage.request();

      if (status.isGranted) {
        return true; // Permission granted
      } else if (status.isDenied) {
        _showPermissionDialog();
        return false;
      } else if (status.isPermanentlyDenied) {
        _showPermissionSettingsDialog();
        return false;
      }
    }
    return false;
  }

  /// Show permission denied popup
  void _showPermissionDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Storage Permission Required"),
        content: const Text(
            "This app needs storage access to download files. Please allow permission."),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Deny"),
          ),
          TextButton(
            onPressed: () async {
              Navigator.pop(context);
              await requestPermission(); // Retry permission request
            },
            child: const Text("Allow"),
          ),
        ],
      ),
    );
  }

  /// Show permanently denied permission settings popup
  void _showPermissionSettingsDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Storage Permission Denied"),
        content: const Text(
            "You have permanently denied storage access. Please enable it from settings."),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel"),
          ),
          TextButton(
            onPressed: () async {
              Navigator.pop(context);
              await openAppSettings(); // Open app settings
            },
            child: const Text("Open Settings"),
          ),
        ],
      ),
    );
  }

  /// Download file and save it in "Nyaya Tech" folder
 Future<bool> saveFile(String url, String fileName) async {
    Directory? directory;
    try {
      if (Platform.isAndroid) {
        if (await requestPermission()) {
          directory = await getExternalStorageDirectory();
          String newPath = "";

          List<String> paths = directory!.path.split("/");
          for (int x = 1; x < paths.length; x++) {
            String folder = paths[x];
            if (folder != "Android") {
              newPath += "/$folder";
            } else {
              break;
            }
          }

          newPath = "$newPath/Nyaya Tech/Downloads";
          directory = Directory(newPath);

          if (!await directory.exists()) {
            await directory.create(recursive: true);
          }

          // Ensure proper file path
          File saveFile = File("${directory.path}/$fileName");

          await dio.download(url, saveFile.path,
              onReceiveProgress: (received, total) {
            setState(() {
              progress = total != 0 ? received / total : 0;
            });
          });

          setState(() {
            filePath = saveFile.path;
          });

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('File saved at: ${saveFile.path}')),
          );

          return true;
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Storage permission denied')),
          );
          return false;
        }
      }
    } catch (e) {
      print("Error saving file: $e");
      return false;
    }
    return false;
  }

  void downloadFile() async {
    setState(() {
      loading = true;
      progress = 0;
    });

    String? s3Url = SharedPrefernce.gets3Url();
    String? fileName = SharedPrefernce.getfileName();
   

    if (s3Url == null || s3Url.isEmpty || fileName == null) {
      setState(() {
        loading = false;
      });
      print("S3 URL, Filename, or File Size is missing!");
      return;
    }

    bool downloaded = await saveFile(s3Url, fileName);

    setState(() {
      loading = false;
      filePath = downloaded ? "File saved : ${fileName}" : null;
    });

    if (downloaded) {
      print("File Downloaded Successfully!");
    } else {
      print("Download Failed.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Download File")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (loading)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: LinearProgressIndicator(
                  minHeight: 10,
                  value: progress,
                ),
              ),
            if (!loading)
              ElevatedButton.icon(
                icon: const Icon(Icons.download_rounded, color: Colors.white),
                label: const Text(
                  "Download File",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(10),
                  backgroundColor: Colors.blue,
                ),
                onPressed: downloadFile,
              ),
            if (filePath != null)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  filePath!,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
          ],
        ),
      ),
    );
  }


  Future<void> fetchDownloadFileData() async {
    CustomResponse<DownloadFileResponse> response =
        await DownloadFileApi().call(key: SharedPrefernce.getfileKey());
    if (response.statusCode == 200) {
      message = response.data!.message.toString();
    } else {
      message = response.data!.message.toString();
    }
  }
}
