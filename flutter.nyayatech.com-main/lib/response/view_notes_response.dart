import 'dart:convert';

ViewCasesNotesResponse viewCasesNotesResponseFromJson(String str) =>
    ViewCasesNotesResponse.fromJson(json.decode(str));

String viewCasesNotesResponseToJson(ViewCasesNotesResponse data) =>
    json.encode(data.toJson());

class ViewCasesNotesResponse {
  int? status;
  bool? success;
  String? message;
  ViewNotes? data;

  ViewCasesNotesResponse({
    this.status,
    this.success,
    this.message,
    this.data,
  });

  factory ViewCasesNotesResponse.fromJson(Map<String, dynamic> json) =>
      ViewCasesNotesResponse(
        status: json["status"],
        success: json["success"],
        message: json["message"],
        data: json["data"] == null ? null : ViewNotes.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "success": success,
        "message": message,
        "data": data?.toJson(),
      };
}

class ViewNotes {
  int? id;
  String? title;
  String? note;
  CreatedBy? createdBy;
  dynamic updatedBy;
  DateTime? createdAt;
  dynamic updatedAt;
  int? caseId;

  ViewNotes({
    this.id,
    this.title,
    this.note,
    this.createdBy,
    this.updatedBy,
    this.createdAt,
    this.updatedAt,
    this.caseId,
  });

  factory ViewNotes.fromJson(Map<String, dynamic> json) => ViewNotes(
        id: json["id"],
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
        caseId: json["case_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "note": note,
        "created_by": createdBy?.toJson(),
        "updated_by": updatedBy,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt,
        "case_id": caseId,
      };
}

class CreatedBy {
  String? firstName;
  String? lastName;
  String? profilePic;

  CreatedBy({
    this.firstName,
    this.lastName,
    this.profilePic,
  });

  factory CreatedBy.fromJson(Map<String, dynamic> json) => CreatedBy(
        firstName: json["first_name"],
        lastName: json["last_name"],
        profilePic: json["profile_pic"],
      );

  Map<String, dynamic> toJson() => {
        "first_name": firstName,
        "last_name": lastName,
        "profile_pic": profilePic,
      };
}
