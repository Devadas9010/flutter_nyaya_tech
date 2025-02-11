// To parse this JSON data, do
//
//     final getSingleDocumentResponse = getSingleDocumentResponseFromJson(jsonString);

import 'dart:convert';

GetSingleDocumentResponse getSingleDocumentResponseFromJson(String str) => GetSingleDocumentResponse.fromJson(json.decode(str));

String getSingleDocumentResponseToJson(GetSingleDocumentResponse data) => json.encode(data.toJson());

class GetSingleDocumentResponse {
    int? status;
    bool? success;
    String? message;
    SingleDocumentData? data;

    GetSingleDocumentResponse({
        this.status,
        this.success,
        this.message,
        this.data,
    });

    factory GetSingleDocumentResponse.fromJson(Map<String, dynamic> json) => GetSingleDocumentResponse(
        status: json["status"],
        success: json["success"],
        message: json["message"],
        data: json["data"] == null ? null : SingleDocumentData.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "success": success,
        "message": message,
        "data": data?.toJson(),
    };
}

class SingleDocumentData {
    int? id;
    int? caseId;
    dynamic checklistId;
    dynamic status;
    String? filename;
    String? key;
    int? fileSize;
    String? fileType;
    int? createdBy;
    DateTime? createdAt;
    dynamic updatedAt;
    dynamic deletedAt;

    SingleDocumentData({
        this.id,
        this.caseId,
        this.checklistId,
        this.status,
        this.filename,
        this.key,
        this.fileSize,
        this.fileType,
        this.createdBy,
        this.createdAt,
        this.updatedAt,
        this.deletedAt,
    });

    factory SingleDocumentData.fromJson(Map<String, dynamic> json) => SingleDocumentData(
        id: json["id"],
        caseId: json["case_id"],
        checklistId: json["checklist_id"],
        status: json["status"],
        filename: json["filename"],
        key: json["key"],
        fileSize: json["file_size"],
        fileType: json["file_type"],
        createdBy: json["created_by"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"],
        deletedAt: json["deleted_at"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "case_id": caseId,
        "checklist_id": checklistId,
        "status": status,
        "filename": filename,
        "key": key,
        "file_size": fileSize,
        "file_type": fileType,
        "created_by": createdBy,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt,
        "deleted_at": deletedAt,
    };
}
