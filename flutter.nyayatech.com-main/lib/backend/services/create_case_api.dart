import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:nyaya_tech/backend/api_manager.dart';
import 'package:nyaya_tech/backend/api_service.dart';
import 'package:nyaya_tech/backend/custom_response.dart';
import 'package:nyaya_tech/data_components/shared_prefernce.dart';
import 'package:nyaya_tech/dtos/create_case_dto.dart';
import 'package:nyaya_tech/response/assigne_response.dart';
import 'package:nyaya_tech/response/create_case_response.dart';

class CreateCaseApi {
  Future<CustomResponse<CreateCaseResponse>> call(
      {required CreateCaseDto casecreatedto}) async {
    ApiCallResponse response = await ApiManager.instance.makeApiCall(
        callName: 'Create_Case',
        apiUrl: buildUrl('/cases'),
        callType: ApiCallType.POST,
        headers: {
          'Authorization': "Bearer ${SharedPrefernce.getAccessToken()}"
        },
        params: {},
        body: jsonEncode(casecreatedto),
        bodyType: BodyType.JSON,
        returnBody: true,
        encodeBodyUtf8: false,
        decodeUtf8: false,
        cache: false);
    return CustomResponse.completed(
        await compute(
            createCaseResponseFromJson, jsonEncode(response.jsonBody)),
        response.statusCode);
  }
}

class GetAssigneApi {
  Future<CustomResponse<AssigneResponse>> call() async {
    ApiCallResponse response = await ApiManager.instance.makeApiCall(
        callName: 'Get_Details',
        apiUrl: buildUrl('/users/${SharedPrefernce.getassigneLawId()}'),
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
        await compute(assigneResponseFromJson, jsonEncode(response.jsonBody)),
        response.statusCode);
  }
}
