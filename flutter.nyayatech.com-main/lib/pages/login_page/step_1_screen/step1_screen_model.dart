import 'package:flutter/material.dart';
import 'package:nyaya_tech/backend/custom_response.dart';
import 'package:nyaya_tech/backend/services/list_issues_api.dart';

import 'package:nyaya_tech/flutter_flow/flutter_flow_util.dart';
import 'package:nyaya_tech/response/list_issues_response.dart';

class Step1ScreenModel extends FlutterFlowModel {
  @override
  void initState(BuildContext context) {}
  List<Issues> issues = [];
  @override
  void dispose() {}
  Future<void> fetchCasesIssue() async {
    CustomResponse<ListCasesIssues> response = await ListIssuesApi().call();
    if (response.statusCode == 200) {
      issues = response.data!.data!;
    }else{}
  }
}
