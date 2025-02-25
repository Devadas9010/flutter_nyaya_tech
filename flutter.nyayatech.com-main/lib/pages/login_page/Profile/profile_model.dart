import 'package:nyaya_tech/backend/custom_response.dart';
import 'package:nyaya_tech/backend/services/create_user_api.dart';
import 'package:nyaya_tech/response/assigne_response.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';

class UserProfileModel extends FlutterFlowModel {
  @override
  void initState(BuildContext context) {}

  userdata? user;

  @override
  void dispose() {}

  Future<void> fetchProfile() async {
    CustomResponse<AssigneResponse> response = await ProfileApi().call();
    if (response.statusCode == 200) {
      user = response.data!.data;
    } else {
      print('some thing went wrong');
    }
  }
}
