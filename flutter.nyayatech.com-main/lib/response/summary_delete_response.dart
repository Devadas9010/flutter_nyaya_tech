import 'dart:convert';

SummaryDeleteResponse summaryDeleteResponseFromJson(String str) =>
    SummaryDeleteResponse.fromJson(json.decode(str));

String summaryDeleteResponseToJson(SummaryDeleteResponse data) =>
    json.encode(data.toJson());

class SummaryDeleteResponse {
  int? status;
  bool? success;
  String? message;

  SummaryDeleteResponse({
    this.status,
    this.success,
    this.message,
  });

  factory SummaryDeleteResponse.fromJson(Map<String, dynamic> json) =>
      SummaryDeleteResponse(
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
