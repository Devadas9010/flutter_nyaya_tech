import 'package:flutter/material.dart';
import 'package:nyaya_tech/backend/custom_response.dart';
import 'package:nyaya_tech/backend/services/logs_api.dart';
import 'package:nyaya_tech/flutter_flow/flutter_flow_util.dart';
import 'package:nyaya_tech/response/case_logs_response.dart';

class LogsModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  @override
  void initState(BuildContext context) {}
  List<CaseLogs> caselogs = [];
  num total_pages = 0;
  num per_page = 0;
  num current_page = 0;
  @override
  void dispose() {}

  Future<void> fetchLogs({int? page, int? limit}) async {
    CustomResponse<ListCaseLogs> response =
        await LogsApi().call(page: page, limit: limit);
    if (response.statusCode == 200) {
      if (page == 1) {
        caselogs = response.data!.data!.records!;
      } else {
        caselogs.addAll(response.data!.data!.records!);
      }
      per_page = response.data!.data!.paginationInfo!.pageSize!.toInt();
      current_page = response.data!.data!.paginationInfo!.currentPage!.toInt();
      total_pages = response.data!.data!.paginationInfo!.totalPages!.toInt();
    }
  }
}
