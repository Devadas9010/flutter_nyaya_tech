import 'package:flutter/material.dart';
import 'package:nyaya_tech/backend/custom_response.dart';
import 'package:nyaya_tech/backend/services/notes_api.dart';
import 'package:nyaya_tech/flutter_flow/flutter_flow_util.dart';
import 'package:nyaya_tech/response/list_case_response.dart';

class NotesScreenModel extends FlutterFlowModel {
  @override
  void initState(BuildContext context) {}
  num total_pages = 0;
  num per_page = 0;
  num current_page = 0;
  List<NotesData> notesData = [];
  @override
  void dispose() {}

  Future<void> fetchNotes({int? page, int? limit}) async {
    CustomResponse<CasesNotesResponse> response =
        await NotesApi().call(page: page, limit: limit);
    if (response.statusCode == 200) {
      if (page == 1) {
        notesData = response.data!.data!.records!;
      } else {
        notesData.addAll(response.data!.data!.records!);
      }
      per_page = response.data!.data!.paginationInfo!.pageSize!.toInt();
      current_page = response.data!.data!.paginationInfo!.currentPage!.toInt();
      total_pages = response.data!.data!.paginationInfo!.totalPages!.toInt();
    } else {
      response.message;
      throw Exception('failed to fetch data ${response.message}');
    }
  }
}
