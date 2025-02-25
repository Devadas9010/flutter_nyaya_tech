import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:nyaya_tech/backend/api_manager.dart';
import 'package:nyaya_tech/backend/api_service.dart';
import 'package:nyaya_tech/backend/custom_response.dart';
import 'package:nyaya_tech/data_components/shared_prefernce.dart';
import 'package:nyaya_tech/response/case_stage_response.dart';

class CaseStageApi {
  Future<CustomResponse<CaseStageResponse>> call() async {
    ApiCallResponse response = await ApiManager.instance.makeApiCall(
        callName: 'Case_Stage',
        apiUrl: buildUrl('/cases/${SharedPrefernce.getcaseId()}/case-stages'),
        headers: {
          'Authorization': "Bearer ${SharedPrefernce.getAccessToken()}"
        },
        callType: ApiCallType.GET,
        bodyType: BodyType.JSON,
        returnBody: true,
        encodeBodyUtf8: false,
        decodeUtf8: false,
        cache: false);

    return CustomResponse.completed(
        await compute(caseStageResponseFromJson, jsonEncode(response.jsonBody)),
        response.statusCode);
  }
}
