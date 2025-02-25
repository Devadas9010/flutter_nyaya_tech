import 'package:flutter/material.dart';
import 'package:nyaya_tech/backend/app_response.dart';
import 'package:nyaya_tech/backend/custom_response.dart';
import 'package:nyaya_tech/backend/services/login_api.dart';
import 'package:nyaya_tech/flutter_flow/flutter_flow_util.dart';
import 'package:nyaya_tech/response/mail_response.dart';

class LoginPageModel extends FlutterFlowModel {
  @override
  void initState(BuildContext context) {}

  bool error = false;
  bool isValidation = false;
  String message = '';
  AppResponse? appResponse;
  dynamic errorInstance;

  @override
  void dispose() {}

  Future<void> fetchMail({required String mail}) async {
    CustomResponse<SendOtpResponse> response =
        await SendOtpApi().call(phone: mail);
    error = false;
    isValidation = false;
    message = '';
    appResponse = AppResponse(response: response);
    switch (response.statusCode) {
      case 200:
      case 201:
        message = response.data!.message.toString();
        break;
      case 422:
        message = response.data!.message.toString();
        errorInstance = response.data!.errData != null
            ? {
                "phone": response.data!.errData!.phone?.join(', ') ??
                    "Unknown error",
              }
            : null;
        isValidation = true;
        error = true;
      case 401:
        message = response.data!.message.toString();
        isValidation = false;
        error = true;
        break;
      default:
        message = response.data!.message.toString();
        error = true;
    }
  }
}
