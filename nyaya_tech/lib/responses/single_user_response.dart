import 'dart:convert';

SingleUserResponse SingleUserResponseFromJson(String str) =>
    SingleUserResponse.fromJson(json.decode(str));

String SingleUserResponseToJson(SingleUserResponse data) =>
    json.encode(data.toJson());

class SingleUserResponse {
  int? status;
  bool? success;
  String? message;
  singleuserdata? data;

  SingleUserResponse({
    this.status,
    this.success,
    this.message,
    this.data,
  });

  factory SingleUserResponse.fromJson(Map<String, dynamic> json) =>
      SingleUserResponse(
        status: json["status"],
        success: json["success"],
        message: json["message"],
        data: json["data"] == null ? null : singleuserdata.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "success": success,
        "message": message,
        "data": data?.toJson(),
      };
}

class singleuserdata {
  int? id;
  String? email;
  String? firstName;
  String? lastName;
  dynamic phone;
  dynamic designation;
  String? userType;
  bool? active;
  String? profilePic;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic deletedAt;
  String? profilePicDownloadUrl;

  singleuserdata({
    this.id,
    this.email,
    this.firstName,
    this.lastName,
    this.phone,
    this.designation,
    this.userType,
    this.active,
    this.profilePic,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.profilePicDownloadUrl,
  });

  factory singleuserdata.fromJson(Map<String, dynamic> json) => singleuserdata(
        id: json["id"],
        email: json["email"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        phone: json["phone"],
        designation: json["designation"],
        userType: json["user_type"],
        active: json["active"],
        profilePic: json["profile_pic"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
        profilePicDownloadUrl: json["profile_pic_download_url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "first_name": firstName,
        "last_name": lastName,
        "phone": phone,
        "designation": designation,
        "user_type": userType,
        "active": active,
        "profile_pic": profilePic,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "deleted_at": deletedAt,
        "profile_pic_download_url": profilePicDownloadUrl,
      };
}
