import 'dart:convert';

DeleteFileRespose deleteFileResposeFromJson(String str) => DeleteFileRespose.fromJson(json.decode(str));

String deleteFileResposeToJson(DeleteFileRespose data) => json.encode(data.toJson());

class DeleteFileRespose {
    int? status;
    bool? success;
    String? message;

    DeleteFileRespose({
        this.status,
        this.success,
        this.message,
    });

    factory DeleteFileRespose.fromJson(Map<String, dynamic> json) => DeleteFileRespose(
        status: json["status"],
        success: json["success"],
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "success": success,
        "message": message,
    };
}