import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:nyaya_tech/backend/api_manager.dart';
import 'package:nyaya_tech/backend/api_service.dart';
import 'package:nyaya_tech/backend/custom_response.dart';
import 'package:nyaya_tech/data_components/shared_preference.dart';
import 'package:nyaya_tech/responses/single_user_response.dart';
import 'package:nyaya_tech/responses/update_user_profile_response.dart';
import 'package:nyaya_tech/responses/view_user_profile_response.dart';

class UserProfileApi {
  Future<CustomResponse<SingleUserResponse>> call() async {
    ApiCallResponse response = await ApiManager.instance.makeApiCall(
      callName: 'Profile_api',
      apiUrl: buildUrl('/users/${SharedPrefernce.getprofileid()}'),
      callType: ApiCallType.GET,
      headers: {'Authorization': "Bearer ${SharedPrefernce.getAccessToken()}"},
      params: {},
      bodyType: BodyType.JSON,
    );

    return CustomResponse.completed(
        await compute(
            SingleUserResponseFromJson, jsonEncode(response.jsonBody)),
        response.statusCode);
  }
}



class ViewUserProfileApi {
  Future<CustomResponse<ViewUserProfileResponse>> call() async {
    ApiCallResponse response = await ApiManager.instance.makeApiCall(
      callName: 'View_Profile_api',
      apiUrl: buildUrl('/users/${SharedPrefernce.getprofileid()}'),
      callType: ApiCallType.GET,
      headers: {'Authorization': "Bearer ${SharedPrefernce.getAccessToken()}"},
      params: {},
      bodyType: BodyType.JSON,
    );

    return CustomResponse.completed(
        await compute(
            viewUserProfileResponseFromJson, jsonEncode(response.jsonBody)),
        response.statusCode);
  }
}






class UpdateUserProfileApi {
  Future<CustomResponse<UpdateUserProfileResponse>> call({
    required int userid,
    required String firstName,
    required String lastName,
    required String email,
    required String phone,
    required String address,
    required String dateOfBirth,
    required String gender,
  }) async {
    final body = {
      'id': userid,
      'first_name': firstName,
      'last_name': lastName,
      'email': email,
      'phone': phone,
      'address': address,
      'date_of_birth': dateOfBirth,
      'gender': gender,
    };
    ApiCallResponse response = await ApiManager.instance.makeApiCall(
      callName: 'update_profile_api',
      apiUrl: buildUrl('/users/${SharedPrefernce.getloginId()}'),
      callType: ApiCallType.PATCH,
      headers: {'Authorization': 'Bearer ${SharedPrefernce.getAccessToken()}'},
      body: jsonEncode(body),
      bodyType: BodyType.JSON,
    );
    return CustomResponse.completed(
        await compute(
            updateUserProfileResponseFromJson, jsonEncode(response.jsonBody)),
        response.statusCode);
  }
}
