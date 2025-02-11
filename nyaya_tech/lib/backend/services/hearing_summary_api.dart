import 'package:flutter/foundation.dart';
import 'package:nyaya_tech/backend/api_manager.dart';
import 'package:nyaya_tech/backend/api_service.dart';
import 'package:nyaya_tech/backend/custom_response.dart';
import 'package:nyaya_tech/data_components/shared_preference.dart';
import 'package:nyaya_tech/flutter_flow/flutter_flow_util.dart';
import 'package:nyaya_tech/responses/add_hearing_summary_response.dart';
import 'package:nyaya_tech/responses/list_all_cases_hearing_summary_response.dart';
import 'package:nyaya_tech/responses/view_hearing_summary_response.dart';

class ListAllCasesHearingSummaryApi {
  Future<CustomResponse<ListAllCasesHearingSummaryResponse>> call({required int page,required int pageSize}) async {
    ApiCallResponse response = await ApiManager.instance.makeApiCall(
      callName: "All_Cases_Summary",
      apiUrl: buildUrl('/cases/${SharedPrefernce.getcaseId()}/summary'),
      headers: {'Authorization': "Bearer ${SharedPrefernce.getAccessToken()}"},
      params: {'page':page,'pageSize':pageSize},
      callType: ApiCallType.GET,
      bodyType: BodyType.JSON,
    );

    return CustomResponse.completed(
        await compute(listAllCasesHearingSummaryResponseFromJson,
            jsonEncode(response.jsonBody)),
        response.statusCode);
  }
}

class AddHearingSummaryApi {
  Future<CustomResponse<AddHearingSummaryResponse>> call(
      {required int case_id,
      required String date,
      required String note}) async {
    final body = {
      'case_id': case_id,
      'date': date,
      'note': note,
    };
    ApiCallResponse response = await ApiManager.instance.makeApiCall(
      callName: 'Add_Hearing_Summary',
      apiUrl: buildUrl('/summary'),
      callType: ApiCallType.POST,
      headers: {'Authorization': 'Bearer ${SharedPrefernce.getAccessToken()}'},
      body: jsonEncode(body),
      bodyType: BodyType.JSON,
    );
    return CustomResponse.completed(
        await compute(
            addHearingSummaryResponseFromJson, jsonEncode(response.jsonBody)),
        response.statusCode);
  }
}

class ViewHearingSummaryApi {
  Future<CustomResponse<ViewHearingSummaryResponse>> call() async {
    ApiCallResponse response = await ApiManager.instance.makeApiCall(
      callName: "View_Hearing_Summary",
      apiUrl: buildUrl('/summary/${SharedPrefernce.getsummaryid()}'),
      headers: {'Authorization': "Bearer ${SharedPrefernce.getAccessToken()}"},
      callType: ApiCallType.GET,
      bodyType: BodyType.JSON,
    );

    return CustomResponse.completed(
        await compute(
            viewHearingSummaryResponseFromJson, jsonEncode(response.jsonBody)),
        response.statusCode);
  }
}
