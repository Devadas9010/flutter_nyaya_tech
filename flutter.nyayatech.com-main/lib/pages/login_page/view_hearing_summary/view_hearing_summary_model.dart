import 'package:flutter/material.dart';
import 'package:nyaya_tech/backend/app_response.dart';
import 'package:nyaya_tech/backend/custom_response.dart';
import 'package:nyaya_tech/backend/services/hearing_summary_api.dart';
import 'package:nyaya_tech/flutter_flow/flutter_flow_util.dart';
import 'package:nyaya_tech/response/summary_delete_response.dart';
import 'package:nyaya_tech/response/view_summary_response.dart';

class ViewHearingSummaryModel extends FlutterFlowModel {
  @override
  void initState(BuildContext context) {}

  ViewSummary? viewSummary;
  bool error = false;
  bool isValidation = false;
  String message = '';
  AppResponse? appResponse;
  @override
  void dispose() {}

  Future<void> fetchSummary() async {
    CustomResponse<ViewSummaryResponse> response =
        await ViewSummaryApi().call();
    if (response.statusCode == 200) {
      viewSummary = response.data!.data;
    } else {
      print(response.data!.data);
    }
  }

  Future<void> fetchDeletesummry() async {
    CustomResponse<SummaryDeleteResponse> response =
        await DeleteSummaryApi().call();
    switch (response.statusCode) {
      case 200:
      case 201:
        error = false;
        message = response.data!.message.toString();
        break;
      case 422:
        error = true;
        message = response.data!.message.toString();
        appResponse = AppResponse(response: response);

        break;
      default:
        error = true;
        message = response.data!.message.toString();
    }
  }
}
