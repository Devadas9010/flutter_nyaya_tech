// To parse this JSON data, do
//
//     final casesNotesResponse = casesNotesResponseFromJson(jsonString);

import 'dart:convert';

CasesNotesResponse casesNotesResponseFromJson(String str) =>
    CasesNotesResponse.fromJson(json.decode(str));

String casesNotesResponseToJson(CasesNotesResponse data) =>
    json.encode(data.toJson());

class CasesNotesResponse {
  int? status;
  bool? success;
  String? message;
  Data? data;

  CasesNotesResponse({
    this.status,
    this.success,
    this.message,
    this.data,
  });

  factory CasesNotesResponse.fromJson(Map<String, dynamic> json) =>
      CasesNotesResponse(
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
  List<NotesData>? records;

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
            : List<NotesData>.from(
                json["records"]!.map((x) => NotesData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "pagination_info": paginationInfo?.toJson(),
        "records": records == null
            ? []
            : List<dynamic>.from(records!.map((x) => x.toJson())),
      };
}

class PaginationInfo {
  int? totalNotesDatas;
  int? totalPages;
  int? pageSize;
  int? currentPage;
  dynamic nextPage;
  dynamic prevPage;

  PaginationInfo({
    this.totalNotesDatas,
    this.totalPages,
    this.pageSize,
    this.currentPage,
    this.nextPage,
    this.prevPage,
  });

  factory PaginationInfo.fromJson(Map<String, dynamic> json) => PaginationInfo(
        totalNotesDatas: json["total_records"],
        totalPages: json["total_pages"],
        pageSize: json["page_size"],
        currentPage: json["current_page"],
        nextPage: json["next_page"],
        prevPage: json["prev_page"],
      );

  Map<String, dynamic> toJson() => {
        "total_records": totalNotesDatas,
        "total_pages": totalPages,
        "page_size": pageSize,
        "current_page": currentPage,
        "next_page": nextPage,
        "prev_page": prevPage,
      };
}

class NotesData {
  int? id;
  int? caseId;
  String? title;
  String? note;
  CreatedBy? createdBy;
  dynamic updatedBy;
  DateTime? createdAt;
  dynamic updatedAt;
  dynamic deletedAt;

  NotesData({
    this.id,
    this.caseId,
    this.title,
    this.note,
    this.createdBy,
    this.updatedBy,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  factory NotesData.fromJson(Map<String, dynamic> json) => NotesData(
        id: json["id"],
        caseId: json["case_id"],
        title: json["title"],
        note: json["note"],
        createdBy: json["created_by"] == null
            ? null
            : CreatedBy.fromJson(json["created_by"]),
        updatedBy: json["updated_by"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"],
        deletedAt: json["deleted_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "case_id": caseId,
        "title": title,
        "note": note,
        "created_by": createdBy?.toJson(),
        "updated_by": updatedBy,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt,
        "deleted_at": deletedAt,
      };
}

class CreatedBy {
  int? id;
  String? firstName;
  String? lastName;
  String? profilePic;
  String? email;
  dynamic designation;
  String? userType;

  CreatedBy({
    this.id,
    this.firstName,
    this.lastName,
    this.profilePic,
    this.email,
    this.designation,
    this.userType,
  });

  factory CreatedBy.fromJson(Map<String, dynamic> json) => CreatedBy(
        id: json["id"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        profilePic: json["profile_pic"],
        email: json["email"],
        designation: json["designation"],
        userType: json["user_type"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "first_name": firstName,
        "last_name": lastName,
        "profile_pic": profilePic,
        "email": email,
        "designation": designation,
        "user_type": userType,
      };
}
