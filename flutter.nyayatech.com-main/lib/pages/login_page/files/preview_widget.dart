import 'dart:io';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:excel/excel.dart';
import 'package:get/get.dart';
import 'package:nyaya_tech/data_components/shared_prefernce.dart';
import 'package:nyaya_tech/flutter_flow/flutter_flow_model.dart';
import 'package:nyaya_tech/pages/login_page/files/files_model.dart';
import 'package:docx_file_viewer/docx_file_viewer.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;
import 'package:photo_view/photo_view.dart';

class PreviewWidget extends StatefulWidget {
  const PreviewWidget({super.key});

  @override
  State<PreviewWidget> createState() => _PreviewWidgetState();
}

class _PreviewWidgetState extends State<PreviewWidget> {
  late FilesModel _model;
  late Future<void> _fetchFuture;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FilesModel());
    _fetchFuture = _model.fetchSingle();
  }

  Future<String?> _downloadFile(String url) async {
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final directory = await getTemporaryDirectory();

        final uri = Uri.parse(url);
        final fileName = uri.pathSegments.last.split('?').first;

        final filePath = '${directory.path}/$fileName';

        final file = File(filePath);
        await file.writeAsBytes(response.bodyBytes);
        return file.path;
      } else {
        debugPrint('Failed to download file: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      debugPrint('Error downloading file: $e');
      return null;
    }
  }

  Widget _buildFilePreview(String fileType, String? fileUrl) {
    print('fileType -- ${fileType}');
    print('fileUrl -- ${fileUrl}');
    switch (fileType.toLowerCase()) {
      case 'jpeg':
      case 'png':
      case 'jpg':
      case 'image/jpeg':
        return SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.8,
          child: PhotoView(
            imageProvider: NetworkImage(fileUrl ?? ''),
            errorBuilder: (context, error, stackTrace) =>
                const Icon(Icons.broken_image),
            backgroundDecoration: const BoxDecoration(color: Colors.white),
            minScale: PhotoViewComputedScale.contained,
            maxScale: PhotoViewComputedScale.covered * 2,
          ),
        );
      case 'xlsx':
      case 'xls':
        return fileUrl != null
            ? FutureBuilder<String?>(
                future: _downloadFile(fileUrl),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError || snapshot.data == null) {
                    return const Center(
                        child: Text('Failed to load Excel file'));
                  } else {
                    final bytes = File(snapshot.data!).readAsBytesSync();
                    final excel = Excel.decodeBytes(bytes);
                    return SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: excel.tables.entries.map((entry) {
                          final table = entry.value;
                          return DataTable(
                            columns: table.rows.first
                                .map((e) => DataColumn(
                                    label: Text(e!.value.toString())))
                                .toList(),
                            rows: table.rows
                                .skip(1)
                                .map((row) => DataRow(
                                      cells: row
                                          .map((cell) => DataCell(
                                              Text(cell!.value.toString())))
                                          .toList(),
                                    ))
                                .toList(),
                          );
                        }).toList(),
                      ),
                    );
                  }
                },
              )
            : const Center(child: Text('Excel file not available'));
      case 'pdf':
      case 'application/pdf':
        return fileUrl != null
            ? FutureBuilder<String?>(
                future: _downloadFile(fileUrl),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError || snapshot.data == null) {
                    return const Center(child: Text('Failed to load PDF'));
                  } else {
                    return Center(
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.8,
                        width: double.infinity,
                        child: PDFView(
                          filePath: snapshot.data!,
                          enableSwipe: true,
                          swipeHorizontal: false,
                          pageSnap: true,
                          autoSpacing: false,
                          pageFling: true,
                          onError: (error) {
                            debugPrint(error.toString());
                          },
                        ),
                      ),
                    );
                  }
                },
              )
            : const Center(child: Text('PDF file not available'));
      case 'docx':
      case 'doc':
        return fileUrl != null
            ? FutureBuilder<String?>(
                future: _downloadFile(fileUrl),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError || snapshot.data == null) {
                    return const Center(child: Text('Failed to load DOCX'));
                  } else {
                    final file = File(snapshot.data!);
                    return Center(
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.8,
                        width: double.infinity,
                        child: DocxViewer(
                          file: file,
                        ),
                      ),
                    );
                  }
                },
              )
            : const Center(child: Text('DOCX file not available'));
      default:
        return const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Unsupported file type.'),
            ],
          ),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Preview', style: TextStyle(color: Colors.black)),
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Get.back();
            SharedPrefernce.setsdownloadS3Url('');
            SharedPrefernce.setdownloadfileName('');
          },
          icon: const Icon(Icons.arrow_back, color: Colors.black),
        ),
      ),
      body: Center(
        child: FutureBuilder(
          future: _fetchFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator(color: Colors.black,));
            } else if (snapshot.hasError) {
              return const Center(child: Text('No Connection'));
            } else if (_model.singleDox == null) {
              return const Center(child: Text('No Data Available'));
            } else {
              final fileType = _model.singleDox!.fileType ?? '';
              final fileUrl = _model.singleDox!.downloadurl;
              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      _buildFilePreview(fileType, fileUrl),
                    ],
                  ),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
