import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nyaya_tech/data_components/get_routing.dart';
import 'package:nyaya_tech/data_components/shared_prefernce.dart';
import 'package:nyaya_tech/flutter_flow/flutter_flow_theme.dart';
import 'package:nyaya_tech/response/caes_dox_response.dart';

class FileComponent extends StatelessWidget {
  final Documents doc;
  final Function() delete;
  const FileComponent({super.key, required this.doc, required this.delete});

  @override
  Widget build(BuildContext context) {
    IconData fileIcon = Icons.insert_drive_file;
    bool isImageFile = false;

    if (doc.fileType != null) {
      if (['jpg', 'jpeg', 'png', 'img']
          .any((ext) => doc.fileType!.contains(ext))) {
        isImageFile = true;
      } else if (['pdf'].any((ext) => doc.fileType!.contains(ext))) {
        fileIcon = Icons.picture_as_pdf;
      } else if (['txt', 'text'].any((ext) => doc.fileType!.contains(ext))) {
        fileIcon = Icons.text_snippet;
      } else if (['doc', 'docx', 'word']
          .any((ext) => doc.fileType!.contains(ext))) {
        fileIcon = Icons.description;
      } else if (['xls', 'xlsx'].any((ext) => doc.fileType!.contains(ext))) {
        fileIcon = Icons.table_chart;
      } else {
        fileIcon = Icons.insert_drive_file;
      }
    } else {
      fileIcon = Icons.error;
    }

    return InkWell(
      onTap: () {
        SharedPrefernce.setfileId(doc.id.toString());
        Get.toNamed(Routes.preview);
        print('s3url -- ${SharedPrefernce.gets3Url()}');
        print('filename --${SharedPrefernce.getfileName()}');
        print('fileKey --${SharedPrefernce.getfileKey()}');
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: const Color(0x3B000000)),
        ),
        alignment: const AlignmentDirectional(0, 1),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.only(bottom: 6),
                decoration: const BoxDecoration(),
                child: Align(
                  alignment: const AlignmentDirectional(0, 0),
                  child: isImageFile
                      ? Image.network(
                          doc.downloadUrl.toString(),
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) =>
                              Icon(Icons.broken_image, size: 48),
                        )
                      : Icon(fileIcon, size: 48, color: Colors.black),
                ),
              ),
            ),
            Flexible(
              child: Container(
                decoration: BoxDecoration(color: Colors.black.withOpacity(0.1)),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(8, 10, 8, 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          doc.fileName.toString(),
                          overflow: TextOverflow.ellipsis,
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Plus Jakarta Sans',
                                  ),
                        ),
                      ),
                      SharedPrefernce.getcasesStatus() != 'CLOSURE' &&
                              SharedPrefernce.getprofileid() == doc.uploadedBy
                          ? InkWell(
                              onTap: () {
                                SharedPrefernce.setfileId(doc.id.toString());
                                delete();
                              },
                              child: Icon(
                                Icons.delete_outline,
                                color: Colors.red,
                              ),
                            )
                          : Container(width: 0, height: 0),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//  InkWell(
//                               onTap: () {
//                                 SharedPrefernce.setfileId(doc.id.toString());
//                               },
//                               child: PopupMenuButton<String>(
//                                 icon: Icon(Icons.more_horiz,
//                                     color: Colors.black, size: 16),
//                                 onSelected: (value) {
//                                   if (value == 'download') {
//                                     onDownload();
//                                   } else if (value == 'delete') {
//                                     onDelete();
//                                   }
//                                 },
//                                 itemBuilder: (context) => [
//                                   PopupMenuItem(
//                                     value: 'download',
//                                     child: Row(
//                                       children: [
//                                         Icon(Icons.download,
//                                             color: Colors.black),
//                                         SizedBox(width: 8),
//                                         Text('Download')
//                                       ],
//                                     ),
//                                   ),
//                                   PopupMenuItem(
//                                     value: 'delete',
//                                     child: Row(
//                                       children: [
//                                         Icon(Icons.delete, color: Colors.black),
//                                         SizedBox(width: 8),
//                                         Text('Delete')
//                                       ],
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             )
