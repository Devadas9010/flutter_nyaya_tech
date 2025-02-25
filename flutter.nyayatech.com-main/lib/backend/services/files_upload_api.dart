import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:nyaya_tech/backend/api_manager.dart';
import 'package:nyaya_tech/backend/api_service.dart';
import 'package:nyaya_tech/backend/custom_response.dart';
import 'package:nyaya_tech/data_components/shared_prefernce.dart';
import 'package:nyaya_tech/dtos/file_upload_dto.dart';
import 'package:nyaya_tech/dtos/key_file_dto.dart';
import 'package:nyaya_tech/response/file_upload_response.dart';
import 'package:nyaya_tech/response/s3_upload_respons.dart';

class FilesUploadApi {
  Future<CustomResponse<S3UploadResponse>> call(
      {required FileUploadDto fileDto}) async {
    ApiCallResponse response = await ApiManager.instance.makeApiCall(
        callName: 'File_upload_api',
        apiUrl: buildUrl('/files/upload'),
        callType: ApiCallType.POST,
        headers: {
          'Authorization': "Bearer ${SharedPrefernce.getAccessToken()}"
        },
        params: {},
        body: jsonEncode(fileDto),
        bodyType: BodyType.JSON,
        returnBody: true,
        encodeBodyUtf8: false,
        decodeUtf8: false,
        cache: false);

    return CustomResponse.completed(
        await compute(s3UploadResponseFromJson, jsonEncode(response.jsonBody)),
        response.statusCode);
  }
}

class FilesKeyApi {
  Future<CustomResponse<DocumentsUploadResponse>> call(
      {required KeyFileDto keydto}) async {
    ApiCallResponse response = await ApiManager.instance.makeApiCall(
        callName: 'File_upload_api',
        apiUrl: buildUrl('/docs'),
        callType: ApiCallType.POST,
        headers: {
          'Authorization': "Bearer ${SharedPrefernce.getAccessToken()}"
        },
        params: {},
        body: jsonEncode(keydto),
        bodyType: BodyType.JSON,
        returnBody: true,
        encodeBodyUtf8: false,
        decodeUtf8: false,
        cache: false);

    return CustomResponse.completed(
        await compute(
            documentsUploadResponseFromJson, jsonEncode(response.jsonBody)),
        response.statusCode);
  }
}
