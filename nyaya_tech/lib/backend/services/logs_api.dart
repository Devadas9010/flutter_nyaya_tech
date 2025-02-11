import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:nyaya_tech/backend/api_manager.dart';
import 'package:nyaya_tech/backend/api_service.dart';
import 'package:nyaya_tech/backend/custom_response.dart';
import 'package:nyaya_tech/data_components/shared_preference.dart';
import 'package:nyaya_tech/responses/list_case_logs_response.dart';

class ListLogsApi{
  Future<CustomResponse<ListCaseLogsResponse>> call({required int page,required int pageSize}) async{
    ApiCallResponse response=await ApiManager.instance.makeApiCall(
      callName: 'List_Logs', 
      apiUrl: buildUrl('/cases/${SharedPrefernce.getcaseId()}/logs'),
      callType:ApiCallType.GET,
      headers: {'Authorization':'Bearer ${SharedPrefernce.getAccessToken()}'},
      bodyType: BodyType.JSON,
      params: {'page':page,'pageSize':pageSize},
      );
      
    return CustomResponse.completed(
        await compute(ListCaseLogsResponseFromJson, jsonEncode(response.jsonBody)),
        response.statusCode);
  }
}