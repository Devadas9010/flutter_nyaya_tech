import 'package:flutter/foundation.dart';
import 'package:nyaya_tech/backend/api_manager.dart';
import 'package:nyaya_tech/backend/api_service.dart';
import 'package:nyaya_tech/backend/custom_response.dart';
import 'package:nyaya_tech/data_components/shared_preference.dart';
import 'package:nyaya_tech/flutter_flow/flutter_flow_util.dart';
import 'package:nyaya_tech/responses/view_Case_response.dart';

class ViewCaseApi {
  Future<CustomResponse<ViewCaseResponse>> call() async {
    ApiCallResponse response = await ApiManager.instance.makeApiCall(
      callName: 'View_case',
      apiUrl: buildUrl('/cases/${SharedPrefernce.getcaseId()}'),
      callType: ApiCallType.GET,
      headers: {'Authorization': "Bearer ${SharedPrefernce.getAccessToken()}"},
      params: {},
      bodyType: BodyType.JSON,
      // returnBody: true,
      // encodeBodyUtf8: false,
      // decodeUtf8: false,
      // cache: false,
    );

    return CustomResponse.completed(
        await compute(viewCaseResponseFromJson, jsonEncode(response.jsonBody)),
        response.statusCode);
  }
}
