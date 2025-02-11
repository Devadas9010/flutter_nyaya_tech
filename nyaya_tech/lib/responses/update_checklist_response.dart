// To parse this JSON data, do
//
//     final updateChecklistResponse = updateChecklistResponseFromJson(jsonString);

import 'dart:convert';

UpdateChecklistResponse updateChecklistResponseFromJson(String str) => UpdateChecklistResponse.fromJson(json.decode(str));

String updateChecklistResponseToJson(UpdateChecklistResponse data) => json.encode(data.toJson());

class UpdateChecklistResponse {
    int? status;
    bool? success;
    String? message;
    UpdateChecklistResponseData? data;

    UpdateChecklistResponse({
        this.status,
        this.success,
        this.message,
        this.data,
    });

    factory UpdateChecklistResponse.fromJson(Map<String, dynamic> json) => UpdateChecklistResponse(
        status: json["status"],
        success: json["success"],
        message: json["message"],
        data: json["data"] == null ? null : UpdateChecklistResponseData.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "success": success,
        "message": message,
        "data": data?.toJson(),
    };
}

class UpdateChecklistResponseData {
    int? id;
    int? checklistId;
    String? response;
    String? status;
    int? respondedBy;
    dynamic approvedBy;
    DateTime? createdAt;
    DateTime? updatedAt;
    int? updatedBy;

    UpdateChecklistResponseData({
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

    factory UpdateChecklistResponseData.fromJson(Map<String, dynamic> json) => UpdateChecklistResponseData(
        id: json["id"],
        checklistId: json["checklist_id"],
        response: json["response"],
        status: json["status"],
        respondedBy: json["responded_by"],
        approvedBy: json["approved_by"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
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
        "updated_at": updatedAt?.toIso8601String(),
        "updated_by": updatedBy,
    };
}
