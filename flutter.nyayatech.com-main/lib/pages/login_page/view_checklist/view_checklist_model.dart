import 'package:nyaya_tech/backend/custom_response.dart';
import 'package:nyaya_tech/backend/services/check_list_api.dart';
import 'package:nyaya_tech/response/view_checkList_response.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';

class VIewchecklistModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // Model for Mobilecomponent component.
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {}

  ViewCheckList? viewCheckList;

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }

  Future<void> fetchviewCheckList() async {
    CustomResponse<VIewCheckListResponse> response =
        await ViewCheckListApi().call();
    viewCheckList = response.data!.data;
  }
}
