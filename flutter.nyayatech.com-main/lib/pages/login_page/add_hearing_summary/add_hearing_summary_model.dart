import 'package:flutter/material.dart';
import 'package:nyaya_tech/backend/app_response.dart';
import 'package:nyaya_tech/backend/custom_response.dart';
import 'package:nyaya_tech/backend/services/hearing_summary_api.dart';
import 'package:nyaya_tech/dtos/add_summary_notes.dart';
import 'package:nyaya_tech/flutter_flow/flutter_flow_util.dart';
import 'package:nyaya_tech/response/post_hearing_summary_response.dart';

class AddHearingSummaryModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;

  @override
  void initState(BuildContext context) {}
  bool error = false;
  bool isValidation = false;
  String message = '';
  AppResponse? appResponse;
  dynamic errorInstance;
  AddSummary? addNotes;
  dynamic errorInstance1;

  @override
  void dispose() {
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();
  }

  Future<void> fetchAddSummary(
      {required int caseid, required String date, required String note}) async {
    AddSummarydto addSummarydto =
        AddSummarydto(caseid: caseid, date: date, note: note);
    CustomResponse<PostCasesSummaryResponse> response =
        await PostHearingSummaryApi().call(adsummartdto: addSummarydto);
    error = false;
    isValidation = false;
    message = '';
    appResponse = AppResponse(response: response);

    switch (response.statusCode) {
      case 200:
      case 201:
        message = response.data!.message.toString();
        error = false;
      case 422:
        message = response.data!.message.toString();
        error = true;
        isValidation = true;
        errorInstance = response.data!.errData != null
            ? {
                "date":
                    response.data!.errData!.date?.join(', ') ?? "Unknown error"
              }
            : null;
        errorInstance1 = response.data!.errData != null
            ? {
                "note":
                    response.data!.errData!.note?.join(', ') ?? "Unknown error"
              }
            : null;
      case 401:
        message = response.data!.message.toString();
        isValidation = true;
        error = true;
        break;
      default:
        error = true;
        message = response.data!.message.toString();
    }
  }

    Future<void> fetchUpdateSummary(
      {required int caseid, required String date, required String note}) async {
    AddSummarydto addSummarydto =
        AddSummarydto(caseid: caseid, date: date, note: note);
    CustomResponse<PostCasesSummaryResponse> response =
        await UpdateSummaryApi().call(adsummartdto: addSummarydto);
    error = false;
    isValidation = false;
    message = '';
    appResponse = AppResponse(response: response);

    switch (response.statusCode) {
      case 200:
      case 201:
        message = response.data!.message.toString();
        error = false;
      case 422:
        message = response.data!.message.toString();
        error = true;
        isValidation = true;
        errorInstance = response.data!.errData != null
            ? {
                "date":
                    response.data!.errData!.date?.join(', ') ?? "Unknown error"
              }
            : null;
        errorInstance1 = response.data!.errData != null
            ? {
                "note":
                    response.data!.errData!.note?.join(', ') ?? "Unknown error"
              }
            : null;
      case 401:
        message = response.data!.message.toString();
        isValidation = true;
        error = true;
        break;
      default:
        error = true;
        message = response.data!.message.toString();
    }
  }
}
