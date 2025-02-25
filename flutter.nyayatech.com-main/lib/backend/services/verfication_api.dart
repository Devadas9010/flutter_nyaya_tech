import 'package:flutter/foundation.dart';
import 'package:nyaya_tech/backend/api_manager.dart';
import 'package:nyaya_tech/backend/api_service.dart';
import 'package:nyaya_tech/backend/custom_response.dart';
import 'package:nyaya_tech/data_components/shared_prefernce.dart';
import 'package:nyaya_tech/flutter_flow/flutter_flow_util.dart';
import 'package:nyaya_tech/response/send_otp_response.dart';

class VerficationApi {
  Future<CustomResponse<OtpResponse>> call(
      {required String email, required String otp}) async {
    final body = {
      'phone': "+91$email",
      'otp': otp,
      'device_token': SharedPrefernce.getfcmToken()
    };
    ApiCallResponse response = await ApiManager.instance.makeApiCall(
        callName: 'verfication',
        apiUrl: buildUrl('/auth/signup-or-signin/verify'),
        callType: ApiCallType.POST,
        body: jsonEncode(body),
        bodyType: BodyType.JSON,
        returnBody: true,
        encodeBodyUtf8: false,
        decodeUtf8: false,
        cache: false);
    return CustomResponse.completed(
        await compute(otpResponseFromJson, jsonEncode(response.jsonBody)),
        response.statusCode);
  }
}
