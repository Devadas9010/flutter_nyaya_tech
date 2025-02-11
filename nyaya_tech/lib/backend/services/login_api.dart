import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:nyaya_tech/backend/api_manager.dart';
import 'package:nyaya_tech/backend/api_service.dart';
import 'package:nyaya_tech/backend/custom_response.dart';
import 'package:nyaya_tech/responses/phone_response.dart';

class SendOtpApi {
  Future<CustomResponse<SendOtpResponse>> call({required String phone}) async {
    final body = {
      'phone': phone,
    };
    ApiCallResponse response = await ApiManager.instance.makeApiCall(
      callName: 'send_otp_api',
      apiUrl: buildUrl('/auth/signup-or-signin'),
      params: {},
      callType: ApiCallType.POST,
      headers:{},
      body: jsonEncode(body),
      bodyType: BodyType.JSON,
    );

    return CustomResponse.completed(
        await compute(sendOtpResponseFromJson, jsonEncode(response.jsonBody)),
        response.statusCode);
  }
}
