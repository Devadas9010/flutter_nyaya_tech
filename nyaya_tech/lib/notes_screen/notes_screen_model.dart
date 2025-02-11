import 'package:flutter/material.dart';
import 'package:nyaya_tech/backend/custom_response.dart';
import 'package:nyaya_tech/backend/services/notes_api.dart';
import 'package:nyaya_tech/flutter_flow/flutter_flow_model.dart';
import 'package:nyaya_tech/responses/list_cases_notes_response.dart';

class NotesScreenModel extends FlutterFlowModel {
  List<NotesData> notesData = [];
  int currentPage = 1;
  int pageSize = 10;
  int totalPages = 1;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}

  Future<List<NotesData>> fetchAllNotesData(int page, int pageSize) async {
    CustomResponse<ListCasesNotesResponse> response =
        await FetchNotesApi().call(page: page, pageSize: pageSize);

    if (response.statusCode == 200) {
      final notes = response.data!.data!.records!;
      currentPage = response.data!.data!.paginationInfo!.currentPage!.toInt();
      pageSize = response.data!.data!.paginationInfo!.pageSize!.toInt();
      totalPages = response.data!.data!.paginationInfo!.totalPages!.toInt();
      return notes;
    } else {
      throw Exception(response.message);
    }
  }
}
