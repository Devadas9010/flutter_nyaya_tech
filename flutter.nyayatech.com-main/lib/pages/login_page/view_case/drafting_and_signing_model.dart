import 'package:nyaya_tech/backend/custom_response.dart';
import 'package:nyaya_tech/backend/services/files_upload_api.dart';
import 'package:nyaya_tech/data_components/shared_prefernce.dart';
import 'package:nyaya_tech/dtos/file_upload_dto.dart';
import 'package:nyaya_tech/dtos/files_dto.dart';
import 'package:nyaya_tech/dtos/key_file_dto.dart';
import 'package:nyaya_tech/pages/login_page/view_case/drafting_and_signing_widget.dart';
import 'package:nyaya_tech/response/caes_dox_response.dart';
import 'package:nyaya_tech/response/file_upload_response.dart';
import 'package:nyaya_tech/response/s3_upload_respons.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DraftingModel extends FlutterFlowModel<DraftingWidget> {
  List<Documents> documentData = [];
  bool? checkboxValue;
  String message = "";
  bool isValidation = false;
  bool error = false;
  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}

  Future<void> fetchFileUploadData({
    required FileUploadDto fileClass,
  }) async {
    CustomResponse<S3UploadResponse> response =
        await FilesUploadApi().call(fileDto: fileClass);
    if (response.statusCode == 200 || response.statusCode == 201) {
      message = response.data!.message.toString();

      SharedPrefernce.setfileKey(response.data!.data!.fileKey.toString());

      SharedPrefernce.sets3Url(response.data!.data!.targetUrl.toString());
    } else {
      message = response.data!.message.toString();
    }
  }

  Future<void> fetchUploadDocumentsData({
    required int case_id,
    required String stage,
    required String sub_stage,
    required String file_type,
    required String file_name,
    required int file_size,
    required String key,
  }) async {
    CustomResponse<DocumentsUploadResponse> response =
        await UploadDocumentsApi().call(
      case_id: case_id,
      stage: stage,
      sub_stage: sub_stage,
      file_type: file_type,
      file_name: file_name,
      file_size: file_size,
      key: key,
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      message = response.data!.message.toString();
    } else {
      message = response.data!.message.toString();
    }
  }

  Future<void> fetchListDocumentData(
  ) async {
    CustomResponse<ListCaseDox> response =
        await GetListDocumentApi().call();
    if (response.statusCode == 200) {
      documentData = response.data!.data!.records!;
    } else {
      throw Exception('error');
    }
  }

  Future<void> fetchListDocumentsData() async {
    CustomResponse<ListCaseDox> response = await ListDocumentsApi().call();
    if (response.statusCode == 200) {
      documentData = response.data!.data!.records!;
    } else {
      throw Exception('error');
    }
  }
}
