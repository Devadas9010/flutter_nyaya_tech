import 'package:flutter/foundation.dart';
import 'package:nyaya_tech/backend/api_manager.dart';
import 'package:nyaya_tech/backend/api_service.dart';
import 'package:nyaya_tech/backend/custom_response.dart';
import 'package:nyaya_tech/data_components/shared_preference.dart';
import 'package:nyaya_tech/flutter_flow/flutter_flow_util.dart';
import 'package:nyaya_tech/responses/list_all_Cases_response.dart';

class ListAllCasesApi {
  Future<CustomResponse<ListAllCases>> call({required int page,required int pageSize}) async {
    ApiCallResponse response = await ApiManager.instance.makeApiCall(
      callName: 'List_case',
      apiUrl: buildUrl('/cases'),
      callType: ApiCallType.GET,
      headers: {'Authorization': "Bearer ${SharedPrefernce.getAccessToken()}"},
      params: {'page':page,'pageSize':pageSize},
      bodyType: BodyType.JSON,
     
    );

    return CustomResponse.completed(
        await compute(listAllCasesFromJson, jsonEncode(response.jsonBody)),
        response.statusCode);
  }
}
