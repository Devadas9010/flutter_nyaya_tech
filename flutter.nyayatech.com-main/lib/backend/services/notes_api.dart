import 'package:flutter/foundation.dart';
import 'package:nyaya_tech/backend/api_manager.dart';
import 'package:nyaya_tech/backend/api_service.dart';
import 'package:nyaya_tech/backend/custom_response.dart';
import 'package:nyaya_tech/data_components/shared_prefernce.dart';
import 'package:nyaya_tech/dtos/add_notes_dto.dart';
import 'package:nyaya_tech/flutter_flow/flutter_flow_util.dart';
import 'package:nyaya_tech/response/create_notes_response.dart';
import 'package:nyaya_tech/response/delete_response.dart';
import 'package:nyaya_tech/response/list_case_response.dart';
import 'package:nyaya_tech/response/view_notes_response.dart';

class NotesApi {
  Future<CustomResponse<CasesNotesResponse>> call(
      {int? page, int? limit}) async {
    ApiCallResponse response = await ApiManager.instance.makeApiCall(
      callName: 'List_Notes',
      apiUrl: buildUrl('/cases/${SharedPrefernce.getcaseId()}/notes'),
      callType: ApiCallType.GET,
      headers: {'Authorization': 'Bearer ${SharedPrefernce.getAccessToken()}'},
      params: {'page': page, 'page_size': limit, 'type': 'NOTE'},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
    return CustomResponse.completed(
        await compute(
            casesNotesResponseFromJson, jsonEncode(response.jsonBody)),
        response.statusCode);
  }
}

class ViewNotesApi {
  Future<CustomResponse<ViewCasesNotesResponse>> call() async {
    ApiCallResponse response = await ApiManager.instance.makeApiCall(
      callName: 'View_Note_Api',
      apiUrl: buildUrl('/notes/${SharedPrefernce.getnotesId()}'),
      callType: ApiCallType.GET,
      headers: {'Authorization': 'Bearer ${SharedPrefernce.getAccessToken()}'},
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
    return CustomResponse.completed(
        await compute(
            viewCasesNotesResponseFromJson, jsonEncode(response.jsonBody)),
        response.statusCode);
  }
}

class CreateNotesApi {
  Future<CustomResponse<CreateCasesNotesResponse>> call(
      {required AddNotesDto addnotedto}) async {
    ApiCallResponse response = await ApiManager.instance.makeApiCall(
        callName: 'Create_Notes',
        apiUrl: buildUrl('/notes'),
        callType: ApiCallType.POST,
        headers: {
          'Authorization': "Bearer ${SharedPrefernce.getAccessToken()}"
        },
        params: {},
        body: jsonEncode(addnotedto),
        bodyType: BodyType.JSON,
        returnBody: true,
        encodeBodyUtf8: false,
        decodeUtf8: false,
        cache: false);
    return CustomResponse.completed(
        await compute(
            createCasesNotesResponseFromJson, jsonEncode(response.jsonBody)),
        response.statusCode);
  }
}

class UpdateNotesApi {
  Future<CustomResponse<CreateCasesNotesResponse>> call(
      {required AddNotesDto addnotedto}) async {
    ApiCallResponse response = await ApiManager.instance.makeApiCall(
        callName: 'Create_Notes',
        apiUrl: buildUrl('/notes/${SharedPrefernce.getnotesId()}'),
        callType: ApiCallType.PATCH,
        headers: {
          'Authorization': "Bearer ${SharedPrefernce.getAccessToken()}"
        },
        params: {},
        body: jsonEncode(addnotedto),
        bodyType: BodyType.JSON,
        returnBody: true,
        encodeBodyUtf8: false,
        decodeUtf8: false,
        cache: false);
    return CustomResponse.completed(
        await compute(
            createCasesNotesResponseFromJson, jsonEncode(response.jsonBody)),
        response.statusCode);
  }
}

class DeleteNotesApi {
  Future<CustomResponse<NotesDeleteResponse>> call({int? limit = 100}) async {
    ApiCallResponse response = await ApiManager.instance.makeApiCall(
        callName: 'Create_Notes',
        apiUrl: buildUrl('/notes/${SharedPrefernce.getnotesId()}'),
        callType: ApiCallType.DELETE,
        headers: {
          'Authorization': "Bearer ${SharedPrefernce.getAccessToken()}"
        },
        params: {'page_size': limit},
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
