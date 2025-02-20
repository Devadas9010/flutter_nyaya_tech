import 'package:nyaya_tech/backend/custom_response.dart';
import 'package:nyaya_tech/backend/services/checklist_api.dart';
import 'package:nyaya_tech/responses/List_of_checklist_response.dart';

import '/flutter_flow/flutter_flow_util.dart';

import 'package:flutter/material.dart';

class ListofchecklistModel extends FlutterFlowModel {
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  List<CheckListData> checklistdata = [];

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}

  Future<void> fetchCheckListData() async {
    CustomResponse<ListofCheckListResponse> response =
        await ListCheckListApi().call();
    if (response.statusCode == 200) {
      checklistdata = response.data!.data!.records!;
    } else {
      throw Exception(response.message);
    }
  }
}
