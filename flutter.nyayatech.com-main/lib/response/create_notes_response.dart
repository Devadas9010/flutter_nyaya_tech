// To parse this JSON data, do
//
//     final createCasesNotesResponse = createCasesNotesResponseFromJson(jsonString);

import 'dart:convert';

CreateCasesNotesResponse createCasesNotesResponseFromJson(String str) =>
    CreateCasesNotesResponse.fromJson(json.decode(str));

String createCasesNotesResponseToJson(CreateCasesNotesResponse data) =>
    json.encode(data.toJson());

class CreateCasesNotesResponse {
  int? status;
  bool? success;
  String? message;
  AddNotes? data;
  ErrData? errData;

  CreateCasesNotesResponse({
    this.status,
    this.success,
    this.message,
    this.data,
    this.errData,
  });

  factory CreateCasesNotesResponse.fromJson(Map<String, dynamic> json) =>
      CreateCasesNotesResponse(
        status: json["status"],
        success: json["success"],
        message: json["message"],
        data: json["data"] == null ? null : AddNotes.fromJson(json["data"]),
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

class AddNotes {
  int? id;
  int? caseId;
  String? title;
  String? note;
  int? createdBy;
  dynamic updatedBy;
  DateTime? createdAt;
  dynamic updatedAt;
  dynamic deletedAt;

  AddNotes({
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

  factory AddNotes.fromJson(Map<String, dynamic> json) => AddNotes(
        id: json["id"],
        caseId: json["case_id"],
        title: json["title"],
        note: json["note"],
        createdBy: json["created_by"],
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
        "created_by": createdBy,
        "updated_by": updatedBy,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt,
        "deleted_at": deletedAt,
      };
}

class ErrData {
  List<String>? caseId;
  List<String>? title;
  List<String>? note;

  ErrData({
    this.caseId,
    this.title,
    this.note,
  });

  factory ErrData.fromJson(Map<String, dynamic> json) => ErrData(
        caseId: json["case_id"] == null
            ? []
            : List<String>.from(json["case_id"]!.map((x) => x)),
        title: json["title"] == null
            ? []
            : List<String>.from(json["title"]!.map((x) => x)),
        note: json["note"] == null
            ? []
            : List<String>.from(json["note"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "case_id":
            caseId == null ? [] : List<dynamic>.from(caseId!.map((x) => x)),
        "title": title == null ? [] : List<dynamic>.from(title!.map((x) => x)),
        "note": note == null ? [] : List<dynamic>.from(note!.map((x) => x)),
      };
}
