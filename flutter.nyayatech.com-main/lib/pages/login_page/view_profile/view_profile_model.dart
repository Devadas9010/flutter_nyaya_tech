import 'package:nyaya_tech/backend/custom_response.dart';
import 'package:nyaya_tech/backend/services/create_user_api.dart';
import 'package:nyaya_tech/data_components/shared_prefernce.dart';
import 'package:nyaya_tech/flutter_flow/flutter_flow_model.dart';
import 'package:nyaya_tech/response/assigne_response.dart';

import 'package:flutter/material.dart';

class ViewProfileInformationModel extends FlutterFlowModel {
  @override
  void initState(BuildContext context) {}

  userdata? viewuser;

  @override
  void dispose() {}

  Future<void> fetchViewUserProfile() async {
    CustomResponse<AssigneResponse> response =
        await ViewUserProfileApi().call();
    if (response.statusCode == 200) {
      viewuser = response.data!.data!;
      SharedPrefernce.setprofileid(response.data!.data!.id!.toInt());
      SharedPrefernce.setfirstName(response.data!.data!.firstName.toString());
      SharedPrefernce.setsecondName(response.data!.data!.lastName.toString());
      SharedPrefernce.setemail(response.data!.data!.email.toString());
      SharedPrefernce.setAddress(response.data!.data!.address.toString());
      SharedPrefernce.setgender(response.data!.data!.gender.toString());
      SharedPrefernce.setstates(response.data!.data!.state.toString());
      SharedPrefernce.setfileKey(response.data!.data!.profilePic.toString());
      SharedPrefernce.sets3Url(response.data!.data!.profilePic.toString());
      SharedPrefernce.setdateOfBirth(
          response.data!.data!.dateOfBirth.toString());
      SharedPrefernce.setbio(response.data!.data!.bio.toString());
      SharedPrefernce.setaaddhar(response.data!.data!.aadhaar.toString());
      SharedPrefernce.setoccupation(response.data!.data!.occupation.toString());
      SharedPrefernce.setqulification(
          response.data!.data!.qualification.toString());
    } else {
      print('some thing went wrong');
    }
  }
}
