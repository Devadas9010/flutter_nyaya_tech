import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:nyaya_tech/backend/api_manager.dart';
import 'package:nyaya_tech/backend/api_service.dart';
import 'package:nyaya_tech/backend/custom_response.dart';
import 'package:nyaya_tech/data_components/shared_prefernce.dart';
import 'package:nyaya_tech/response/checkList_response.dart';
import 'package:nyaya_tech/response/view_checkList_response.dart';

class ListCheckListApi {
  Future<CustomResponse<CheckListResponse>> call(
      {int? page, int? limit}) async {
    ApiCallResponse response = await ApiManager.instance.makeApiCall(
      callName: 'List Check List',
      apiUrl: buildUrl('/cases/${SharedPrefernce.getcaseId()}/checklist'),
      headers: {'Authorization': "Bearer ${SharedPrefernce.getAccessToken()}"},
      callType: ApiCallType.GET,
      params: {'page': page, 'page_size': limit},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
    return CustomResponse.completed(
        await compute(checkListResponseFromJson, jsonEncode(response.jsonBody)),
        response.statusCode);
  }
}

class ViewCheckListApi {
  Future<CustomResponse<VIewCheckListResponse>> call() async {
    ApiCallResponse response = await ApiManager.instance.makeApiCall(
      callName: 'View Checklist',
      apiUrl:
          buildUrl('/checklist/${SharedPrefernce.getcheckListId()}'),
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
        await compute(
            vIewCheckListResponseFromJson, jsonEncode(response.jsonBody)),
        response.statusCode);
  }
}
