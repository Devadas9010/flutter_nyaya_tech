import 'package:nyaya_tech/backend/custom_response.dart';
import 'package:nyaya_tech/backend/services/files_api.dart';
import 'package:nyaya_tech/classes/add_note.dart';
import 'package:nyaya_tech/classes/file_upload_class.dart';
import 'package:nyaya_tech/data_components/shared_preference.dart';
import 'package:nyaya_tech/responses/delete_file_response.dart';
import 'package:nyaya_tech/responses/download_file_response.dart';
import 'package:nyaya_tech/responses/file_upload_response.dart';
import 'package:nyaya_tech/responses/get_list_documents_response.dart';
import 'package:nyaya_tech/responses/get_single_document_response.dart';
import 'package:nyaya_tech/responses/upload_documents_response.dart';
import 'package:nyaya_tech/responses/upload_multiple_documents_response.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'files_widget.dart' show FilesWidget;
import 'package:flutter/material.dart';

class FilesModel extends FlutterFlowModel<FilesWidget> {
  List<ListDocumentData> listDocumentData = [];
  SingleDocumentData? singleDocumentData;
  String message = '';
  bool error = false;
  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}

  Future<void> fetchFileUploadData({
    required FileUploadClass fileClass,
  }) async {
    CustomResponse<FilesUploadResponse> response =
        await FilesUploadApi().call(fileClass:fileClass);
    if (response.statusCode == 200 || response.statusCode == 201) {
      message = response.data!.message.toString();

      SharedPrefernce.setfileKey(response.data!.data!.fileKey.toString());
      print('file key -- ${SharedPrefernce.getfileKey()}');

      SharedPrefernce.sets3Url(response.data!.data!.targetUrl.toString());
      print('s3 url -- ${SharedPrefernce.gets3Url()}');
      print('file Name -- ${SharedPrefernce.getfileName()}');
    } else {
      message = response.data!.message.toString();
    }
  }

  Future<void> fetchUploadDocumentsData({
    required int case_id,
    required String file_type,
    required String file_name,
    required int file_size,
    required String key,
  }) async {
    CustomResponse<UploadDocumentsResponse> response =
        await UploadDocumentsApi().call(
      case_id: case_id,
      file_type: file_type,
      file_name: file_name,
      file_size: file_size,
      key: key,
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      message = response.data!.message.toString();
      //SharedPrefernce.setfileName(response.data!.data!.filename.toString());
      print('file Name -- ${SharedPrefernce.getfileName()}');
    } else {
      message = response.data!.message.toString();
    }
  }

  Future<void> fetchDownloadFileData({
    required String key,
  }) async {
    CustomResponse<DownloadFileResponse> response =
        await DownloadFileApi().call(
      key: key,
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      message = response.data!.message.toString();
    } else {
      message = response.data!.message.toString();
    }
  }

  Future<List<MultifilesData>?> fetchUploadMultipleDocumentsData({
    required List<Map<String, dynamic>> docs,
  }) async {
    CustomResponse<UploadMultipleDocumentsResponse> response =
        await UploadMultipleDocumentsApi().call(docs: docs);

    if (response.statusCode == 200 || response.statusCode == 201) {
      message = response.data!.data!.first.filename.toString();
      SharedPrefernce.setfileName(
          response.data!.data!.first.filename.toString());
    } else {
      message = response.data!.message.toString();
    }
  }

  Future<void> fetchSingleDocumentData() async {
    CustomResponse<GetSingleDocumentResponse> response =
        await GetSingleDocumentApi().call();
    if (response.statusCode == 200) {
      singleDocumentData = response.data!.data;
    } else {
      throw Exception('error');
    }
  }

  Future<void> fetchListDocumentData() async {
    CustomResponse<GetListDocumentResponse> response =
        await GetListDocumentApi().call();
    if (response.statusCode == 200) {
      listDocumentData = response.data!.data!.records!;
    } else {
      throw Exception('error');
    }
  }

  Future<void> fetchDeleteFileData() async {
    CustomResponse<DeleteFileRespose> response = await DeleteFileApi().call();

    if (response.statusCode == 200) {
      message = response.data!.message.toString();
    } else {
      message = response.data!.message.toString();
    }
  }
}
