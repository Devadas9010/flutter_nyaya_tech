import 'dart:convert';

DownloadFileResponse downloadFileResponseFromJson(String str) => DownloadFileResponse.fromJson(json.decode(str));

String downloadFileResponseToJson(DownloadFileResponse data) => json.encode(data.toJson());

class DownloadFileResponse {
    int? status;
    bool? success;
    String? message;
    Data? data;

    DownloadFileResponse({
        this.status,
        this.success,
        this.message,
        this.data,
    });

    factory DownloadFileResponse.fromJson(Map<String, dynamic> json) => DownloadFileResponse(
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
    String? downloadUrl;

    Data({
        this.downloadUrl,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        downloadUrl: json["download_url"],
    );

    Map<String, dynamic> toJson() => {
        "download_url": downloadUrl,
    };
}
