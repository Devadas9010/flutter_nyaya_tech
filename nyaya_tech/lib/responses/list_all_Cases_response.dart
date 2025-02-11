// To parse this JSON data, do
//
//     final listAllCases = listAllCasesFromJson(jsonString);

import 'dart:convert';

ListAllCases listAllCasesFromJson(String str) =>
    ListAllCases.fromJson(json.decode(str));

String listAllCasesToJson(ListAllCases data) => json.encode(data.toJson());

class ListAllCases {
  int? status;
  bool? success;
  String? message;
  Data? data;

  ListAllCases({
    this.status,
    this.success,
    this.message,
    this.data,
  });

  factory ListAllCases.fromJson(Map<String, dynamic> json) => ListAllCases(
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
  List<CaseCardData>? records;

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
            : List<CaseCardData>.from(
                json["records"]!.map((x) => CaseCardData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "pagination_info": paginationInfo?.toJson(),
        "records": records == null
            ? []
            : List<dynamic>.from(records!.map((x) => x.toJson())),
      };
}

class PaginationInfo {
  int? totalRecords;
  int? totalPages;
  int? pageSize;
  int? currentPage;
  dynamic nextPage;
  dynamic prevPage;

  PaginationInfo({
    this.totalRecords,
    this.totalPages,
    this.pageSize,
    this.currentPage,
    this.nextPage,
    this.prevPage,
  });

  factory PaginationInfo.fromJson(Map<String, dynamic> json) => PaginationInfo(
        totalRecords: json["total_records"],
        totalPages: json["total_pages"],
        pageSize: json["page_size"],
        currentPage: json["current_page"],
        nextPage: json["next_page"],
        prevPage: json["prev_page"],
      );

  Map<String, dynamic> toJson() => {
        "total_records": totalRecords,
        "total_pages": totalPages,
        "page_size": pageSize,
        "current_page": currentPage,
        "next_page": nextPage,
        "prev_page": prevPage,
      };
}

class CaseCardData {
  int? id;
  String? description;
  String? status;
  String? priority;
  dynamic nextHearingDate;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic deletedAt;
  int? issueId;
  int? userId;
  int? associateId;
  int? lawyerId;
  Issue? issue;
  Associate? user;
  Associate? associate;
  Associate? lawyer;

  CaseCardData({
    this.id,
    this.description,
    this.status,
    this.priority,
    this.nextHearingDate,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.issueId,
    this.userId,
    this.associateId,
    this.lawyerId,
    this.issue,
    this.user,
    this.associate,
    this.lawyer,
  });

  factory CaseCardData.fromJson(Map<String, dynamic> json) => CaseCardData(
        id: json["id"],
        description: json["description"],
        status: json["status"],
        priority: json["priority"],
        nextHearingDate: json["next_hearing_date"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
        issueId: json["issue_id"],
        userId: json["user_id"],
        associateId: json["associate_id"],
        lawyerId: json["lawyer_id"],
        issue: json["issue"] == null ? null : Issue.fromJson(json["issue"]),
        user: json["user"] == null ? null : Associate.fromJson(json["user"]),
        associate: json["associate"] == null
            ? null
            : Associate.fromJson(json["associate"]),
        lawyer:
            json["lawyer"] == null ? null : Associate.fromJson(json["lawyer"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "description": description,
        "status": status,
        "priority": priority,
        "next_hearing_date": nextHearingDate,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "deleted_at": deletedAt,
        "issue_id": issueId,
        "user_id": userId,
        "associate_id": associateId,
        "lawyer_id": lawyerId,
        "issue": issue?.toJson(),
        "user": user?.toJson(),
        "associate": associate?.toJson(),
        "lawyer": lawyer?.toJson(),
      };
}

class Associate {
  int? id;
  String? firstName;
  String? lastName;
  String? profilePic;
  String? email;
  String? designation;
  String? userType;

  Associate({
    this.id,
    this.firstName,
    this.lastName,
    this.profilePic,
    this.email,
    this.designation,
    this.userType,
  });

  factory Associate.fromJson(Map<String, dynamic> json) => Associate(
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

class Issue {
  int? id;
  String? serviceTitle;
  String? caseType;
  String? issueTitle;

  Issue({
    this.id,
    this.serviceTitle,
    this.caseType,
    this.issueTitle,
  });

  factory Issue.fromJson(Map<String, dynamic> json) => Issue(
        id: json["id"],
        serviceTitle: json["service_title"],
        caseType: json["case_type"],
        issueTitle: json["issue_title"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "service_title": serviceTitle,
        "case_type": caseType,
        "issue_title": issueTitle,
      };
}
