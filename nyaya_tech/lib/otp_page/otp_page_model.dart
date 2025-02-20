import 'package:nyaya_tech/backend/app_response.dart';
import 'package:nyaya_tech/backend/custom_response.dart';
import 'package:nyaya_tech/backend/services/otp_verification_api.dart';
import 'package:nyaya_tech/data_components/shared_preference.dart';
import 'package:nyaya_tech/responses/send_otp_response.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'otp_page_widget.dart' show OtpPageWidget;
import 'package:flutter/material.dart';

class OtpPageModel extends FlutterFlowModel<OtpPageWidget> {
  TextEditingController OTPController = TextEditingController();
  String? Function(BuildContext, String?)? pinCodeControllerValidator;

  bool error = false;
  bool isValidation = false;
  String message = '';
  AppResponse? appResponse;

  @override
  void initState(BuildContext context) {
    OTPController = TextEditingController();
  }

  @override
  void dispose() {
    OTPController.dispose();
  }

  Future<void> fetchOTP({required String phone, required String otp}) async {
    CustomResponse<OtpResponse> response =
        await OtpVerficationApi().call(phone: phone, otp: otp);

    error = false;
    isValidation = false;
    message = '';
    appResponse = AppResponse(response: response);

    SharedPrefernce.setAccessToken(response.data!.data!.accessToken.toString());
    print('accesstoken -- ${SharedPrefernce.getAccessToken()}');

    SharedPrefernce.setprofileid(response.data!.data!.userDetails!.id!.toInt());
    print('profile id -- ${SharedPrefernce.getprofileid()}');

    SharedPrefernce.setloginId(response.data!.data!.userDetails!.id!.toInt());
    print('login id -- ${SharedPrefernce.getloginId()}');

    if (response.statusCode == 200 || response.statusCode == 201) {
      message = response.data!.message.toString();
    } else {
      message = response.data!.message.toString();
    }
  }
}
