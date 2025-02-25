import 'package:flutter/material.dart';
import 'package:nyaya_tech/backend/app_response.dart';
import 'package:nyaya_tech/backend/custom_response.dart';
import 'package:nyaya_tech/backend/services/create_case_api.dart';
import 'package:nyaya_tech/data_components/shared_prefernce.dart';
import 'package:nyaya_tech/dtos/create_case_dto.dart';
import 'package:nyaya_tech/flutter_flow/flutter_flow_util.dart';
import 'package:nyaya_tech/response/create_case_response.dart';

class Step3ScreenModel extends FlutterFlowModel {
  @override
  void initState(BuildContext context) {}
  bool error = false;
  bool isValidation = false;
  String message = '';
  AppResponse? appResponse;
  dynamic errorInstance;

  @override
  void dispose() {}

  Future<void> fetchAddCase(
      {required String servicetitle,
      required String caseType,
      required String issuetitle}) async {
    CreateCaseDto createCaseDto = CreateCaseDto(
        serviceTitle: servicetitle, caseType: caseType, issueTitle: issuetitle);
    CustomResponse<CreateCaseResponse> response =
        await CreateCaseApi().call(casecreatedto: createCaseDto);

    switch (response.statusCode) {
      case 200:
      case 201:
        message = response.data!.message.toString();
        SharedPrefernce.setassigneLawId(
            response.data!.data!.lawyerId.toString());
        error = false;
      case 422:
        message = response.data!.message.toString();
        error = true;
        isValidation = true;
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
