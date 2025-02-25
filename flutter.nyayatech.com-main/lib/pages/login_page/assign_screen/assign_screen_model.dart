import 'package:flutter/material.dart';
import 'package:nyaya_tech/backend/custom_response.dart';
import 'package:nyaya_tech/backend/services/create_case_api.dart';
import 'package:nyaya_tech/data_components/shared_prefernce.dart';

import 'package:nyaya_tech/flutter_flow/flutter_flow_util.dart';
import 'package:nyaya_tech/response/assigne_response.dart';

class AssignScreenModel extends FlutterFlowModel {
  @override
  void initState(BuildContext context) {}
  userdata? user;
  @override
  void dispose() {}

  Future<void> fetchUser() async {
    CustomResponse<AssigneResponse> response = await GetAssigneApi().call();
    if (response.statusCode == 200) {
      user = response.data!.data;
      SharedPrefernce.setcaseId(user!.id!.toInt());
    } else {
      print('some thing went wrong');
    }
  }
}
