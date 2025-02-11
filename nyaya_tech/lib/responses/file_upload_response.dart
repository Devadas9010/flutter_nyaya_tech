import 'dart:convert';

FilesUploadResponse filesUploadResponseFromJson(String str) => FilesUploadResponse.fromJson(json.decode(str));

String filesUploadResponseToJson(FilesUploadResponse data) => json.encode(data.toJson());

class FilesUploadResponse {
    int? status;
    bool? success;
    String? message;
    Data? data;
    ErrData? errData;

    FilesUploadResponse({
        this.status,
        this.success,
        this.message,
        this.data,
        this.errData,
    });

    factory FilesUploadResponse.fromJson(Map<String, dynamic> json) => FilesUploadResponse(
        status: json["status"],
        success: json["success"],
        message: json["message"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
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

class Data {
    String? targetUrl;
    String? fileKey;

    Data({
        this.targetUrl,
        this.fileKey,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        targetUrl: json["target_url"],
        fileKey: json["file_key"],
    );

    Map<String, dynamic> toJson() => {
        "target_url": targetUrl,
        "file_key": fileKey,
    };
}

class ErrData {
    List<String>? fileType;
    List<String>? fileName;
    List<String>? fileSize;

    ErrData({
        this.fileType,
        this.fileName,
        this.fileSize,
    });

    factory ErrData.fromJson(Map<String, dynamic> json) => ErrData(
        fileType: json["file_type"] == null ? [] : List<String>.from(json["file_type"]!.map((x) => x)),
        fileName: json["file_name"] == null ? [] : List<String>.from(json["file_name"]!.map((x) => x)),
        fileSize: json["file_size"] == null ? [] : List<String>.from(json["file_size"]!.map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "file_type": fileType == null ? [] : List<dynamic>.from(fileType!.map((x) => x)),
        "file_name": fileName == null ? [] : List<dynamic>.from(fileName!.map((x) => x)),
        "file_size": fileSize == null ? [] : List<dynamic>.from(fileSize!.map((x) => x)),
    };
}
