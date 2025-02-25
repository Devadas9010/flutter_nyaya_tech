import 'package:flutter/material.dart';
import 'package:nyaya_tech/backend/app_response.dart';
import 'package:nyaya_tech/backend/custom_response.dart';
import 'package:nyaya_tech/backend/services/notes_api.dart';

import 'package:nyaya_tech/flutter_flow/flutter_flow_util.dart';
import 'package:nyaya_tech/response/delete_response.dart';
import 'package:nyaya_tech/response/view_notes_response.dart';

class ViewNotesModel extends FlutterFlowModel {
  @override
  void initState(BuildContext context) {}
  ViewNotes? viewNotes;
  bool error = false;
  bool isValidation = false;
  String message = '';
  AppResponse? appResponse;
  @override
  void dispose() {}

  Future<void> fetchviewNotes() async {
    CustomResponse<ViewCasesNotesResponse> response =
        await ViewNotesApi().call();
    if (response.statusCode == 200) {
      viewNotes = response.data!.data;
    } else {
      response.message;
    }
  }

  Future<void> fetchDeletenote() async {
    CustomResponse<NotesDeleteResponse> response =
        await DeleteNotesApi().call();
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
