import 'package:flutter/material.dart';
import 'package:nyaya_tech/backend/app_response.dart';
import 'package:nyaya_tech/backend/custom_response.dart';
import 'package:nyaya_tech/backend/services/notes_api.dart';
import 'package:nyaya_tech/classes/add_note.dart';
import 'package:nyaya_tech/flutter_flow/flutter_flow_model.dart';
import 'package:nyaya_tech/responses/add_note_response.dart';

class AddNotesModel extends FlutterFlowModel {
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
      required String note}) async {
    AddNotes addNotes = AddNotes(caseid: caseid, title: title, note: note);
    CustomResponse<AddNoteResponse> response =
        await AddNotesApi().call(addnotes: addNotes);
    error = false;
    isValidation = false;
    message = '';
    appResponse = AppResponse(response: response);

    if (response.statusCode == 200 || response.statusCode == 201) {
      message = response.data!.message.toString();
      error = false;
      print(message);
    } else if (response.statusCode == 400 ||
        response.statusCode == 401 ||
        response.statusCode == 422) {
      message = response.data!.message.toString();
      print(message);
      error = true;
    }
  }
}
