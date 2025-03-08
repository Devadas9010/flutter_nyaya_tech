import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart' as http;
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:nyaya_tech/backend/api_service.dart';
import 'package:nyaya_tech/backend/custom_response.dart';
import 'package:nyaya_tech/backend/services/files_upload_api.dart';
import 'package:nyaya_tech/data_components/get_routing.dart';
import 'package:nyaya_tech/data_components/shared_prefernce.dart';
import 'package:nyaya_tech/dtos/file_upload_dto.dart';
import 'package:nyaya_tech/flutter_flow/flutter_flow_model.dart';
import 'package:nyaya_tech/flutter_flow/flutter_flow_theme.dart';
import 'package:nyaya_tech/flutter_flow/flutter_flow_util.dart';
import 'package:nyaya_tech/flutter_flow/flutter_flow_widgets.dart';
import 'package:nyaya_tech/pages/login_page/view_case/drafting_and_signing_model.dart';
import 'package:nyaya_tech/pages/login_page/view_case/signing_and_upload_model.dart';
import 'package:nyaya_tech/response/s3_upload_respons.dart';

class SigningWidget extends StatefulWidget {
  const SigningWidget({super.key});

  @override
  State<SigningWidget> createState() => _SigningWidgetState();
}

class _SigningWidgetState extends State<SigningWidget> {
  late SigningModel _model;
  late Future<void> _future;
  bool isUploading = false;
  bool isLoading = false;
  String uploadMessage = "";
  bool refreshLoading = false;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SigningModel());
    _future = fetchData();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> fetchData() async {
    setState(() => isLoading = true);
    try {
      await _model.fetchListDocumentsData();
    } finally {
      setState(() => isLoading = false);
    }
  }

  Future<void> _refreshDox() async {
    setState(() => refreshLoading = true);
    try {
      await _model.fetchListDocumentsData();
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
                    'Signing and Upload',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'DM Sans',
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Documents :',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'DM Sans',
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xFF000000),
                                    fontSize: 16,
                                    letterSpacing: 0.0,
                                  ),
                        ),
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
                              label:
                                  Text(isUploading ? 'Uploading...' : 'Upload'),
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.black),
                            ),
                          ],
                        ),
                      ]),
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
                              return Center(child: Text('No connection'));
                            } else if (_model.documentData.isEmpty) {
                              return Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(
                                      'assets/images/No_Files1.svg',
                                      height: 100,
                                      width: 100,
                                    ),
                                    Text('No Documents Available'),
                                  ],
                                ),
                              );
                            }
                            return Column(
                              children: _model.documentData.map((doc) {
                                final isImage = ['jpg', 'jpeg', 'png', 'docs']
                                    .contains(doc.fileType?.toLowerCase());
                                return InkWell(
                                    onTap: () {
                                      SharedPrefernce.setfileId(
                                          doc.id.toString());
                                      Get.toNamed(Routes.preview);
                                    },
                                    child: Container(
                                      margin: EdgeInsets.symmetric(vertical: 8),
                                      padding: EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color:
                                                Colors.grey.withOpacity(0.3)),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Row(
                                          children: [
                                        Container(
                                          width: 60,
                                          height: 60,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(4),
                                            color: Colors.grey[200],
                                          ),
                                          child: isImage
                                              ? Image.network(
                                                  doc.downloadUrl ?? '',
                                                  fit: BoxFit.cover,
                                                  errorBuilder: (context, error,
                                                          stackTrace) =>
                                                      Center(
                                                    child: Icon(
                                                      _getFileIcon(
                                                          doc.fileType ?? ''),
                                                      size: 30,
                                                      color: Colors.grey[600],
                                                    ),
                                                  ),
                                                )
                                              : Center(
                                                  child: Icon(
                                                    _getFileIcon(
                                                        doc.fileType ?? ''),
                                                    size: 30,
                                                    color: Colors.grey[600],
                                                  ),
                                                ),
                                        ),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                doc.fileName ?? 'Unnamed File',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16,
                                                ),
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                              Text(
                                                '${doc.fileSize != null ? (doc.fileSize! / 1024).toStringAsFixed(2) : "0"} KB',
                                                style: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 14,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ].divide(SizedBox(
                                        width: 10,
                                      ))),
                                    ));
                              }).toList(),
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
                ].divide(SizedBox(
                  height: 10,
                ))),
          ),
        ),
      ),
    );
  }
}
