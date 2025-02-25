import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nyaya_tech/backend/api_manager.dart';
import 'package:nyaya_tech/backend/app_response.dart';
import 'package:nyaya_tech/backend/custom_response.dart';
import 'package:nyaya_tech/backend/services/case_dox_api.dart';
import 'package:nyaya_tech/backend/services/files_upload_api.dart';
import 'package:nyaya_tech/backend/services/upload_presend_url.dart';
import 'package:nyaya_tech/data_components/shared_prefernce.dart';
import 'package:nyaya_tech/dtos/file_upload_dto.dart';
import 'package:nyaya_tech/dtos/key_file_dto.dart';
import 'package:nyaya_tech/flutter_flow/flutter_flow_util.dart';
import 'package:nyaya_tech/response/caes_dox_response.dart';
import 'package:nyaya_tech/response/delete_dox_response.dart';
import 'package:http/http.dart' as http;
import 'package:nyaya_tech/response/file_upload_response.dart';
import 'package:nyaya_tech/response/s3_upload_respons.dart';
import 'package:nyaya_tech/response/single_dox_response.dart';

class FilesModel extends FlutterFlowModel {
  dynamic errorInstance;
  bool error = false;
  String message = '';
  AppResponse? appResponse;
  bool isValidation = false;
  List<Documents> documents = [];
  bool isUploading = false;
  String uploadMessage = "";
  late UploadAttachmentsApi modelUpload;
  SingleDox? singleDox;
  num total_pages = 0;
  num per_page = 0;
  num current_page = 0;
  late S3Upload s3response;
  bool fileUploadProgress = false;
  bool fileUploadCameraProgress = false;

  @override
  void initState(BuildContext context) {
    modelUpload = UploadAttachmentsApi();
  }

  @override
  void dispose() {}

  Future<void> fetchUploadKey(
      {required String fileType,
      required String fileName,
      required num fileSize,
      required String key}) async {
    KeyFileDto keyFileDto = KeyFileDto(
        caseId: SharedPrefernce.getcaseId(),
        fileType: fileType,
        fileName: fileName,
        fileSize: fileSize,
        key: key);
    CustomResponse<DocumentsUploadResponse> response =
        await FilesKeyApi().call(keydto: keyFileDto);
    switch (response.statusCode) {
      case 200:
      case 201:
        message = response.data!.message.toString();
        break;
      case 422:
        message = response.data!.message.toString();
        isValidation = true;
        error = true;
      case 401:
        message = response.data!.message.toString();
        isValidation = false;
        error = true;
        break;
      default:
        message = response.data!.message.toString();
        error = true;
    }
  }

  Future<void> fetchDocx({int? page, int? limit}) async {
    CustomResponse<ListCaseDox> response =
        await CaseDoxApi().call(page: page, limit: limit);
    switch (response.statusCode) {
      case 200:
      case 201:
        if (page == 1) {
          documents = response.data!.data!.records!;
        } else {
          documents.addAll(response.data!.data!.records!);
        }
        per_page = response.data!.data!.paginationInfo!.pageSize!.toInt();
        current_page =
            response.data!.data!.paginationInfo!.currentPage!.toInt();
        total_pages = response.data!.data!.paginationInfo!.totalPages!.toInt();
      case 422:
        error = true;
        message = response.message.toString();
        break;
      default:
        error = true;
        message = response.message.toString();
        print(response.message);
        throw Exception("Failed to fetch data: ${response.message}");
    }
  }

  Future<void> fetchSingle() async {
    CustomResponse<SingleDoxResponse> response = await ViewSingleDox().call();
    if (response.statusCode == 200) {
      singleDox = response.data!.data;
    } else {
      message = response.data!.message.toString();
    }
  }

  Future<void> fetchDeleatdox() async {
    CustomResponse<DeleteDoxResponse> response = await DeleteDoxApi().call();

    if (response.statusCode == 200) {
      message = response.data!.message.toString();
    } else {
      message = response.data!.message.toString();
    }
  }

  Future<void> uploadFile({XFile? file}) async {
    fileUploadCameraProgress = true;

    String mime = ApiManager.getMimeType(file!.name)!;

    FileUploadDto payload = FileUploadDto(
      fileType: mime,
      fileName: file.name,
      fileSize: await file.length(),
    );
    CustomResponse<S3UploadResponse> response =
        await FilesUploadApi().call(fileDto: payload);
    if (response.statusCode == 200) {
      S3Upload s3url = response.data!.data!;
      s3response = s3url;
      String presendurl = s3url.targetUrl.toString();
      http.Response fileResponse =
          await modelUpload.call(file: file, url: presendurl);

      if (fileResponse.statusCode == 200) {
        await fetchUploadKey(
            fileType: mime,
            fileName: file.name,
            fileSize: await file.length(),
            key: s3response.fileKey.toString());
      }
    } else {
      fileUploadProgress = false;
      fileUploadCameraProgress = false;
    }
  }
}
