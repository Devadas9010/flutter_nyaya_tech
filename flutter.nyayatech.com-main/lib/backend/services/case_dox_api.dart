import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:nyaya_tech/backend/api_manager.dart';
import 'package:nyaya_tech/backend/api_service.dart';
import 'package:nyaya_tech/backend/custom_response.dart';
import 'package:nyaya_tech/data_components/shared_prefernce.dart';
import 'package:nyaya_tech/response/caes_dox_response.dart';
import 'package:nyaya_tech/response/delete_dox_response.dart';
import 'package:nyaya_tech/response/single_dox_response.dart';

class CaseDoxApi {
  Future<CustomResponse<ListCaseDox>> call({int? page, int? limit}) async {
    ApiCallResponse response = await ApiManager.instance.makeApiCall(
      callName: 'Case_dox',
      apiUrl: buildUrl('/cases/${SharedPrefernce.getcaseId()}/docs'),
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
        await compute(listCaseDoxFromJson, jsonEncode(response.jsonBody)),
        response.statusCode);
  }
}

class ViewSingleDox {
  Future<CustomResponse<SingleDoxResponse>> call() async {
    ApiCallResponse response = await ApiManager.instance.makeApiCall(
        callName: 'Single_dox',
        apiUrl: buildUrl('/docs/${SharedPrefernce.getfileId()}'),
        callType: ApiCallType.GET,
        headers: {
          'Authorization': "Bearer ${SharedPrefernce.getAccessToken()}"
        },
        params: {},
        bodyType: BodyType.JSON,
        returnBody: true,
        encodeBodyUtf8: false,
        decodeUtf8: false,
        cache: false);

    return CustomResponse.completed(
        await compute(singleDoxResponseFromJson, jsonEncode(response.jsonBody)),
        response.statusCode);
  }
}

class DeleteDoxApi {
  Future<CustomResponse<DeleteDoxResponse>> call() async {
    ApiCallResponse response = await ApiManager.instance.makeApiCall(
        callName: 'Delete_dox',
        apiUrl: buildUrl('/docs/${SharedPrefernce.getfileId()}'),
        callType: ApiCallType.DELETE,
        headers: {
          'Authorization': "Bearer ${SharedPrefernce.getAccessToken()}"
        },
        params: {},
        bodyType: BodyType.JSON,
        returnBody: true,
        encodeBodyUtf8: false,
        decodeUtf8: false,
        cache: false);
    return CustomResponse.completed(
        await compute(deleteDoxResponseFromJson, jsonEncode(response.jsonBody)),
        response.statusCode);
  }
}
