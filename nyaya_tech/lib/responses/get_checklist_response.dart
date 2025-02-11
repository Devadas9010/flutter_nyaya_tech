// To parse this JSON data, do
//
//     final getChecklistResponse = getChecklistResponseFromJson(jsonString);

import 'dart:convert';

GetChecklistResponse getChecklistResponseFromJson(String str) => GetChecklistResponse.fromJson(json.decode(str));

String getChecklistResponseToJson(GetChecklistResponse data) => json.encode(data.toJson());

class GetChecklistResponse {
    int? status;
    bool? success;
    String? message;
    GetChecklistData? data;

    GetChecklistResponse({
        this.status,
        this.success,
        this.message,
        this.data,
    });

    factory GetChecklistResponse.fromJson(Map<String, dynamic> json) => GetChecklistResponse(
        status: json["status"],
        success: json["success"],
        message: json["message"],
        data: json["data"] == null ? null : GetChecklistData.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "success": success,
        "message": message,
        "data": data?.toJson(),
    };
}

class GetChecklistData {
    int? id;
    int? checklistId;
    String? response;
    String? status;
    int? respondedBy;
    dynamic approvedBy;
    DateTime? createdAt;
    dynamic updatedAt;
    dynamic updatedBy;

    GetChecklistData({
        this.id,
        this.checklistId,
        this.response,
        this.status,
        this.respondedBy,
        this.approvedBy,
        this.createdAt,
        this.updatedAt,
        this.updatedBy,
    });

    factory GetChecklistData.fromJson(Map<String, dynamic> json) => GetChecklistData(
        id: json["id"],
        checklistId: json["checklist_id"],
        response: json["response"],
        status: json["status"],
        respondedBy: json["responded_by"],
        approvedBy: json["approved_by"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"],
        updatedBy: json["updated_by"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "checklist_id": checklistId,
        "response": response,
        "status": status,
        "responded_by": respondedBy,
        "approved_by": approvedBy,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt,
        "updated_by": updatedBy,
    };
}
