import 'package:flutter/foundation.dart';
import 'package:nyaya_tech/backend/api_manager.dart';
import 'package:nyaya_tech/backend/api_service.dart';
import 'package:nyaya_tech/backend/custom_response.dart';
import 'package:nyaya_tech/flutter_flow/flutter_flow_util.dart';
import 'package:nyaya_tech/responses/send_otp_response.dart';

class OtpVerficationApi {
  Future<CustomResponse<OtpResponse>> call(
      {required String phone, required String otp}) async {
    final body = {
      'phone': "+91$phone",
      'otp': otp,
    };
    ApiCallResponse response = await ApiManager.instance.makeApiCall(
        callName: 'verfication_otp',
        apiUrl: buildUrl('/auth/signup-or-signin/verify'),
        callType: ApiCallType.POST,
        body: jsonEncode(body),
        bodyType: BodyType.JSON,
        
        );
    return CustomResponse.completed(
        await compute(otpResponseFromJson, jsonEncode(response.jsonBody)),
        response.statusCode);
  }
}
