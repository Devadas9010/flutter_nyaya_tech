
import 'dart:convert';

UploadMultipleDocumentsResponse uploadMultipleDocumentsResponseFromJson(String str) => UploadMultipleDocumentsResponse.fromJson(json.decode(str));

String uploadMultipleDocumentsResponseToJson(UploadMultipleDocumentsResponse data) => json.encode(data.toJson());

class UploadMultipleDocumentsResponse {
    int? status;
    bool? success;
    String? message;
    List<MultifilesData>? data;

    UploadMultipleDocumentsResponse({
        this.status,
        this.success,
        this.message,
        this.data,
    });

    factory UploadMultipleDocumentsResponse.fromJson(Map<String, dynamic> json) => UploadMultipleDocumentsResponse(
        status: json["status"],
        success: json["success"],
        message: json["message"],
        data: json["data"] == null ? [] : List<MultifilesData>.from(json["data"]!.map((x) => MultifilesData.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "success": success,
        "message": message,
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class MultifilesData {
    int? id;
    int? caseId;
    String? filename;
    String? key;
    int? fileSize;
    String? fileType;
    dynamic createdBy;
    DateTime? createdAt;
    dynamic updatedAt;
    dynamic deletedAt;

    MultifilesData({
        this.id,
        this.caseId,
        this.filename,
        this.key,
        this.fileSize,
        this.fileType,
        this.createdBy,
        this.createdAt,
        this.updatedAt,
        this.deletedAt,
    });

    factory MultifilesData.fromJson(Map<String, dynamic> json) => MultifilesData(
        id: json["id"],
        caseId: json["case_id"],
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
