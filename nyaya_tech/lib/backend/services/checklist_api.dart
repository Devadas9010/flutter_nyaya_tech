import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:nyaya_tech/backend/api_manager.dart';
import 'package:nyaya_tech/backend/api_service.dart';
import 'package:nyaya_tech/backend/custom_response.dart';
import 'package:nyaya_tech/data_components/shared_preference.dart';
import 'package:nyaya_tech/responses/List_of_checklist_response.dart';
import 'package:nyaya_tech/responses/create_checklist_response.dart';
import 'package:nyaya_tech/responses/get_checklist_response.dart';
import 'package:nyaya_tech/responses/update_checklist_response.dart';
import 'package:nyaya_tech/responses/view_checklist_response.dart';

class ListCheckListApi {
  Future<CustomResponse<ListofCheckListResponse>> call() async {
    ApiCallResponse response = await ApiManager.instance.makeApiCall(
      callName: "List_Checklist_Api",
      apiUrl: buildUrl('/cases/${SharedPrefernce.getcaseId()}/checklist'),
      headers: {'Authorization': "Bearer ${SharedPrefernce.getAccessToken()}"},
      params: {},
      callType: ApiCallType.GET,
      bodyType: BodyType.JSON,
    );

    return CustomResponse.completed(
        await compute(
            listofCheckListResponseFromJson, jsonEncode(response.jsonBody)),
        response.statusCode);
  }
}

class ViewCheckListApi {
  Future<CustomResponse<ViewCheckListResponse>> call() async {
    ApiCallResponse response = await ApiManager.instance.makeApiCall(
      callName: "View_Checklist_Api",
      apiUrl: buildUrl('/checklist/${SharedPrefernce.getchecklistid()}'),
      headers: {'Authorization': "Bearer ${SharedPrefernce.getAccessToken()}"},
      params: {},
      callType: ApiCallType.GET,
      bodyType: BodyType.JSON,
    );

    return CustomResponse.completed(
        await compute(
            viewCheckListResponseFromJson, jsonEncode(response.jsonBody)),
        response.statusCode);
  }
}

class CreateCheckListResponseApi {
  Future<CustomResponse<CreateChecklistResponse>> call(
      {required String response}) async {
    final body = {
      'response': response,
    };
    ApiCallResponse responses = await ApiManager.instance.makeApiCall(
      callName: 'Create_Checklist_Response',
      apiUrl:
          buildUrl('/checklist/${SharedPrefernce.getchecklistid()}/response'),
      headers: {'Authorization': "Bearer ${SharedPrefernce.getAccessToken()}"},
      params: {},
      callType: ApiCallType.POST,
      body: jsonEncode(body),
      bodyType: BodyType.JSON,
    );

    return CustomResponse.completed(
        await compute(
            createChecklistResponseFromJson, jsonEncode(responses.jsonBody)),
        responses.statusCode);
  }
}

class GetChecklistApi {
  Future<CustomResponse<GetChecklistResponse>> call() async {
    ApiCallResponse response = await ApiManager.instance.makeApiCall(
      callName: "Get_Checklist_Api",
      apiUrl:
          buildUrl('/checklist/${SharedPrefernce.getchecklistid()}/response'),
      headers: {'Authorization': "Bearer ${SharedPrefernce.getAccessToken()}"},
      params: {},
      callType: ApiCallType.GET,
      bodyType: BodyType.JSON,
    );

    return CustomResponse.completed(
        await compute(
            getChecklistResponseFromJson, jsonEncode(response.jsonBody)),
        response.statusCode);
  }
}


class UpdateChecklistResponseApi {
  Future<CustomResponse<UpdateChecklistResponse>> call({
    required String response,
  }) async {
    final body = {
      "response": response,
    };
    ApiCallResponse responses = await ApiManager.instance.makeApiCall(
      callName: 'update_checklist_response_api',
      apiUrl: buildUrl('/checklist/response/${SharedPrefernce.getclid()}'), 
      callType: ApiCallType.PATCH,
      headers: {'Authorization': 'Bearer ${SharedPrefernce.getAccessToken()}'},
      body: jsonEncode(body),
      bodyType: BodyType.JSON,
    );
    return CustomResponse.completed(
        await compute(
            updateChecklistResponseFromJson, jsonEncode(responses.jsonBody)),
        responses.statusCode);
  }
}
