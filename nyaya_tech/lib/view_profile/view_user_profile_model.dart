import 'package:nyaya_tech/backend/custom_response.dart';
import 'package:nyaya_tech/backend/services/user_profile_api.dart';
import 'package:nyaya_tech/data_components/shared_preference.dart';
import 'package:nyaya_tech/responses/view_user_profile_response.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';

class ViewProfileInformationModel extends FlutterFlowModel {
  @override
  void initState(BuildContext context) {}

  ViewProfileData? viewuser;

  @override
  void dispose() {}

  Future<void> fetchViewUserProfile() async {
    CustomResponse<ViewUserProfileResponse> response =
        await ViewUserProfileApi().call();
    if (response.statusCode == 200) {
      viewuser = response.data!.data!;
      SharedPrefernce.setprofileid(response.data!.data!.id!.toInt());

      SharedPrefernce.setfirstName(response.data!.data!.firstName.toString());
      SharedPrefernce.setlastName(response.data!.data!.lastName.toString());
      SharedPrefernce.setEmail(response.data!.data!.email.toString());
      SharedPrefernce.setcreatePhone(response.data!.data!.phone.toString());
      SharedPrefernce.setAddress(response.data!.data!.address.toString());
      SharedPrefernce.setDateOfBirth(
          response.data!.data!.dateOfBirth.toString());
      SharedPrefernce.setGender(response.data!.data!.gender.toString());
    } else {
      print('some thing went wrong');
    }
  }
}
