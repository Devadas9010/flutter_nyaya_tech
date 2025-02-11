// To parse this JSON data, do
//
//     final createChecklistResponse = createChecklistResponseFromJson(jsonString);

import 'dart:convert';

CreateChecklistResponse createChecklistResponseFromJson(String str) => CreateChecklistResponse.fromJson(json.decode(str));

String createChecklistResponseToJson(CreateChecklistResponse data) => json.encode(data.toJson());

class CreateChecklistResponse {
    int? status;
    bool? success;
    String? message;
    CreateChecklistResponseData? data;
    ErrData? errData;

    CreateChecklistResponse({
        this.status,
        this.success,
        this.message,
        this.data,
        this.errData,
    });

    factory CreateChecklistResponse.fromJson(Map<String, dynamic> json) => CreateChecklistResponse(
        status: json["status"],
        success: json["success"],
        message: json["message"],
        data: json["data"] == null ? null : CreateChecklistResponseData.fromJson(json["data"]),
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

class CreateChecklistResponseData {
    int? id;
    int? checklistId;
    String? response;
    String? status;
    List<dynamic>? docs;
    int? respondedBy;
    dynamic approvedBy;
    DateTime? createdAt;
    dynamic updatedAt;
    dynamic updatedBy;

    CreateChecklistResponseData({
        this.id,
        this.checklistId,
        this.response,
        this.status,
        this.docs,
        this.respondedBy,
        this.approvedBy,
        this.createdAt,
        this.updatedAt,
        this.updatedBy,
    });

    factory CreateChecklistResponseData.fromJson(Map<String, dynamic> json) => CreateChecklistResponseData(
        id: json["id"],
        checklistId: json["checklist_id"],
        response: json["response"],
        status: json["status"],
        docs: json["docs"] == null ? [] : List<dynamic>.from(json["docs"]!.map((x) => x)),
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
        "docs": docs == null ? [] : List<dynamic>.from(docs!.map((x) => x)),
        "responded_by": respondedBy,
        "approved_by": approvedBy,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt,
        "updated_by": updatedBy,
    };
}

class ErrData {
    List<String>? response;

    ErrData({
        this.response,
    });

    factory ErrData.fromJson(Map<String, dynamic> json) => ErrData(
        response: json["response"] == null ? [] : List<String>.from(json["response"]!.map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "response": response == null ? [] : List<dynamic>.from(response!.map((x) => x)),
    };
}
