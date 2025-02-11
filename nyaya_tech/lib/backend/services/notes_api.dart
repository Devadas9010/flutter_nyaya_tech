import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:nyaya_tech/backend/api_manager.dart';
import 'package:nyaya_tech/backend/api_service.dart';
import 'package:nyaya_tech/backend/custom_response.dart';
import 'package:nyaya_tech/classes/add_note.dart';
import 'package:nyaya_tech/data_components/shared_preference.dart';
import 'package:nyaya_tech/responses/add_note_response.dart';
import 'package:nyaya_tech/responses/list_cases_notes_response.dart';
import 'package:nyaya_tech/responses/view_note_response.dart';

class FetchNotesApi {
  Future<CustomResponse<ListCasesNotesResponse>> call({required int page,required int pageSize}) async {
    ApiCallResponse response = await ApiManager.instance.makeApiCall(
      callName: 'List_Notes',
      apiUrl: buildUrl('/cases/${SharedPrefernce.getcaseId()}/notes'),
      callType: ApiCallType.GET,
      headers: {'Authorization': 'Bearer ${SharedPrefernce.getAccessToken()}'},
      params: {'page':page,'pageSize':pageSize},
      bodyType: BodyType.JSON,
    );
    return CustomResponse.completed(
        await compute(
            listCasesNotesResponseFromJson, jsonEncode(response.jsonBody)),
        response.statusCode);
  }
}

class AddNotesApi {
  Future<CustomResponse<AddNoteResponse>> call(
      {required AddNotes addnotes}) async {
    ApiCallResponse response = await ApiManager.instance.makeApiCall(
      callName: 'Add_Notes',
      apiUrl: buildUrl('/notes'),
      callType: ApiCallType.POST,
      headers: {'Authorization': 'Bearer ${SharedPrefernce.getAccessToken()}'},
      params: {},
      bodyType: BodyType.JSON,
      body: jsonEncode(addnotes),
    );
    return CustomResponse.completed(
        await compute(addNoteResponseFromJson, jsonEncode(response.jsonBody)),
        response.statusCode);
  }
}

class ViewNoteApi {
  Future<CustomResponse<ViewCaseNoteResponse>> call() async {
    ApiCallResponse response = await ApiManager.instance.makeApiCall(
      callName: 'View_Note_Api',
      apiUrl: buildUrl(
          '/notes/${SharedPrefernce.getnotesId()}'),
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
            viewCaseNoteResponseFromJson, jsonEncode(response.jsonBody)),
        response.statusCode);
  }
}