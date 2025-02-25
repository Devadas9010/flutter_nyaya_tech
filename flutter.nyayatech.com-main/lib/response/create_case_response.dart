// To parse this JSON data, do
//
//     final createCaseResponse = createCaseResponseFromJson(jsonString);

import 'dart:convert';

CreateCaseResponse createCaseResponseFromJson(String str) => CreateCaseResponse.fromJson(json.decode(str));

String createCaseResponseToJson(CreateCaseResponse data) => json.encode(data.toJson());

class CreateCaseResponse {
    int? status;
    bool? success;
    String? message;
    CreateCase? data;
    ErrData? errData;

    CreateCaseResponse({
        this.status,
        this.success,
        this.message,
        this.data,
        this.errData,
    });

    factory CreateCaseResponse.fromJson(Map<String, dynamic> json) => CreateCaseResponse(
        status: json["status"],
        success: json["success"],
        message: json["message"],
        data: json["data"] == null ? null : CreateCase.fromJson(json["data"]),
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

class CreateCase {
    int? id;
    int? issueId;
    int? userId;
    int? associateId;
    int? lawyerId;
    dynamic description;
    String? status;
    String? priority;
    dynamic nextHearingDate;
    DateTime? createdAt;
    dynamic updatedAt;
    dynamic deletedAt;

    CreateCase({
        this.id,
        this.issueId,
        this.userId,
        this.associateId,
        this.lawyerId,
        this.description,
        this.status,
        this.priority,
        this.nextHearingDate,
        this.createdAt,
        this.updatedAt,
        this.deletedAt,
    });

    factory CreateCase.fromJson(Map<String, dynamic> json) => CreateCase(
        id: json["id"],
        issueId: json["issue_id"],
        userId: json["user_id"],
        associateId: json["associate_id"],
        lawyerId: json["lawyer_id"],
        description: json["description"],
        status: json["status"],
        priority: json["priority"],
        nextHearingDate: json["next_hearing_date"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"],
        deletedAt: json["deleted_at"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "issue_id": issueId,
        "user_id": userId,
        "associate_id": associateId,
        "lawyer_id": lawyerId,
        "description": description,
        "status": status,
        "priority": priority,
        "next_hearing_date": nextHearingDate,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt,
        "deleted_at": deletedAt,
    };
}

class ErrData {
    List<String>? description;

    ErrData({
        this.description,
    });

    factory ErrData.fromJson(Map<String, dynamic> json) => ErrData(
        description: json["description"] == null ? [] : List<String>.from(json["description"]!.map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "description": description == null ? [] : List<dynamic>.from(description!.map((x) => x)),
    };
}
