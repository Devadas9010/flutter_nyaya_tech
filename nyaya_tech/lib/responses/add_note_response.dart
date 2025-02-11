import 'dart:convert';

AddNoteResponse addNoteResponseFromJson(String str) => AddNoteResponse.fromJson(json.decode(str));

String addNoteResponseToJson(AddNoteResponse data) => json.encode(data.toJson());

class AddNoteResponse {
    int? status;
    bool? success;
    String? message;
    Data? data;
    ErrData? errData;

    AddNoteResponse({
        this.status,
        this.success,
        this.message,
        this.data,
        this.errData,
    });

    factory AddNoteResponse.fromJson(Map<String, dynamic> json) => AddNoteResponse(
        status: json["status"],
        success: json["success"],
        message: json["message"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
        errData: json["errData"] == null ? null : ErrData.fromJson(json["errData"]),
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
    String? title;
    String? note;
    int? createdBy;
    dynamic updatedBy;
    DateTime? createdAt;
    dynamic updatedAt;
    dynamic deletedAt;

    Data({
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

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        caseId: json["case_id"],
        title: json["title"],
        note: json["note"],
        createdBy: json["created_by"],
        updatedBy: json["updated_by"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
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
        caseId: json["case_id"] == null ? [] : List<String>.from(json["case_id"]!.map((x) => x)),
        title: json["title"] == null ? [] : List<String>.from(json["title"]!.map((x) => x)),
        note: json["note"] == null ? [] : List<String>.from(json["note"]!.map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "case_id": caseId == null ? [] : List<dynamic>.from(caseId!.map((x) => x)),
        "title": title == null ? [] : List<dynamic>.from(title!.map((x) => x)),
        "note": note == null ? [] : List<dynamic>.from(note!.map((x) => x)),
    };
}
