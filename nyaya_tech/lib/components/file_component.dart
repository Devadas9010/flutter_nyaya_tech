import 'package:flutter/material.dart';
import 'package:nyaya_tech/data_components/shared_preference.dart';
import 'package:nyaya_tech/flutter_flow/flutter_flow_theme.dart';
import 'package:nyaya_tech/responses/get_list_documents_response.dart';

class FileComponent extends StatelessWidget {
  final ListDocumentData documents;
  final Function() onDelete;
  final Function() onDownload;

  const FileComponent({
    super.key,
    required this.documents,
    required this.onDelete,
    required this.onDownload,
  });

  @override
  Widget build(BuildContext context) {
    IconData fileIcon = Icons.insert_drive_file;
    bool isImageFile = false;
    Color backgroundColor = const Color(0x14003FE9);

    if (documents.fileType != null) {
      if (['jpg', 'jpeg', 'png', 'img']
          .any((ext) => documents.fileType!.contains(ext))) {
        isImageFile = true;
      } else if (['pdf'].any((ext) => documents.fileType!.contains(ext))) {
        fileIcon = Icons.picture_as_pdf;
      } else if (['txt', 'text']
          .any((ext) => documents.fileType!.contains(ext))) {
        fileIcon = Icons.text_snippet;
      } else if (['doc', 'docx', 'word']
          .any((ext) => documents.fileType!.contains(ext))) {
        fileIcon = Icons.description;
      } else if (['xls', 'xlsx']
          .any((ext) => documents.fileType!.contains(ext))) {
        fileIcon = Icons.table_chart;
      } else {
        fileIcon = Icons.insert_drive_file;
      }
    } else {
      fileIcon = Icons.error;
    }

    return InkWell(
      onTap: () {
        SharedPrefernce.setfileId(documents.id.toString());
        print('file id -- ${SharedPrefernce.getfileId()}');
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: const Color(0x3B000000)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.only(bottom: 6),
                child: Align(
                  alignment: Alignment.center,
                  child: isImageFile
                      ? Image.network(
                          documents.key.toString(),
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) =>
                              const Icon(Icons.broken_image, size: 48),
                        )
                      : Icon(fileIcon, size: 48, color: Colors.blue),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.1),
              ),
              // padding: const EdgeInsetsDirectional.fromSTEB(6,6,6,6),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      documents.filename.toString(),
                      overflow: TextOverflow.ellipsis,
                      style: FlutterFlowTheme.of(context).bodyMedium,
                    ),
                  ),
                  PopupMenuButton<String>(
                    onSelected: (value) async {
                      if (value == 'Delete') {
                        SharedPrefernce.setfileId(documents.id.toString());
                        onDelete();
                      } else if (value == 'Download') {
                        SharedPrefernce.sets3Url(documents.key.toString());
                        SharedPrefernce.setfileName(
                            documents.filename.toString());
                        onDownload();
                      }
                    },
                    itemBuilder: (context) => [
                      const PopupMenuItem(
                        value: 'Delete',
                        child: Row(
                          children: [
                            Icon(Icons.delete, color: Colors.red),
                            SizedBox(width: 8),
                            Text('Delete'),
                          ],
                        ),
                      ),
                      const PopupMenuItem(
                        value: 'Download',
                        child: Row(
                          children: [
                            Icon(Icons.download, color: Colors.blue),
                            SizedBox(width: 8),
                            Text('Download'),
                          ],
                        ),
                      ),
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
          ],
        ),
      ),
    );
  }
}
