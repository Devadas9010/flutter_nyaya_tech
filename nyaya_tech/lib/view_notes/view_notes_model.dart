import 'package:flutter/material.dart';
import 'package:nyaya_tech/backend/custom_response.dart';
import 'package:nyaya_tech/backend/services/notes_api.dart';
import 'package:nyaya_tech/flutter_flow/flutter_flow_util.dart';
import 'package:nyaya_tech/responses/view_note_response.dart';

class ViewNotesModel extends FlutterFlowModel {
  @override
  void initState(BuildContext context) {}
  ViewNote? viewnote;

  @override
  void dispose() {}

  Future<void> fetchviewNotes() async {
    CustomResponse<ViewCaseNoteResponse> response =
        await ViewNoteApi().call();
    if (response.statusCode == 200) {
      viewnote = response.data!.data!;
      print(viewnote);
    } else {
      response.message;
    }
  }
}
