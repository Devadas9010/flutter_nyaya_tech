import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:nyaya_tech/backend/api_manager.dart';
import 'package:nyaya_tech/backend/api_service.dart';
import 'package:nyaya_tech/backend/custom_response.dart';
import 'package:nyaya_tech/classes/file_upload_class.dart';
import 'package:nyaya_tech/data_components/shared_preference.dart';
import 'package:nyaya_tech/responses/delete_file_response.dart';
import 'package:nyaya_tech/responses/download_file_response.dart';
import 'package:nyaya_tech/responses/file_upload_response.dart';
import 'package:nyaya_tech/responses/get_list_documents_response.dart';
import 'package:nyaya_tech/responses/get_single_document_response.dart';
import 'package:nyaya_tech/responses/upload_documents_response.dart';
import 'package:nyaya_tech/responses/upload_multiple_documents_response.dart';

class FilesUploadApi {
  Future<CustomResponse<FilesUploadResponse>> call(
      {required FileUploadClass fileClass}) async {
    ApiCallResponse response = await ApiManager.instance.makeApiCall(
      callName: 'Files_upload_api',
      apiUrl: buildUrl('/files/upload'),
      callType: ApiCallType.POST,
      headers: {'Authorization': "Bearer ${SharedPrefernce.getAccessToken()}"},
      params: {},
      bodyType: BodyType.JSON,
      body: jsonEncode(fileClass),
    );

    return CustomResponse.completed(
        await compute(
            filesUploadResponseFromJson, jsonEncode(response.jsonBody)),
        response.statusCode);
  }
}

class DownloadFileApi {
  Future<CustomResponse<DownloadFileResponse>> call({
    required String key,
  }) async {
    final body = {
      "file_key": key,
    };
    ApiCallResponse response = await ApiManager.instance.makeApiCall(
      callName: 'download_file_api',
      apiUrl: buildUrl('/files/download'),
      callType: ApiCallType.POST,
      headers: {'Authorization': "Bearer ${SharedPrefernce.getAccessToken()}"},
      params: {},
      bodyType: BodyType.JSON,
      body: jsonEncode(body),
    );

    return CustomResponse.completed(
        await compute(
            downloadFileResponseFromJson, jsonEncode(response.jsonBody)),
        response.statusCode);
  }
}

class UploadDocumentsApi {
  Future<CustomResponse<UploadDocumentsResponse>> call({
    required int case_id,
    required String file_type,
    required String file_name,
    required int file_size,
    required String key,
  }) async {
    final body = {
      "case_id": case_id,
      "file_type": file_type,
      "filename": file_name,
      "file_size": file_size,
      "key": key,
    };
    ApiCallResponse response = await ApiManager.instance.makeApiCall(
      callName: 'Upload_documents_api',
      apiUrl: buildUrl('/docs'),
      callType: ApiCallType.POST,
      headers: {'Authorization': "Bearer ${SharedPrefernce.getAccessToken()}"},
      params: {},
      bodyType: BodyType.JSON,
      body: jsonEncode(body),
    );

    return CustomResponse.completed(
        await compute(
            uploadDocumentsResponseFromJson, jsonEncode(response.jsonBody)),
        response.statusCode);
  }
}

class UploadMultipleDocumentsApi {
  Future<CustomResponse<UploadMultipleDocumentsResponse>> call({
    required List<Map<String, dynamic>> docs,
  }) async {
    final body = {
      "docs": docs,
    };

    ApiCallResponse response = await ApiManager.instance.makeApiCall(
      callName: 'upload_multiple_documents_api',
      apiUrl: buildUrl('/docs/multiple'),
      callType: ApiCallType.POST,
      headers: {'Authorization': "Bearer ${SharedPrefernce.getAccessToken()}"},
      params: {},
      bodyType: BodyType.JSON,
      body: jsonEncode(body),
    );

    return CustomResponse.completed(
        await compute(uploadMultipleDocumentsResponseFromJson,
            jsonEncode(response.jsonBody)),
        response.statusCode);
  }
}

class GetSingleDocumentApi {
  Future<CustomResponse<GetSingleDocumentResponse>> call() async {
    ApiCallResponse response = await ApiManager.instance.makeApiCall(
      callName: 'get_single_document_api',
      apiUrl: buildUrl('/docs/2'),
      callType: ApiCallType.GET,
      headers: {'Authorization': "Bearer ${SharedPrefernce.getAccessToken()}"},
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );

    return CustomResponse.completed(
        await compute(
            getSingleDocumentResponseFromJson, jsonEncode(response.jsonBody)),
        response.statusCode);
  }
}

class GetListDocumentApi {
  Future<CustomResponse<GetListDocumentResponse>> call() async {
    ApiCallResponse response = await ApiManager.instance.makeApiCall(
      callName: 'get_List_document_api',
      apiUrl: buildUrl('/cases/${SharedPrefernce.getcaseId()}/docs'),
      callType: ApiCallType.GET,
      headers: {'Authorization': "Bearer ${SharedPrefernce.getAccessToken()}"},
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );

    return CustomResponse.completed(
        await compute(
            getListDocumentResponseFromJson, jsonEncode(response.jsonBody)),
        response.statusCode);
  }
}

class DeleteFileApi {
  Future<CustomResponse<DeleteFileRespose>> call() async {
    ApiCallResponse response = await ApiManager.instance.makeApiCall(
      callName: 'Delete_file_api',
      apiUrl: buildUrl('/docs/${SharedPrefernce.getfileId()}'),
      callType: ApiCallType.DELETE,
      headers: {'Authorization': "Bearer ${SharedPrefernce.getAccessToken()}"},
      params: {},
      bodyType: BodyType.JSON,
    );
    return CustomResponse.completed(
        await compute(deleteFileResposeFromJson, jsonEncode(response.jsonBody)),
        response.statusCode);
  }
}
