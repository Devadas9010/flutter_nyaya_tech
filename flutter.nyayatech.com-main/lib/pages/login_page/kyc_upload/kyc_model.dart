import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nyaya_tech/backend/api_manager.dart';
import 'package:nyaya_tech/backend/custom_response.dart';
import 'package:nyaya_tech/backend/services/create_user_api.dart';
import 'package:nyaya_tech/backend/services/files_upload_api.dart';
import 'package:nyaya_tech/backend/services/upload_presend_url.dart';
import 'package:nyaya_tech/data_components/shared_prefernce.dart';
import 'package:nyaya_tech/dtos/file_upload_dto.dart';
import 'package:nyaya_tech/dtos/key_file_dto.dart';
import 'package:nyaya_tech/flutter_flow/flutter_flow_model.dart';
import 'package:nyaya_tech/response/download_response.dart';
import 'package:nyaya_tech/response/file_upload_response.dart';
import 'package:nyaya_tech/response/s3_upload_respons.dart';
import 'package:http/http.dart' as http;

class AadharModel extends FlutterFlowModel {
  @override
  void initState(BuildContext context) {
    modelUpload = UploadAttachmentsApi();
    modelUpload1 = UploadAttachmentsApi();
  }

  dynamic errorInstance;
  bool error = false;
  String message = '';
  bool isValidation = false;
  DownloadUrl? data;
  late S3Upload s3response;
  late S3Upload s3response1;
  bool fileUploadProgress = false;
  bool fileUploadCameraProgress = false;
  late UploadAttachmentsApi modelUpload;
  late UploadAttachmentsApi modelUpload1;

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
        await fetchDownloadUrl(file: SharedPrefernce.getfileKeycam());
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

  Future<void> fetchDownloadUrl({required String file}) async {
    CustomResponse<DownloadResponse> response =
        await ImageDownloadApi().call(file: file);
    if (response.statusCode == 200) {
      data = response.data!.data;
      SharedPrefernce.sets3Urlcam(response.data!.data!.downloadUrl.toString());
    } else {
      print('error');
    }
  }

  Future<void> fetchDownloadUrl1({required String file1}) async {
    CustomResponse<DownloadResponse> response =
        await ImageDownloadApi().call(file: file1);
    if (response.statusCode == 200) {
      data = response.data!.data;
      SharedPrefernce.sets3Urlfiles(
          response.data!.data!.downloadUrl.toString());
    } else {
      print('error');
    }
  }

  Future<void> uploadFile({XFile? file}) async {
    fileUploadCameraProgress = true;

    String mime = ApiManager.getMimeType(file!.name)!;

    FileUploadDto payload = FileUploadDto(
        fileType: mime, fileName: file.name, fileSize: await file.length());
    CustomResponse<S3UploadResponse> response =
        await FilesUploadApi().call(fileDto: payload);
    if (response.statusCode == 200) {
      S3Upload s3url = response.data!.data!;
      s3response = s3url;
      String presendurl = s3url.targetUrl.toString();
      SharedPrefernce.setfileKeycam(s3response.fileKey.toString());
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




  Future<void> uploadFile1({XFile? file}) async {
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
      S3Upload s3url1 = response.data!.data!;
      s3response1 = s3url1;
      String presendurl1 = s3url1.targetUrl.toString();
      SharedPrefernce.setfileKeyfiles(s3response1.fileKey.toString());
      http.Response fileResponse =
          await modelUpload1.call(file: file, url: presendurl1);

      if (fileResponse.statusCode == 200) {
        await fetchUploadKey1(
            fileType: mime,
            fileName: file.name,
            fileSize: await file.length(),
            key: s3response1.fileKey.toString());
      }
    } else {
      fileUploadProgress = false;
      fileUploadCameraProgress = false;
    }
  }

  Future<void> fetchUploadKey1(
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
    await fetchDownloadUrl1(file1: SharedPrefernce.getfileKeyfiles());
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
}
