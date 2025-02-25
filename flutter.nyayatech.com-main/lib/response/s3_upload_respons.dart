import 'dart:convert';

S3UploadResponse s3UploadResponseFromJson(String str) =>
    S3UploadResponse.fromJson(json.decode(str));

String s3UploadResponseToJson(S3UploadResponse data) =>
    json.encode(data.toJson());

class S3UploadResponse {
  int? status;
  bool? success;
  String? message;
  S3Upload? data;

  S3UploadResponse({
    this.status,
    this.success,
    this.message,
    this.data,
  });

  factory S3UploadResponse.fromJson(Map<String, dynamic> json) =>
      S3UploadResponse(
        status: json["status"],
        success: json["success"],
        message: json["message"],
        data: json["data"] == null ? null : S3Upload.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "success": success,
        "message": message,
        "data": data?.toJson(),
      };
}

class S3Upload {
  String? targetUrl;
  String? fileKey;

  S3Upload({
    this.targetUrl,
    this.fileKey,
  });

  factory S3Upload.fromJson(Map<String, dynamic> json) => S3Upload(
        targetUrl: json["target_url"],
        fileKey: json["file_key"],
      );

  Map<String, dynamic> toJson() => {
        "target_url": targetUrl,
        "file_key": fileKey,
      };
}
