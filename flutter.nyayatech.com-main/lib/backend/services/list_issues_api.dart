import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:nyaya_tech/backend/api_manager.dart';
import 'package:nyaya_tech/backend/api_service.dart';
import 'package:nyaya_tech/backend/custom_response.dart';
import 'package:nyaya_tech/data_components/shared_prefernce.dart';
import 'package:nyaya_tech/response/list_issues_response.dart';

class ListIssuesApi {
  Future<CustomResponse<ListCasesIssues>> call() async {
    ApiCallResponse response = await ApiManager.instance.makeApiCall(
      callName: 'List_cases_Isses',
      apiUrl: buildUrl('issues/logos'),
      callType: ApiCallType.GET,
      headers: {'Authorization': "Bearer ${SharedPrefernce.getAccessToken()}"},
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
    return CustomResponse.completed(
        await compute(listCasesIssuesFromJson, jsonEncode(response.jsonBody)),
        response.statusCode);
  }
}
