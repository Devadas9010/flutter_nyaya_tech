import 'package:nyaya_tech/backend/custom_response.dart';
import 'package:nyaya_tech/backend/services/user_profile_api.dart';
import 'package:nyaya_tech/data_components/shared_preference.dart';
import 'package:nyaya_tech/responses/single_user_response.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';

class UserProfileModel extends FlutterFlowModel {
  @override
  void initState(BuildContext context) {}

  singleuserdata? user;

  @override
  void dispose() {}

  Future<void> fetchUserProfile() async {
    CustomResponse<SingleUserResponse> response = await UserProfileApi().call();
    if (response.statusCode == 200) {
      user = response.data!.data;
   
    } else {
      print('some thing went wrong');
    }
  }
}
