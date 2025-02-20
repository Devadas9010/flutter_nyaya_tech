
// import 'dart:io';
// import 'package:docx_file_viewer/docx_file_viewer.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:nyaya_tech/add_hearing_summary/add_hearing_summary_model.dart';
// import 'package:nyaya_tech/components/deletepopup_widget.dart';
// import 'package:nyaya_tech/files/files_model.dart';
// import 'package:excel/excel.dart';
// import 'package:nyaya_tech/flutter_flow/flutter_flow_model.dart';
// import 'package:nyaya_tech/flutter_flow/flutter_flow_util.dart';
// import 'package:flutter_pdfview/flutter_pdfview.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:http/http.dart' as http;

// class ViewFileWidget extends StatefulWidget {
//   const ViewFileWidget({super.key});

//   @override
//   State<ViewFileWidget> createState() => _ViewFileWidgetState();
// }

// class _ViewFileWidgetState extends State<ViewFileWidget> {
//   late FilesModel _model;
//   // final _transformationController = TransformationController();

//   late Future<void> _fetchFuture;

//   @override
//   void initState() {
//     super.initState();
//     _model = createModel(context, () => FilesModel());
//     // _transformationController.value = Matrix4.identity()..scale(2.0);
//     _fetchFuture = _model.fetchSingleDocumentData();
//   }

//   Future<String?> _downloadFile(String url) async {
//     try {
//       final response = await http.get(Uri.parse(url));
//       if (response.statusCode == 200) {
//         final directory = await getTemporaryDirectory();

//         final uri = Uri.parse(url);
//         final fileName = uri.pathSegments.last.split('?').first;

//         final filePath = '${directory.path}/$fileName';

//         final file = File(filePath);
//         await file.writeAsBytes(response.bodyBytes);
//         return file.path;
//       } else {
//         debugPrint('Failed to download file: ${response.statusCode}');
//         return null;
//       }
//     } catch (e) {
//       debugPrint('Error downloading file: $e');
//       return null;
//     }
//   }

//   Widget _buildFilePreview(String fileType, String? fileUrl) {
//     switch (fileType.toLowerCase()) {
//       case 'jpeg':
//       case 'png':
//       case 'jpg':
//         return Center(
//           child: InteractiveViewer(
//             // transformationController: _transformationController,
//             // minScale: 0.1,
//             // maxScale: 4.0,
//             // constrained: false,
//             panEnabled: true,
//             child: Image.network(
//               fileUrl ?? '',
//               errorBuilder: (context, error, stackTrace) =>
//                   const Icon(Icons.broken_image),
//             ),
//           ),
//         );
//       case 'xlsx':
//       case 'xls':
//         return fileUrl != null
//             ? FutureBuilder<String?>(
//                 future: _downloadFile(fileUrl),
//                 builder: (context, snapshot) {
//                   if (snapshot.connectionState == ConnectionState.waiting) {
//                     return const Center(child: CircularProgressIndicator());
//                   } else if (snapshot.hasError || snapshot.data == null) {
//                     return const Center(
//                         child: Text('Failed to load Excel file'));
//                   } else {
//                     final bytes = File(snapshot.data!).readAsBytesSync();
//                     final excel = Excel.decodeBytes(bytes);
//                     return SingleChildScrollView(
//                       child: Column(
//                         mainAxisSize: MainAxisSize.max,
//                         children: excel.tables.entries.map((entry) {
//                           final table = entry.value;
//                           return DataTable(
//                             columns: table.rows.first
//                                 .map((e) => DataColumn(
//                                     label: Text(e!.value.toString())))
//                                 .toList(),
//                             rows: table.rows
//                                 .skip(1)
//                                 .map((row) => DataRow(
//                                       cells: row
//                                           .map((cell) => DataCell(
//                                               Text(cell!.value.toString())))
//                                           .toList(),
//                                     ))
//                                 .toList(),
//                           );
//                         }).toList(),
//                       ),
//                     );
//                   }
//                 },
//               )
//             : const Center(child: Text('Excel file not available'));
//       case 'pdf':
//         return fileUrl != null
//             ? FutureBuilder<String?>(
//                 future: _downloadFile(fileUrl),
//                 builder: (context, snapshot) {
//                   if (snapshot.connectionState == ConnectionState.waiting) {
//                     return const Center(child: CircularProgressIndicator());
//                   } else if (snapshot.hasError || snapshot.data == null) {
//                     return const Center(child: Text('Failed to load PDF'));
//                   } else {
//                     return Center(
//                       child: SizedBox(
//                         height: MediaQuery.of(context).size.height * 0.8,
//                         width: double.infinity,
//                         child: PDFView(
//                           filePath: snapshot.data!,
//                           enableSwipe: true,
//                           swipeHorizontal: false,
//                           pageSnap: true,
//                           autoSpacing: false,
//                           pageFling: true,
//                           onError: (error) {
//                             debugPrint(error.toString());
//                           },
//                         ),
//                       ),
//                     );
//                   }
//                 },
//               )
//             : const Center(child: Text('PDF file not available'));
//       case 'docx':
//       case 'doc':
//         return fileUrl != null
//             ? FutureBuilder<String?>(
//                 future: _downloadFile(fileUrl),
//                 builder: (context, snapshot) {
//                   if (snapshot.connectionState == ConnectionState.waiting) {
//                     return const Center(child: CircularProgressIndicator());
//                   } else if (snapshot.hasError || snapshot.data == null) {
//                     return const Center(child: Text('Failed to load DOCX'));
//                   } else {
//                     final file = File(snapshot.data!);
//                     return Center(
//                       child: SizedBox(
//                         height: MediaQuery.of(context).size.height * 0.8,
//                         width: double.infinity,
//                         child: DocxViewer(
//                           file: file,
//                         ),
//                       ),
//                     );
//                   }
//                 },
//               )
//             : const Center(child: Text('DOCX file not available'));
//       // case 'csv':
//       //   return fileUrl != null
//       //       ? FutureBuilder<String?>(
//       //           future: _downloadFile(fileUrl),
//       //           builder: (context, snapshot) {
//       //             if (snapshot.connectionState == ConnectionState.waiting) {
//       //               return const Center(child: CircularProgressIndicator());
//       //             } else if (snapshot.hasError || snapshot.data == null) {
//       //               return const Center(child: Text('Failed to load CSV file'));
//       //             } else {
//       //               try {
//       //                 final csvString = File(snapshot.data!).readAsStringSync();
//       //                 final rows =
//       //                     const CsvToListConverter().convert(csvString);

//       //                 if (rows.isEmpty || rows.length < 2) {
//       //                   return const Center(
//       //                       child: Text('CSV file is empty or has no data'));
//       //                 }

//       //                 final headers = rows.first.cast<String>();
//       //                 final dataRows = rows.skip(1);

//       //                 return SingleChildScrollView(
//       //                   scrollDirection: Axis.horizontal,
//       //                   child: DataTable(
//       //                     columns: headers
//       //                         .map(
//       //                           (header) => DataColumn(
//       //                             label: Text(header,
//       //                                 style: const TextStyle(
//       //                                     fontWeight: FontWeight.bold)),
//       //                           ),
//       //                         )
//       //                         .toList(),
//       //                     rows: dataRows
//       //                         .map(
//       //                           (row) => DataRow(
//       //                             cells: row
//       //                                 .map(
//       //                                   (cell) => DataCell(
//       //                                     Text(cell.toString()),
//       //                                   ),
//       //                                 )
//       //                                 .toList(),
//       //                           ),
//       //                         )
//       //                         .toList(),
//       //                   ),
//       //                 );
//       //               } catch (e) {
//       //                 return Center(child: Text('Error parsing CSV: $e'));
//       //               }
//       //             }
//       //           },
//       //         )
//       //       : const Center(child: Text('CSV file not available'));

//       default:
//         return const Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Text('Unsupported file type.'),
//             ],
//           ),
//         );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Preview', style: TextStyle(color: Colors.black)),
//         centerTitle: true,
//         backgroundColor: Colors.white,
//         leading: IconButton(
//           onPressed: () {
//             Navigator.pop(context);
//           },
//           icon: const Icon(Icons.arrow_back, color: Colors.black),
//         ),
//         actions: <Widget>[
//           IconButton(
//               onPressed: () async {
//                 await showDialog(
//                     context: context,
//                     builder: (_) {
//                       return DeletepopupWidget(onDelete: () async {
//                         await _model.fetchDeleteFileData();
//                         if (!_model.error && _model.message.isNotEmpty) {
//                           setState(() {});
//                           context.pushNamed('Files');
//                           // errorSnackBar(context, _model.message);
//                         }
//                       });
//                     });
//               },
//               icon: Icon(Icons.delete_outline, color: Colors.red)
              
              
//               )
//         ],
//       ),
//       body: Center(
//         child: FutureBuilder(
//           future: _fetchFuture,
//           builder: (context, snapshot) {
//             if (snapshot.connectionState == ConnectionState.waiting) {
//               return const Center(child: CircularProgressIndicator());
//             } else if (snapshot.hasError) {
//               return const Center(child: Text('No Connection'));
//             } else            final fileType = _model.singleDocumentData!.fileType ?? '';
//             final fileUrl = _model.singleDocumentData!.key;
//             return SingleChildScrollView(
//               child: Padding(
//                 padding: const EdgeInsets.all(16),
//                 child: Column(
//                   mainAxisSize: MainAxisSize.max,
//                   children: [
//                     _buildFilePreview(fileType, fileUrl),
//                   ],
//                 ),
//               ),
//             );
          
//           },
//         ),
//       ),
//     );
//   }
// }
