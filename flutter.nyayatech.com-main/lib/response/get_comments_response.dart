// To parse this JSON data, do
//
//     final allcommentsResponse = allcommentsResponseFromJson(jsonString);

import 'dart:convert';

AllcommentsResponse allcommentsResponseFromJson(String str) =>
    AllcommentsResponse.fromJson(json.decode(str));

String allcommentsResponseToJson(AllcommentsResponse data) =>
    json.encode(data.toJson());

class AllcommentsResponse {
  int? status;
  bool? success;
  String? message;
  Data? data;

  AllcommentsResponse({
    this.status,
    this.success,
    this.message,
    this.data,
  });

  factory AllcommentsResponse.fromJson(Map<String, dynamic> json) =>
      AllcommentsResponse(
        status: json["status"],
        success: json["success"],
        message: json["message"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "success": success,
        "message": message,
        "data": data?.toJson(),
      };
}

class Data {
  PaginationInfo? paginationInfo;
  List<Commentdata>? records;

  Data({
    this.paginationInfo,
    this.records,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        paginationInfo: json["pagination_info"] == null
            ? null
            : PaginationInfo.fromJson(json["pagination_info"]),
        records: json["records"] == null
            ? []
            : List<Commentdata>.from(
                json["records"]!.map((x) => Commentdata.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "pagination_info": paginationInfo?.toJson(),
        "records": records == null
            ? []
            : List<dynamic>.from(records!.map((x) => x.toJson())),
      };
}

class PaginationInfo {
  int? totalCommentdatas;
  int? totalPages;
  int? pageSize;
  int? currentPage;
  dynamic nextPage;
  dynamic prevPage;

  PaginationInfo({
    this.totalCommentdatas,
    this.totalPages,
    this.pageSize,
    this.currentPage,
    this.nextPage,
    this.prevPage,
  });

  factory PaginationInfo.fromJson(Map<String, dynamic> json) => PaginationInfo(
        totalCommentdatas: json["total_records"],
        totalPages: json["total_pages"],
        pageSize: json["page_size"],
        currentPage: json["current_page"],
        nextPage: json["next_page"],
        prevPage: json["prev_page"],
      );

  Map<String, dynamic> toJson() => {
        "total_records": totalCommentdatas,
        "total_pages": totalPages,
        "page_size": pageSize,
        "current_page": currentPage,
        "next_page": nextPage,
        "prev_page": prevPage,
      };
}

class Commentdata {
  int? id;
  int? caseId;
  String? message;
  dynamic attachmentKey;
  String? type;
  dynamic replyTo;
  int? userId;
  DateTime? createdAt;
  User? user;
  dynamic replyToChat;

  Commentdata({
    this.id,
    this.caseId,
    this.message,
    this.attachmentKey,
    this.type,
    this.replyTo,
    this.userId,
    this.createdAt,
    this.user,
    this.replyToChat,
  });

  factory Commentdata.fromJson(Map<String, dynamic> json) => Commentdata(
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
        user: json["user"] == null ? null : User.fromJson(json["user"]),
        replyToChat: json["reply_to_chat"],
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
        "user": user?.toJson(),
        "reply_to_chat": replyToChat,
      };
}

class User {
  int? id;
  String? firstName;
  String? lastName;
  String? profilePic;

  User({
    this.id,
    this.firstName,
    this.lastName,
    this.profilePic,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        profilePic: json["profile_pic"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "first_name": firstName,
        "last_name": lastName,
        "profile_pic": profilePic,
      };
}
