// To parse this JSON data, do
//
//     final viewCheckListResponse = viewCheckListResponseFromJson(jsonString);

import 'dart:convert';

ViewCheckListResponse viewCheckListResponseFromJson(String str) => ViewCheckListResponse.fromJson(json.decode(str));

String viewCheckListResponseToJson(ViewCheckListResponse data) => json.encode(data.toJson());

class ViewCheckListResponse {
    int? status;
    bool? success;
    String? message;
    ViewCheckListData? data;

    ViewCheckListResponse({
        this.status,
        this.success,
        this.message,
        this.data,
    });

    factory ViewCheckListResponse.fromJson(Map<String, dynamic> json) => ViewCheckListResponse(
        status: json["status"],
        success: json["success"],
        message: json["message"],
        data: json["data"] == null ? null : ViewCheckListData.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "success": success,
        "message": message,
        "data": data?.toJson(),
    };
}


class ViewCheckListData {
    int? id;
    String? desc;
    String? status;
    int? createdBy;
    int? caseId;
    DateTime? createdAt;
    dynamic type;
    dynamic updatedAt;
    dynamic deletedAt;

    ViewCheckListData({
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

    factory ViewCheckListData.fromJson(Map<String, dynamic> json) => ViewCheckListData(
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
