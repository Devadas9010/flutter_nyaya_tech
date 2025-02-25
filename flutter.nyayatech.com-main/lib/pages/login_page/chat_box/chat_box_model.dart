import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nyaya_tech/backend/api_manager.dart';
import 'package:nyaya_tech/backend/custom_response.dart';
import 'package:nyaya_tech/backend/services/comments_api.dart';
import 'package:nyaya_tech/backend/services/upload_presend_url.dart';
import 'package:nyaya_tech/dtos/comments_dto.dart';
import 'package:nyaya_tech/dtos/file_upload_dto.dart';
import 'package:nyaya_tech/dtos/task_dto.dart';
import 'package:nyaya_tech/flutter_flow/flutter_flow_util.dart';
import 'package:nyaya_tech/response/delete_response.dart';
import 'package:nyaya_tech/response/file_upload_response.dart';
import 'package:nyaya_tech/response/get_comments_response.dart';
import 'package:nyaya_tech/response/post_commonts_response.dart';
import 'package:http/http.dart' as http;

class ChatBoxModel extends FlutterFlowModel {
  @override
  void initState(BuildContext context) {}
  bool error = false;
  String message = '';
  List<Commentdata> commentData = [];
  num total_pages = 0;
  num per_page = 0;
  num current_page = 0;
  List<TaskModuleAttachmentsDto> fileAttachments = [];
  Attachement? imageData;
    late UploadAttachmentsApi modelUpload;


  @override
  void dispose() {}

  Future<void> fetchPostComments(
      {required int caseid,
      required String comments,
      required String type}) async {
    CommentsDto postCommetnsdto =
        CommentsDto(comments: comments, caseid: caseid, type: type);
    CustomResponse<PostCommentResponse> response =
        await PostCommentsApi().call(commentdto: postCommetnsdto);

    switch (response.statusCode) {
      case 200:
      case 201:
        error = false;
        message = response.data!.message.toString();
      case 422:
      default:
        error = true;
        message = response.data!.message!;
    }
  }

  Future<List<Commentdata>> fetchcomments({int? page, int? limit}) async {
    CustomResponse<AllcommentsResponse> response =
        await GetCommentsProcurementAPI().call(page: page, limit: limit);
    if (response.statusCode == 200) {
      if (page == 1) {
        commentData = response.data!.data!.records!;
      } else {
        commentData.addAll(response.data!.data!.records!);
      }
      per_page = response.data!.data!.paginationInfo!.pageSize!.toInt();
      current_page = response.data!.data!.paginationInfo!.currentPage!.toInt();
      total_pages = response.data!.data!.paginationInfo!.totalPages!.toInt();
      return commentData;
    } else {
      return [];
    }
  }

  Future<void> fetectDeleteComment() async {
    CustomResponse<NotesDeleteResponse> response =
        await DeleteSingleChatAPI().call();
    if (response.statusCode == 200) {
      message = response.data!.message.toString();
    } else {
      message = response.data!.message.toString();
    }
  }

  // Future<void> uploadFile({XFile? file}) async {
  //   String mime = ApiManager.getMimeType(file!.name)!;

  //   TaskModuleAttachmentsDto payload = TaskModuleAttachmentsDto(
  //     originalName: file.name,
  //     type: mime,
  //     size: await file.length(),
  //   );
  //   fileAttachments.add(payload);

  //   CustomResponse<DocumentsUploadResponse> response =
  //       await FilesUploadCommentApi().call(fileDto: payload);
  //   if (response.statusCode == 200) {
  //     imageData = response.data!.data;

  //     String preSignedUrl = imageData!.key!;
  //     http.Response fileResponse =
  //         await modelUpload.call(file: file, url: preSignedUrl);
  //     if (fileResponse.statusCode == 200) {}
  //   }
  // }
    Future<void> fetchattachmentsUpload() async {
    TaskModuleAttachmentsDto payload = TaskModuleAttachmentsDto(
      originalName: imageData!.filename!,
      type: imageData!.fileType!,
      size: imageData!.fileSize!,
    );

    CustomResponse<DocumentsUploadResponse> response =
        await FilesKeyCommentApi()
            .call(keydto: payload, key: imageData!.key!);
    switch (response.statusCode) {
      case 200:
      case 201:
        error = false;
        message = response.data!.message.toString();

        break;
      case 422:
        error = true;
        message = response.data!.message.toString();

        break;
      default:
        error = true;
        message = response.data!.message.toString();
    }
  }
}
