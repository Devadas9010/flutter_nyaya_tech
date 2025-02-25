import 'package:nyaya_tech/backend/app_response.dart';
import 'package:nyaya_tech/backend/custom_response.dart';
import 'package:nyaya_tech/backend/services/create_user_api.dart';
import 'package:nyaya_tech/dtos/add_user_dto.dart';
import 'package:nyaya_tech/response/add_user_name_response.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';

class WelcomeScreenModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {}

  bool error = false;
  bool isValidation = false;
  String message = '';
  AppResponse? appResponse;
  dynamic errorInstance;
  dynamic stateerror;
  dynamic gendererror;
  dynamic errorInstance1;

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }

  Future<void> fetchName(
      {required String firstname,
      required String lastName,
      required String gender,
      required String state}) async {
    AddUserDto userDto = AddUserDto(
        firstName: firstname, lastName: lastName, gender: gender, state: state);
    CustomResponse<AdduserName> response =
        await userNameApi().call(adduserdto: userDto);
    switch (response.statusCode) {
      case 200:
      case 201:
        message = response.data!.message.toString();
        error = false;
      case 422:
        message = response.data!.message.toString();
        error = true;
        isValidation = true;
        errorInstance = response.data!.errData != null
            ? {
                "first_name": response.data!.errData!.firstName?.join(', ') ??
                    "Unknow error"
              }
            : null;
        errorInstance1 = response.data!.errData != null
            ? {
                "last_name": response.data!.errData!.lastName?.join(', ') ??
                    "Unknow error"
              }
            : null;
        stateerror =
            response.data?.errData?.state?.join(', ') ?? "Unknown error";
        gendererror = response.data?.errData?.gender?.join(', ') ?? "Unknown error";
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
}
