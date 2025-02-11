import 'package:nyaya_tech/backend/app_response.dart';
import 'package:nyaya_tech/backend/custom_response.dart';
import 'package:nyaya_tech/backend/services/checklist_api.dart';
import 'package:nyaya_tech/data_components/shared_preference.dart';
import 'package:nyaya_tech/responses/create_checklist_response.dart';
import 'package:nyaya_tech/responses/get_checklist_response.dart';
import 'package:nyaya_tech/responses/update_checklist_response.dart';
import 'package:nyaya_tech/responses/view_checklist_response.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ViewChecklistModel extends FlutterFlowModel {
  TextEditingController controller = TextEditingController();
  ViewCheckListData? checkListData;
  CreateChecklistResponseData? checklistResponse;
  GetChecklistData? getchecklistData;
  ErrData? errData;

  bool error = false;
  bool isValidation = false;
  String message = '';
  AppResponse? appResponse;

  @override
  void initState(BuildContext context) {
    controller = TextEditingController();
  }

  @override
  void dispose() {
    controller.dispose();
  }

  Future<void> fetchViewChecklist() async {
    CustomResponse<ViewCheckListResponse> response =
        await ViewCheckListApi().call();
    if (response.statusCode == 200) {
      checkListData = response.data!.data!;
    } else {
      throw Exception('error');
    }
  }

  Future<void> fetchCreateChecklistResponse({required String response}) async {
    CustomResponse<CreateChecklistResponse> responses =
        await CreateCheckListResponseApi().call(response: response);
    error = false;
    isValidation = false;
    message = '';
    appResponse = AppResponse(response: responses);

    if (responses.statusCode == 200 || responses.statusCode == 201) {
      message = responses.data!.message.toString();
    } else {
      message = responses.data!.errData!.response.toString();
    }
  }

  Future<void> fetchGetChecklistData() async {
    CustomResponse<GetChecklistResponse> response =
        await GetChecklistApi().call();
    SharedPrefernce.setclid(response.data!.data!.id.toString());
    SharedPrefernce.setResponse(response.data!.data!.response.toString());
    if (response.statusCode == 200) {
      getchecklistData = response.data!.data;
    } else {
      throw Exception('error');
    }
  }

  Future<void> fetchUpdateChecklistResponse({required String response}) async {
    CustomResponse<UpdateChecklistResponse> responses =
        await UpdateChecklistResponseApi().call(
      response: response,
    );

    if (responses.statusCode == 200 || responses.statusCode == 201) {
      message = responses.data!.message.toString();
    } else {
      message = responses.data!.message.toString();
    }
  }
}
