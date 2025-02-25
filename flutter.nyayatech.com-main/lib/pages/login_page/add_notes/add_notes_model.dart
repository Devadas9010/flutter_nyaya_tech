import 'package:flutter/material.dart';
import 'package:nyaya_tech/backend/app_response.dart';
import 'package:nyaya_tech/backend/custom_response.dart';
import 'package:nyaya_tech/backend/services/notes_api.dart';
import 'package:nyaya_tech/dtos/add_notes_dto.dart';
import 'package:nyaya_tech/flutter_flow/flutter_flow_util.dart';
import 'package:nyaya_tech/response/create_notes_response.dart';

class AddNotesModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  @override
  void initState(BuildContext context) {}

  bool error = false;
  bool isValidation = false;
  String message = '';
  AppResponse? appResponse;
  dynamic errorInstance;
  dynamic errorInstance1;

  @override
  void dispose() {}

  Future<void> fetchAddNotes(
      {required int caseid,
      required String title,
      required String note,required String type}) async {
    AddNotesDto addNotesDto =
        AddNotesDto(caseid: caseid, title: title, note: note,type: type);
    CustomResponse<CreateCasesNotesResponse> response =
        await CreateNotesApi().call(addnotedto: addNotesDto);
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
                "title": response.data!.errData!.title?.join(', ') ??
                    "Unknown error",
              }
            : null;
        errorInstance1 = response.data!.errData != null
            ? {
                "note":
                    response.data!.errData!.note?.join(', ') ?? "Unknown error",
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

  Future<void> fetchUpdateNote(
      {required int caseid,
      required String title,
      required String note,
      required String type}) async {
    AddNotesDto updatNotesDto =
        AddNotesDto(caseid: caseid, title: title, note: note,type: type);
    CustomResponse<CreateCasesNotesResponse> response =
        await UpdateNotesApi().call(addnotedto: updatNotesDto);
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
                "title": response.data!.errData!.title?.join(', ') ??
                    "Unknown error",
              }
            : null;
        errorInstance1 = response.data!.errData != null
            ? {
                "note":
                    response.data!.errData!.note?.join(', ') ?? "Unknown error",
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
