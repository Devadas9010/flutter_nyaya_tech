import 'package:flutter/material.dart';
import 'package:nyaya_tech/backend/custom_response.dart';
import 'package:nyaya_tech/backend/services/hearing_summary_api.dart';
import 'package:nyaya_tech/flutter_flow/flutter_flow_util.dart';
import 'package:nyaya_tech/response/case_summary_response.dart';

class HearingSummaryModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  @override
  void initState(BuildContext context) {}
  num total_pages = 0;
  num per_page = 0;
  num current_page = 0;
  List<CaseSummary> caseSummary = [];
  String message = '';

  @override
  void dispose() {}

  Future<void> fetchHearingSummary({int? page, int? limit}) async {
    CustomResponse<CaseSummaryResponse> response =
        await GetHearingSummaryApi().call(page: page, limit: limit);
    if (response.statusCode == 200) {
      if (page == 1) {
        caseSummary = response.data!.data!.records!;
      } else {
        caseSummary.addAll(response.data!.data!.records!);
      }
      per_page = response.data!.data!.paginationInfo!.pageSize!.toInt();
      current_page = response.data!.data!.paginationInfo!.currentPage!.toInt();
      total_pages = response.data!.data!.paginationInfo!.totalPages!.toInt();
    } else {
      response.message;
      message = response.message.toString();
      print(response.message);
      throw Exception("Failed to fetch data: ${response.message}");
    }
  }
}
