import 'dart:convert';

DownloadResponse downloadResponseFromJson(String str) =>
    DownloadResponse.fromJson(json.decode(str));

String downloadResponseToJson(DownloadResponse data) =>
    json.encode(data.toJson());

class DownloadResponse {
  int? status;
  bool? success;
  String? message;
  DownloadUrl? data;

  DownloadResponse({
    this.status,
    this.success,
    this.message,
    this.data,
  });

  factory DownloadResponse.fromJson(Map<String, dynamic> json) =>
      DownloadResponse(
        status: json["status"],
        success: json["success"],
        message: json["message"],
        data: json["data"] == null ? null : DownloadUrl.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "success": success,
        "message": message,
        "data": data?.toJson(),
      };
}

class DownloadUrl {
  String? downloadUrl;

  DownloadUrl({
    this.downloadUrl,
  });

  factory DownloadUrl.fromJson(Map<String, dynamic> json) => DownloadUrl(
        downloadUrl: json["download_url"],
      );

  Map<String, dynamic> toJson() => {
        "download_url": downloadUrl,
      };
}
