import 'dart:convert';

NotesDeleteResponse notesDeleteResponseFromJson(String str) =>
    NotesDeleteResponse.fromJson(json.decode(str));

String notesDeleteResponseToJson(NotesDeleteResponse data) =>
    json.encode(data.toJson());

class NotesDeleteResponse {
  int? status;
  bool? success;
  String? message;

  NotesDeleteResponse({
    this.status,
    this.success,
    this.message,
  });

  factory NotesDeleteResponse.fromJson(Map<String, dynamic> json) =>
      NotesDeleteResponse(
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
