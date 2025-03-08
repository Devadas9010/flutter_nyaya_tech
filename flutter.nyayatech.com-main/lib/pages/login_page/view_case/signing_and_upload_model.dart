import 'package:flutter/material.dart';
import 'package:nyaya_tech/backend/custom_response.dart';
import 'package:nyaya_tech/backend/services/files_upload_api.dart';
import 'package:nyaya_tech/flutter_flow/flutter_flow_model.dart';
import 'package:nyaya_tech/pages/login_page/view_case/signing_and_upload_widget.dart';
import 'package:nyaya_tech/response/caes_dox_response.dart';
import 'package:nyaya_tech/response/file_upload_response.dart';

class SigningModel extends FlutterFlowModel<SigningWidget> {
  List<Documents> documentData = [];
  bool? checkboxValue;
  String message = "";
  bool isValidation = false;
  bool error = false;
  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}


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

  Future<void> fetchListDocumentsData() async {
    CustomResponse<ListCaseDox> response = await ListDocumentsApi().call();
    if (response.statusCode == 200) {
      documentData = response.data!.data!.records!;
    } else {
      throw Exception('error');
    }
  }
}
