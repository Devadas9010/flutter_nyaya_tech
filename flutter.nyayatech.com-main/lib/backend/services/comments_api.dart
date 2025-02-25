import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:nyaya_tech/backend/api_manager.dart';
import 'package:nyaya_tech/backend/api_service.dart';
import 'package:nyaya_tech/backend/custom_response.dart';
import 'package:nyaya_tech/data_components/shared_prefernce.dart';
import 'package:nyaya_tech/dtos/comments_dto.dart';
import 'package:nyaya_tech/dtos/task_dto.dart';
import 'package:nyaya_tech/response/delete_response.dart';
import 'package:nyaya_tech/response/file_upload_response.dart';
import 'package:nyaya_tech/response/get_comments_response.dart';
import 'package:nyaya_tech/response/post_commonts_response.dart';

class PostCommentsApi {
  Future<CustomResponse<PostCommentResponse>> call(
      {required CommentsDto commentdto}) async {
    ApiCallResponse response = await ApiManager.instance.makeApiCall(
        callName: 'Post_Comments_Api',
        apiUrl: buildUrl('/chat'),
        callType: ApiCallType.POST,
        body: jsonEncode(commentdto),
        headers: {
          'Authorization': "Bearer ${SharedPrefernce.getAccessToken()}"
        },
        params: {},
        bodyType: BodyType.JSON,
        cache: false);

    return CustomResponse.completed(
        await compute(
            postCommentResponseFromJson, jsonEncode(response.jsonBody)),
        response.statusCode);
  }
}

class GetCommentsProcurementAPI {
  Future<CustomResponse<AllcommentsResponse>> call(
      {int? page, int? limit}) async {
    ApiCallResponse response = await ApiManager.instance.makeApiCall(
        callName: 'Get_comments_api',
        apiUrl: buildUrl('/cases/${SharedPrefernce.getcaseId()}/chats'),
        callType: ApiCallType.GET,
        headers: {
          'Authorization': "Bearer ${SharedPrefernce.getAccessToken()}"
        },
        params: {'page': page, 'page_size': limit},
        bodyType: BodyType.JSON,
        returnBody: true,
        encodeBodyUtf8: false,
        decodeUtf8: false,
        cache: false);

    return CustomResponse.completed(
        await compute(
            allcommentsResponseFromJson, jsonEncode(response.jsonBody)),
        response.statusCode);
  }
}

class DeleteSingleChatAPI {
  Future<CustomResponse<NotesDeleteResponse>> call() async {
    ApiCallResponse response = await ApiManager.instance.makeApiCall(
        callName: 'Delete_Single_chat',
        apiUrl: buildUrl('/chat/${SharedPrefernce.getcommentId()}'),
        callType: ApiCallType.DELETE,
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
        await compute(
            notesDeleteResponseFromJson, jsonEncode(response.jsonBody)),
        response.statusCode);
  }
}

class FilesUploadCommentApi {
  Future<CustomResponse<DocumentsUploadResponse>> call(
      {required TaskModuleAttachmentsDto fileDto}) async {
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
        await compute(
            documentsUploadResponseFromJson, jsonEncode(response.jsonBody)),
        response.statusCode);
  }
}

class FilesKeyCommentApi {
  Future<CustomResponse<DocumentsUploadResponse>> call(
      {required TaskModuleAttachmentsDto keydto, String key = ''}) async {
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
