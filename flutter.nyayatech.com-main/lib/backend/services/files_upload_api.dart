import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:nyaya_tech/backend/api_manager.dart';
import 'package:nyaya_tech/backend/api_service.dart';
import 'package:nyaya_tech/backend/custom_response.dart';
import 'package:nyaya_tech/data_components/shared_prefernce.dart';
import 'package:nyaya_tech/dtos/file_upload_dto.dart';
import 'package:nyaya_tech/dtos/key_file_dto.dart';
import 'package:nyaya_tech/response/caes_dox_response.dart';
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


class UploadDocumentsApi {
  Future<CustomResponse<DocumentsUploadResponse>> call({
    required int case_id,
    required String stage,
    required String sub_stage,
    required String file_type,
    required String file_name,
    required int file_size,
    required String key,
  }) async {
    final body = {
      "case_id": case_id,
      "case_stage": stage,
      "case_sub_stage": sub_stage,
      "file_type": file_type,
      "file_name": file_name,
      "file_size": file_size,
      "key": key,
    };
    ApiCallResponse response = await ApiManager.instance.makeApiCall(
      callName: 'Upload_documents_api',
      apiUrl: buildUrl('/docs'),
      callType: ApiCallType.POST,
      headers: {'Authorization': "Bearer ${SharedPrefernce.getAccessToken()}"},
      params: {
      "case_stage": "Case Filing",
      "case_sub_stage": "Signing",
      },
      bodyType: BodyType.JSON,
      body: jsonEncode(body),
    );

    return CustomResponse.completed(
        await compute(
            documentsUploadResponseFromJson, jsonEncode(response.jsonBody)),
        response.statusCode);
  }
}


class GetListDocumentApi {
  Future<CustomResponse<ListCaseDox>> call() async {
    ApiCallResponse response = await ApiManager.instance.makeApiCall(
      callName: 'get_List_document_api',
      apiUrl: buildUrl('/cases/${SharedPrefernce.getcaseId()}/docs'),
      callType: ApiCallType.GET,
      headers: {'Authorization': "Bearer ${SharedPrefernce.getAccessToken()}"},
      params: {
        "case_stage": "Case Filing",
        "case_sub_stage": "Signing",
        // "verification_status": "APPROVED",
      },
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );

    return CustomResponse.completed(
        await compute(
            listCaseDoxFromJson, jsonEncode(response.jsonBody)),
        response.statusCode);
  }
}


class ListDocumentsApi {
  Future<CustomResponse<ListCaseDox>> call() async {
    ApiCallResponse response = await ApiManager.instance.makeApiCall(
      callName: 'get_List_document_api',
      apiUrl: buildUrl('/cases/${SharedPrefernce.getcaseId()}/docs'),
      callType: ApiCallType.GET,
      headers: {'Authorization': "Bearer ${SharedPrefernce.getAccessToken()}"},
      params: {
        "case_stage":"Case Filing",
        "case_sub_stage":"Signing",
     
      },
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );

    return CustomResponse.completed(
        await compute(
            listCaseDoxFromJson, jsonEncode(response.jsonBody)),
        response.statusCode);
  }
}