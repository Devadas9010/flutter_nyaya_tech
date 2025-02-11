import 'dart:convert';

CreateChatResponse createChatResponseFromJson(String str) => CreateChatResponse.fromJson(json.decode(str));

String createChatResponseToJson(CreateChatResponse data) => json.encode(data.toJson());

class CreateChatResponse {
    int? status;
    bool? success;
    String? message;
    Data? data;

    CreateChatResponse({
        this.status,
        this.success,
        this.message,
        this.data,
    });

    factory CreateChatResponse.fromJson(Map<String, dynamic> json) => CreateChatResponse(
        status: json["status"],
        success: json["success"],
        message: json["message"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "success": success,
        "message": message,
        "data": data?.toJson(),
    };
}

class Data {
    int? id;
    int? caseId;
    String? message;
    dynamic attachmentKey;
    String? type;
    dynamic replyTo;
    int? userId;
    DateTime? createdAt;

    Data({
        this.id,
        this.caseId,
        this.message,
        this.attachmentKey,
        this.type,
        this.replyTo,
        this.userId,
        this.createdAt,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        caseId: json["case_id"],
        message: json["message"],
        attachmentKey: json["attachment_key"],
        type: json["type"],
        replyTo: json["reply_to"],
        userId: json["user_id"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "case_id": caseId,
        "message": message,
        "attachment_key": attachmentKey,
        "type": type,
        "reply_to": replyTo,
        "user_id": userId,
        "created_at": createdAt?.toIso8601String(),
    };
}
