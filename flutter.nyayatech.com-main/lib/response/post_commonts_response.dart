import 'dart:convert';

PostCommentResponse postCommentResponseFromJson(String str) =>
    PostCommentResponse.fromJson(json.decode(str));

String postCommentResponseToJson(PostCommentResponse data) =>
    json.encode(data.toJson());

class PostCommentResponse {
  int? status;
  bool? success;
  String? message;
  Data? data;
  ErrData? errData;

  PostCommentResponse(
      {this.status, this.success, this.message, this.data, this.errData});

  factory PostCommentResponse.fromJson(Map<String, dynamic> json) =>
      PostCommentResponse(
        status: json["status"],
        success: json["success"],
        message: json["message"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
        errData:
            json["errData"] == null ? null : ErrData.fromJson(json["errData"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "success": success,
        "message": message,
        "data": data?.toJson(),
        "errData": errData?.toJson(),
      };
}

class Data {
  int? id;
  int? caseId;
  String? message;
  dynamic attachmentKey;
  String? type;
  dynamic replyTo;
  int? userId;
  DateTime? createdAt;

  Data({
    this.id,
    this.caseId,
    this.message,
    this.attachmentKey,
    this.type,
    this.replyTo,
    this.userId,
    this.createdAt,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        caseId: json["case_id"],
        message: json["message"],
        attachmentKey: json["attachment_key"],
        type: json["type"],
        replyTo: json["reply_to"],
        userId: json["user_id"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "case_id": caseId,
        "message": message,
        "attachment_key": attachmentKey,
        "type": type,
        "reply_to": replyTo,
        "user_id": userId,
        "created_at": createdAt?.toIso8601String(),
      };
}

class ErrData {
  List<String>? caseId;
  List<String>? message;
  List<String>? type;

  ErrData({
    this.caseId,
    this.message,
    this.type,
  });

  factory ErrData.fromJson(Map<String, dynamic> json) => ErrData(
        caseId: json["case_id"] == null
            ? []
            : List<String>.from(json["case_id"]!.map((x) => x)),
        message: json["message"] == null
            ? []
            : List<String>.from(json["message"]!.map((x) => x)),
        type: json["type"] == null
            ? []
            : List<String>.from(json["type"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "case_id":
            caseId == null ? [] : List<dynamic>.from(caseId!.map((x) => x)),
        "message":
            message == null ? [] : List<dynamic>.from(message!.map((x) => x)),
        "type": type == null ? [] : List<dynamic>.from(type!.map((x) => x)),
      };
}
