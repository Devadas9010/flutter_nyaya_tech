import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:nyaya_tech/backend/api_manager.dart';
import 'package:nyaya_tech/backend/api_service.dart';
import 'package:nyaya_tech/backend/custom_response.dart';
import 'package:nyaya_tech/data_components/shared_preference.dart';
import 'package:nyaya_tech/responses/create_chat_response.dart';
import 'package:nyaya_tech/responses/get_all_chats_response.dart';

class GetAllChatsApi {
  Future<CustomResponse<GetAllChatsResponse>> call() async {
    ApiCallResponse response = await ApiManager.instance.makeApiCall(
      callName: 'get_all_chats_api',
      apiUrl: buildUrl('/cases/${SharedPrefernce.getcaseId()}/chats'),
      callType: ApiCallType.GET,
      headers: {'Authorization': "Bearer ${SharedPrefernce.getAccessToken()}"},
      bodyType: BodyType.JSON,
    );

    return CustomResponse.completed(
        await compute(
            getAllChatsResponseFromJson, jsonEncode(response.jsonBody)),
        response.statusCode);
  }
}

class CreateChatApi {
  Future<CustomResponse<CreateChatResponse>> call({
    required int case_id,
    required String message,
    required String type,
  }) async {
    final body = {
      "case_id": case_id,
      "message": message,
      "type": type,
    };

    ApiCallResponse response = await ApiManager.instance.makeApiCall(
      callName: 'create_chat_api',
      apiUrl: buildUrl('/chat'),
      callType: ApiCallType.POST,
      headers: {'Authorization': "Bearer ${SharedPrefernce.getAccessToken()}"},
      bodyType: BodyType.JSON,
      body: jsonEncode(body),
    );

    return CustomResponse.completed(
        await compute(
            createChatResponseFromJson, jsonEncode(response.jsonBody)),
        response.statusCode);
  }
}
