import 'package:nyaya_tech/backend/custom_response.dart';
import 'package:nyaya_tech/backend/services/hearing_summary_api.dart';
import 'package:nyaya_tech/responses/list_all_cases_hearing_summary_response.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';

class HearingSummaryModel extends FlutterFlowModel {
  List<ListCaseSummary> CaseSummary = [];
  int currentPage = 1;
  int pageSize = 1;
  int totalPages = 1;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}

  Future<List<ListCaseSummary>> FetchAllCasesHearingSummary(
      int page, int pageSize) async {
    CustomResponse<ListAllCasesHearingSummaryResponse> response =
        await ListAllCasesHearingSummaryApi()
            .call(page: page, pageSize: pageSize);
    if (response.statusCode == 200) {
      final CaseSummary = response.data!.data!.records!;
      currentPage = response.data!.data!.paginationInfo!.currentPage!.toInt();
      pageSize = response.data!.data!.paginationInfo!.pageSize!.toInt();
      totalPages = response.data!.data!.paginationInfo!.totalPages!.toInt();
      return CaseSummary;
    } else {
      throw Exception(response.message);
    }
  }


  
}
