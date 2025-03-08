import 'dart:convert';

SingleDoxResponse singleDoxResponseFromJson(String str) =>
    SingleDoxResponse.fromJson(json.decode(str));

String singleDoxResponseToJson(SingleDoxResponse data) =>
    json.encode(data.toJson());

class SingleDoxResponse {
  int? status;
  bool? success;
  String? message;
  SingleDox? data;

  SingleDoxResponse({
    this.status,
    this.success,
    this.message,
    this.data,
  });

  factory SingleDoxResponse.fromJson(Map<String, dynamic> json) =>
      SingleDoxResponse(
        status: json["status"],
        success: json["success"],
        message: json["message"],
        data: json["data"] == null ? null : SingleDox.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "success": success,
        "message": message,
        "data": data?.toJson(),
      };
}

class SingleDox {
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
  String?downloadurl;

  SingleDox({
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
    this.downloadurl
  });

  factory SingleDox.fromJson(Map<String, dynamic> json) => SingleDox(
        id: json["id"],
        caseId: json["case_id"],
        filename: json["filename"],
        key: json["key"],
        fileSize: json["file_size"],
        fileType: json["file_type"],
        createdBy: json["created_by"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"],
        deletedAt: json["deleted_at"],
        downloadurl: json["download_url"]
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
        "download_url":downloadurl
      };
}
