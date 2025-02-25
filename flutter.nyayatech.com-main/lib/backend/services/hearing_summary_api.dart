import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:nyaya_tech/backend/api_manager.dart';
import 'package:nyaya_tech/backend/api_service.dart';
import 'package:nyaya_tech/backend/custom_response.dart';
import 'package:nyaya_tech/data_components/shared_prefernce.dart';
import 'package:nyaya_tech/dtos/add_summary_notes.dart';
import 'package:nyaya_tech/response/case_summary_response.dart';
import 'package:nyaya_tech/response/post_hearing_summary_response.dart';
import 'package:nyaya_tech/response/summary_delete_response.dart';
import 'package:nyaya_tech/response/view_summary_response.dart';

class GetHearingSummaryApi {
  Future<CustomResponse<CaseSummaryResponse>> call(
      {int? page, int? limit}) async {
    ApiCallResponse response = await ApiManager.instance.makeApiCall(
        callName: 'Get_hearing_summary',
        apiUrl: buildUrl('/cases/${SharedPrefernce.getcaseId()}/notes'),
        callType: ApiCallType.GET,
        headers: {
          'Authorization': "Bearer ${SharedPrefernce.getAccessToken()}"
        },
        params: {'page': page, 'page_size': limit, 'type': 'SUMMARY'},
        bodyType: BodyType.JSON,
        returnBody: true,
        encodeBodyUtf8: false,
        decodeUtf8: false,
        cache: false);
    return CustomResponse.completed(
        await compute(
            caseSummaryResponseFromJson, jsonEncode(response.jsonBody)),
        response.statusCode);
  }
}

class PostHearingSummaryApi {
  Future<CustomResponse<PostCasesSummaryResponse>> call(
      {required AddSummarydto adsummartdto}) async {
    ApiCallResponse response = await ApiManager.instance.makeApiCall(
        callName: 'Post_Summary_api',
        apiUrl: buildUrl('/summary'),
        callType: ApiCallType.POST,
        headers: {
          'Authorization': "Bearer ${SharedPrefernce.getAccessToken()}"
        },
        params: {},
        body: jsonEncode(adsummartdto),
        bodyType: BodyType.JSON,
        returnBody: true,
        encodeBodyUtf8: false,
        decodeUtf8: false,
        cache: false);
    return CustomResponse.completed(
        await compute(
            postCasesSummaryResponseFromJson, jsonEncode(response.jsonBody)),
        response.statusCode);
  }
}

class ViewSummaryApi {
  Future<CustomResponse<ViewSummaryResponse>> call() async {
    ApiCallResponse response = await ApiManager.instance.makeApiCall(
        callName: 'View_summary_api',
        apiUrl: buildUrl('/summary/${SharedPrefernce.getsummaryid()}'),
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
        await compute(
            viewSummaryResponseFromJson, jsonEncode(response.jsonBody)),
        response.statusCode);
  }
}

class UpdateSummaryApi {
  Future<CustomResponse<PostCasesSummaryResponse>> call(
      {required AddSummarydto adsummartdto}) async {
    ApiCallResponse response = await ApiManager.instance.makeApiCall(
        callName: 'Updae_Summary_api',
        apiUrl: buildUrl('/summary/${SharedPrefernce.getsummaryid()}'),
        callType: ApiCallType.PATCH,
        headers: {
          'Authorization': "Bearer ${SharedPrefernce.getAccessToken()}"
        },
        params: {},
        body: jsonEncode(adsummartdto),
        bodyType: BodyType.JSON,
        returnBody: true,
        encodeBodyUtf8: false,
        decodeUtf8: false,
        cache: false);
    return CustomResponse.completed(
        await compute(
            postCasesSummaryResponseFromJson, jsonEncode(response.jsonBody)),
        response.statusCode);
  }
}

class DeleteSummaryApi {
  Future<CustomResponse<SummaryDeleteResponse>> call() async {
    ApiCallResponse response = await ApiManager.instance.makeApiCall(
        callName: 'Delete_summary',
        apiUrl: buildUrl('/summary/${SharedPrefernce.getsummaryid()}'),
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
        await compute(
            summaryDeleteResponseFromJson, jsonEncode(response.jsonBody)),
        response.statusCode);
  }
}
