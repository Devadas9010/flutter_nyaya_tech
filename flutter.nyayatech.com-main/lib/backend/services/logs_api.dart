import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:nyaya_tech/backend/api_manager.dart';
import 'package:nyaya_tech/backend/api_service.dart';
import 'package:nyaya_tech/backend/custom_response.dart';
import 'package:nyaya_tech/data_components/shared_prefernce.dart';
import 'package:nyaya_tech/response/case_logs_response.dart';

class LogsApi {
  Future<CustomResponse<ListCaseLogs>> call({int? page, int? limit}) async {
    ApiCallResponse response = await ApiManager.instance.makeApiCall(
        callName: 'Logs_Api',
        apiUrl: buildUrl('/cases/${SharedPrefernce.getcaseId()}/logs'),
        callType: ApiCallType.GET,
        headers: {
          'Authorization': "Bearer ${SharedPrefernce.getAccessToken()}"
        },
        params: {'page': page, 'page_size': limit},
        bodyType: BodyType.JSON,
        returnBody: true,
        encodeBodyUtf8: false,
        decodeUtf8: false,
        cache: false);

    return CustomResponse.completed(
        await compute(listCaseLogsFromJson, jsonEncode(response.jsonBody)),
        response.statusCode);
  }
}
