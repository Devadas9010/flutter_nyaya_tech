import 'package:flutter/foundation.dart';
import 'package:nyaya_tech/backend/api_manager.dart';
import 'package:nyaya_tech/backend/api_service.dart';
import 'package:nyaya_tech/backend/custom_response.dart';
import 'package:nyaya_tech/data_components/shared_prefernce.dart';
import 'package:nyaya_tech/flutter_flow/flutter_flow_util.dart';
import 'package:nyaya_tech/response/list_cases_response.dart';

class ListCaseApi {
  Future<CustomResponse<ListCases>> call({int? page, int? limit}) async {
    ApiCallResponse response = await ApiManager.instance.makeApiCall(
      callName: 'List_case',
      apiUrl: buildUrl('/cases'),
      callType: ApiCallType.GET,
      headers: {'Authorization': "Bearer ${SharedPrefernce.getAccessToken()}"},
      params: {'page': page, 'page_size': limit},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );

    return CustomResponse.completed(
        await compute(listCasesFromJson, jsonEncode(response.jsonBody)),
        response.statusCode);
  }
}
