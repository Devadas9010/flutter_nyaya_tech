// To parse this JSON data, do
//
//     final vIewCheckListResponse = vIewCheckListResponseFromJson(jsonString);

import 'dart:convert';

VIewCheckListResponse vIewCheckListResponseFromJson(String str) => VIewCheckListResponse.fromJson(json.decode(str));

String vIewCheckListResponseToJson(VIewCheckListResponse data) => json.encode(data.toJson());

class VIewCheckListResponse {
    int? status;
    bool? success;
    String? message;
    ViewCheckList? data;

    VIewCheckListResponse({
        this.status,
        this.success,
        this.message,
        this.data,
    });

    factory VIewCheckListResponse.fromJson(Map<String, dynamic> json) => VIewCheckListResponse(
        status: json["status"],
        success: json["success"],
        message: json["message"],
        data: json["data"] == null ? null : ViewCheckList.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "success": success,
        "message": message,
        "data": data?.toJson(),
    };
}

class ViewCheckList {
    int? id;
    String? desc;
    String? status;
    int? createdBy;
    int? caseId;
    DateTime? createdAt;
    String? type;
    dynamic updatedAt;
    dynamic deletedAt;

    ViewCheckList({
        this.id,
        this.desc,
        this.status,
        this.createdBy,
        this.caseId,
        this.createdAt,
        this.type,
        this.updatedAt,
        this.deletedAt,
    });

    factory ViewCheckList.fromJson(Map<String, dynamic> json) => ViewCheckList(
        id: json["id"],
        desc: json["desc"],
        status: json["status"],
        createdBy: json["created_by"],
        caseId: json["case_id"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        type: json["type"],
        updatedAt: json["updated_at"],
        deletedAt: json["deleted_at"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "desc": desc,
        "status": status,
        "created_by": createdBy,
        "case_id": caseId,
        "created_at": createdAt?.toIso8601String(),
        "type": type,
        "updated_at": updatedAt,
        "deleted_at": deletedAt,
    };
}
