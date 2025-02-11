import 'package:nyaya_tech/backend/custom_response.dart';
import 'package:nyaya_tech/backend/services/user_profile_api.dart';
import 'package:nyaya_tech/data_components/shared_preference.dart';
import 'package:nyaya_tech/responses/single_user_response.dart';
import 'package:nyaya_tech/responses/view_user_profile_response.dart';

import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

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
