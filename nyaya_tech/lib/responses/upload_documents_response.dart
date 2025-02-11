
import 'dart:convert';
UploadDocumentsResponse uploadDocumentsResponseFromJson(String str) => UploadDocumentsResponse.fromJson(json.decode(str));

String uploadDocumentsResponseToJson(UploadDocumentsResponse data) => json.encode(data.toJson());

class UploadDocumentsResponse {
    int? status;
    bool? success;
    String? message;
    Data? data;

    UploadDocumentsResponse({
        this.status,
        this.success,
        this.message,
        this.data,
    });

    factory UploadDocumentsResponse.fromJson(Map<String, dynamic> json) => UploadDocumentsResponse(
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
    String? filename;
    String? key;
    int? fileSize;
    String? fileType;
    dynamic createdBy;
    DateTime? createdAt;
    dynamic updatedAt;
    dynamic deletedAt;

    Data({
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

    factory Data.fromJson(Map<String, dynamic> json) => Data(
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
