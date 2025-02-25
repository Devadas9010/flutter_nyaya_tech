import 'package:nyaya_tech/backend/app_response.dart';
import 'package:nyaya_tech/backend/custom_response.dart';
import 'package:nyaya_tech/backend/services/create_user_api.dart';
import 'package:nyaya_tech/dtos/update_user_dto.dart';
import 'package:nyaya_tech/response/download_response.dart';
import 'package:nyaya_tech/response/update_user_response.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';

class AddUserModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  @override
  void initState(BuildContext context) {}
  bool error = false;
  bool isValidation = false;
  String message = '';
  AppResponse? appResponse;
  dynamic errorInstance;
  dynamic errorInstance1;
  dynamic errorInstance2;
  dynamic errorinstance3;
  dynamic errorinstance4;
  dynamic errorinstance5;
  dynamic bioerror;
  dynamic aaddharerror;
  dynamic occupationerror;
  dynamic qulificationerror;
  dynamic stateerror;
  dynamic addresserror;
  DownloadUrl? data;

  @override
  void dispose() {}

  Future<void> fetchUpdateUser(
      {required int userid,
      required String firstName,
      required String lastName,
      required String phone,
      required String dateofBirth,
      required String address,
      required String gender,
      required String email,
      String? profilePic,
      required String state,
      required String bio,
      required String qualification,
      required String aadhaar,
      required String occupation}) async {
    UpdateUserDto userDto = UpdateUserDto(
        userid: userid,
        firstName: firstName,
        lastName: lastName,
        phone: phone,
        dateofBirth: dateofBirth,
        gender: gender,
        address: address,
        email: email,
        profilePic: profilePic,
        state: state,
        bio: bio,
        aadhaar: aadhaar,
        occupation: occupation,
        qualification: qualification);
    CustomResponse<CreateuserResponse> response =
        await CreateUserApi().call(updateuser: userDto);
    switch (response.statusCode) {
      case 200:
      case 201:
        message = response.data!.message.toString();
        error = false;
      case 422:
        error = true;
        message = response.data!.message.toString();
        isValidation = true;
        errorInstance = response.data!.errData != null
            ? {
                "first_name": response.data!.errData!.firstName?.join(', ') ??
                    "Unknow error"
              }
            : null;
        errorinstance3 = response.data!.errData != null
            ? {
                "last_name": response.data!.errData!.lastName?.join(', ') ??
                    "Unknow error"
              }
            : null;
        errorInstance1 = response.data!.errData != null
            ? {
                "phone":
                    response.data!.errData!.phone?.join(', ') ?? "Unknow error"
              }
            : null;
        errorInstance2 = response.data!.errData != null
            ? {
                "date_of_birth":
                    response.data!.errData!.dateOfBirth?.join(', ') ??
                        "Unknow error"
              }
            : null;
        errorinstance5 = response.data!.errData != null
            ? {
                "email":
                    response.data!.errData!.email?.join(', ') ?? "Unknow error"
              }
            : null;
        errorinstance4 =
            response.data?.errData?.gender?.join(', ') ?? "Unknown error";
        addresserror = response.data!.errData != null
            ? {
                "address": response.data!.errData!.address?.join(', ') ??
                    "Unknow error"
              }
            : null;
        bioerror = response.data!.errData != null
            ? {"bio": response.data!.errData!.bio?.join(', ') ?? "Unknow error"}
            : null;
        aaddharerror = response.data!.errData != null
            ? {
                "aadhaar": response.data!.errData!.aadhaar?.join(', ') ??
                    "Unknow error"
              }
            : null;
        stateerror =
            response.data?.errData?.state?.join(', ') ?? "Unknown error";
        qulificationerror = response.data?.errData?.qualification?.join(', ') ??
            "Unknown error";
        occupationerror =
            response.data?.errData?.occupation?.join(', ') ?? "Unknown error";

      case 401:
        message = response.data!.message.toString();
        isValidation = true;
        error = true;
        break;
      default:
        error = true;
        message = response.data!.message.toString();
    }
  }

  Future<void> fetchDownloadUrl({required String file}) async {
    CustomResponse<DownloadResponse> response =
        await ImageDownloadApi().call(file: file);
    if (response.statusCode == 200) {
      data = response.data!.data;
    } else {
      print('error');
    }
  }
}
