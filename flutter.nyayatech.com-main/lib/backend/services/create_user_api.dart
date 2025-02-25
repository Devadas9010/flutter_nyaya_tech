import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:nyaya_tech/backend/api_manager.dart';
import 'package:nyaya_tech/backend/api_service.dart';
import 'package:nyaya_tech/backend/custom_response.dart';
import 'package:nyaya_tech/data_components/shared_prefernce.dart';
import 'package:nyaya_tech/dtos/add_user_dto.dart';
import 'package:nyaya_tech/dtos/update_user_dto.dart';
import 'package:nyaya_tech/response/add_user_name_response.dart';
import 'package:nyaya_tech/response/assigne_response.dart';
import 'package:nyaya_tech/response/download_response.dart';
import 'package:nyaya_tech/response/update_user_response.dart';

class CreateUserApi {
  Future<CustomResponse<CreateuserResponse>> call(
      {required UpdateUserDto updateuser}) async {
    ApiCallResponse response = await ApiManager.instance.makeApiCall(
        callName: 'Update_user',
        apiUrl: buildUrl('/users/${SharedPrefernce.getloginId()}'),
        callType: ApiCallType.PATCH,
        headers: {
          'Authorization': "Bearer ${SharedPrefernce.getAccessToken()}"
        },
        params: {},
        body: jsonEncode(updateuser),
        bodyType: BodyType.JSON,
        returnBody: true,
        encodeBodyUtf8: false,
        decodeUtf8: false,
        cache: false);
    return CustomResponse.completed(
        await compute(
            createuserResponseFromJson, jsonEncode(response.jsonBody)),
        response.statusCode);
  }
}

class ProfileApi {
  Future<CustomResponse<AssigneResponse>> call() async {
    ApiCallResponse response = await ApiManager.instance.makeApiCall(
        callName: 'Profile_api',
        apiUrl: buildUrl('/users/${SharedPrefernce.getprofileid()}'),
        callType: ApiCallType.GET,
        headers: {
          'Authorization': "Bearer ${SharedPrefernce.getAccessToken()}"
        },
        params: {},
        bodyType: BodyType.JSON,
        returnBody: true,
        encodeBodyUtf8: false,
        decodeUtf8: false,
        cache: false);

    return CustomResponse.completed(
        await compute(assigneResponseFromJson, jsonEncode(response.jsonBody)),
        response.statusCode);
  }
}

class userNameApi {
  Future<CustomResponse<AdduserName>> call(
      {required AddUserDto adduserdto}) async {
    ApiCallResponse response = await ApiManager.instance.makeApiCall(
        callName: 'Update_Name',
        apiUrl:
            buildUrl('/users/create-user/${SharedPrefernce.getprofileid()}'),
        callType: ApiCallType.PATCH,
        headers: {
          'Authorization': "Bearer ${SharedPrefernce.getAccessToken()}"
        },
        params: {},
        body: jsonEncode(adduserdto),
        bodyType: BodyType.JSON,
        returnBody: true,
        encodeBodyUtf8: false,
        decodeUtf8: false,
        cache: false);
    return CustomResponse.completed(
        await compute(adduserNameFromJson, jsonEncode(response.jsonBody)),
        response.statusCode);
  }
}

class ImageDownloadApi {
  Future<CustomResponse<DownloadResponse>> call({required String file}) async {
    final body = {
      'file_key': file,
    };
    ApiCallResponse response = await ApiManager.instance.makeApiCall(
        callName: 'Download Image',
        apiUrl: buildUrl('/files/download'),
        callType: ApiCallType.POST,
        bodyType: BodyType.JSON,
        body: jsonEncode(body),
        returnBody: true,
        encodeBodyUtf8: false,
        decodeUtf8: false,
        cache: false);
    return CustomResponse.completed(
        await compute(downloadResponseFromJson, jsonEncode(response.jsonBody)),
        response.statusCode);
  }
}

class ViewUserProfileApi {
  Future<CustomResponse<AssigneResponse>> call() async {
    ApiCallResponse response = await ApiManager.instance.makeApiCall(
        callName: 'View profile',
        apiUrl: buildUrl('/users/${SharedPrefernce.getprofileid()}'),
        callType: ApiCallType.GET,
        headers: {
          'Authorization': "Bearer ${SharedPrefernce.getAccessToken()}"
        },
        params: {},
        bodyType: BodyType.JSON,
        returnBody: true,
        encodeBodyUtf8: false,
        decodeUtf8: false,
        cache: false);

    return CustomResponse.completed(
        await compute(assigneResponseFromJson, jsonEncode(response.jsonBody)),
        response.statusCode);
  }
}
