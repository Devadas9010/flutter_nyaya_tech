// To parse this JSON data, do
//
//     final viewSummaryResponse = viewSummaryResponseFromJson(jsonString);

import 'dart:convert';

ViewSummaryResponse viewSummaryResponseFromJson(String str) => ViewSummaryResponse.fromJson(json.decode(str));

String viewSummaryResponseToJson(ViewSummaryResponse data) => json.encode(data.toJson());

class ViewSummaryResponse {
    int? status;
    bool? success;
    String? message;
    ViewSummary? data;

    ViewSummaryResponse({
        this.status,
        this.success,
        this.message,
        this.data,
    });

    factory ViewSummaryResponse.fromJson(Map<String, dynamic> json) => ViewSummaryResponse(
        status: json["status"],
        success: json["success"],
        message: json["message"],
        data: json["data"] == null ? null : ViewSummary.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "success": success,
        "message": message,
        "data": data?.toJson(),
    };
}

class ViewSummary {
    int? id;
    int? caseId;
    DateTime? date;
    String? note;
    int? createdBy;
    int? updatedBy;
    DateTime? createdAt;
    DateTime? updatedAt;
    dynamic deletedAt;

    ViewSummary({
        this.id,
        this.caseId,
        this.date,
        this.note,
        this.createdBy,
        this.updatedBy,
        this.createdAt,
        this.updatedAt,
        this.deletedAt,
    });

    factory ViewSummary.fromJson(Map<String, dynamic> json) => ViewSummary(
        id: json["id"],
        caseId: json["case_id"],
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        note: json["note"],
        createdBy: json["created_by"],
        updatedBy: json["updated_by"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "case_id": caseId,
        "date": date?.toIso8601String(),
        "note": note,
        "created_by": createdBy,
        "updated_by": updatedBy,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "deleted_at": deletedAt,
    };
}
