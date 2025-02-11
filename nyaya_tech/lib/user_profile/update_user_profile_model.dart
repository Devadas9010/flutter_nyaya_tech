import 'package:nyaya_tech/backend/app_response.dart';
import 'package:nyaya_tech/backend/custom_response.dart';
import 'package:nyaya_tech/backend/services/user_profile_api.dart';
import 'package:nyaya_tech/responses/update_user_profile_response.dart';
import 'package:nyaya_tech/responses/view_user_profile_response.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';

class UpdateUserProfileModel extends FlutterFlowModel {

  @override
  void initState(BuildContext context) {}
  ViewProfileData? viewuser;
  bool error = false;
  bool isValidation = false;
  String message = '';
  AppResponse? appResponse;
  dynamic errorInstance1;
  dynamic errorInstance2;
  dynamic errorInstance3;
  dynamic errorinstance4;
  dynamic errorinstance5;
  dynamic errorinstance6;

  @override
  void dispose() {}

  Future<void> fetchUpdateUser(
      {required int userid,
      required String firstName,
      required String lastName,
      required String email,
      required String phone,
      required String address,
      required String dateOfBirth,
      required String gender}) async {
    CustomResponse<UpdateUserProfileResponse> response =
        await UpdateUserProfileApi().call(
            userid: userid,
            firstName: firstName,
            lastName: lastName,
            email: email,
            phone: phone,
            address: address,
            dateOfBirth: dateOfBirth,
            gender: gender);

    if (response.statusCode == 200 || response.statusCode == 201) {
      message = response.data!.message.toString();
    } else {
      message = response.data!.message.toString();
    }
  }


  
}
