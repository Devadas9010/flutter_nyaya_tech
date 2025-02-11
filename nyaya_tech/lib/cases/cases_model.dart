import 'package:flutter/material.dart';
import 'package:nyaya_tech/backend/custom_response.dart';
import 'package:nyaya_tech/backend/services/list_all_cases_api.dart';
import 'package:nyaya_tech/cases/cases_widget.dart';
import 'package:nyaya_tech/flutter_flow/flutter_flow_util.dart';
import 'package:nyaya_tech/responses/list_all_Cases_response.dart';

class CasesModel extends FlutterFlowModel {
  @override
  void initState(BuildContext context) {}

  List<CaseCardData> caseData = [];
  int currentPage = 1;
  int pageSize = 10;
  int totalPages = 1;

  @override
  void dispose() {}

  Future<List<CaseCardData>> fetchAllCasesData(int page, int pageSize) async {
    CustomResponse<ListAllCases> response =
        await ListAllCasesApi().call(page: page, pageSize: pageSize);
    if (response.statusCode == 200) {
      final cases = response.data!.data!.records!;
      currentPage = response.data!.data!.paginationInfo!.currentPage!.toInt();
      pageSize = response.data!.data!.paginationInfo!.pageSize!.toInt();
      totalPages = response.data!.data!.paginationInfo!.totalPages!.toInt();
      return cases;
    } else {
      throw Exception(response.message);
    }
  }
}
