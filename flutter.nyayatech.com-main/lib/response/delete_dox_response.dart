import 'dart:convert';

DeleteDoxResponse deleteDoxResponseFromJson(String str) =>
    DeleteDoxResponse.fromJson(json.decode(str));

String deleteDoxResponseToJson(DeleteDoxResponse data) =>
    json.encode(data.toJson());

class DeleteDoxResponse {
  int? status;
  bool? success;
  String? message;

  DeleteDoxResponse({
    this.status,
    this.success,
    this.message,
  });

  factory DeleteDoxResponse.fromJson(Map<String, dynamic> json) =>
      DeleteDoxResponse(
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
