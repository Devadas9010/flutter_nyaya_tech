import 'package:nyaya_tech/backend/custom_response.dart';
import 'package:nyaya_tech/backend/services/files_api.dart';
import 'package:nyaya_tech/responses/delete_file_response.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'deletepopup_widget.dart' show DeletepopupWidget;
import 'package:flutter/material.dart';

class DeletepopupModel extends FlutterFlowModel<DeletepopupWidget> {

  String message="";
  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
   Future<void> fetchDeleteFileData() async {
    CustomResponse<DeleteFileRespose> response = await DeleteFileApi().call();

    if (response.statusCode == 200) {
      message = response.data!.message.toString();
    } else {
      message = response.data!.message.toString();
    }
  }
}
