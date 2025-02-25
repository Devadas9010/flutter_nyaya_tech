import 'package:flutter/material.dart';
import 'package:nyaya_tech/backend/custom_response.dart';
import 'package:nyaya_tech/backend/services/list_case_api.dart';
import 'package:nyaya_tech/backend/services/list_issues_api.dart';
import 'package:nyaya_tech/data_components/shared_prefernce.dart';
import 'package:nyaya_tech/flutter_flow/flutter_flow_util.dart';
import 'package:nyaya_tech/response/list_cases_response.dart';
import 'package:nyaya_tech/response/list_issues_response.dart';

class CasesModel extends FlutterFlowModel {
  @override
  void initState(BuildContext context) {}

  List<CaseCardData> caseData = [];
  List<Issues> issues = [];
  num total_pages = 0;
  num per_page = 0;
  num current_page = 0;

  @override
  void dispose() {}

  Future<void> fetchCaseData({int? page, int? limit}) async {
    CustomResponse<ListCases> response =
        await ListCaseApi().call(page: page, limit: limit);

    if (response.statusCode == 200) {
      if (page == 1) {
        caseData = response.data!.data!.records!;
      } else {
        caseData.addAll(response.data!.data!.records!);
      }
      per_page = response.data!.data!.paginationInfo!.pageSize!.toInt();
      current_page = response.data!.data!.paginationInfo!.currentPage!.toInt();
      total_pages = response.data!.data!.paginationInfo!.totalPages!.toInt();
    } else {
      throw Exception("Failed to fetch data: ${response.message}");
    }
  }

  Future<void> fetchCasesIssue() async {
    CustomResponse<ListCasesIssues> response = await ListIssuesApi().call();
    if (response.statusCode == 200) {
      issues = response.data!.data!;
      List<Map<String, String>> issuesAsMaps = issues.map((issue) {
        return issue
            .toJson()
            .map((key, value) => MapEntry(key, value.toString()));
      }).toList();

      SharedPrefernce.setDataList(issuesAsMaps);
    }
  }
}
