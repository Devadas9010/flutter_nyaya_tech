import 'dart:convert';

ViewUserProfileResponse viewUserProfileResponseFromJson(String str) => ViewUserProfileResponse.fromJson(json.decode(str));

String viewUserProfileResponseToJson(ViewUserProfileResponse data) => json.encode(data.toJson());

class ViewUserProfileResponse {
    int? status;
    bool? success;
    String? message;
    ViewProfileData? data;

    ViewUserProfileResponse({
        this.status,
        this.success,
        this.message,
        this.data,
    });

    factory ViewUserProfileResponse.fromJson(Map<String, dynamic> json) => ViewUserProfileResponse(
        status: json["status"],
        success: json["success"],
        message: json["message"],
        data: json["data"] == null ? null : ViewProfileData.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "success": success,
        "message": message,
        "data": data?.toJson(),
    };
}

class ViewProfileData {
    int? id;
    String? email;
    String? firstName;
    String? lastName;
    String? phone;
    String? designation;
    String? userType;
    bool? active;
    String? profilePic;
    DateTime? createdAt;
    dynamic updatedAt;
    dynamic deletedAt;
    dynamic isNewUser;
    dynamic dateOfBirth;
    dynamic gender;
    dynamic address;
    String? profilePicDownloadUrl;

    ViewProfileData({
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
        this.isNewUser,
        this.dateOfBirth,
        this.gender,
        this.address,
        this.profilePicDownloadUrl,
    });

    factory ViewProfileData.fromJson(Map<String, dynamic> json) => ViewProfileData(
        id: json["id"],
        email: json["email"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        phone: json["phone"],
        designation: json["designation"],
        userType: json["user_type"],
        active: json["active"],
        profilePic: json["profile_pic"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"],
        deletedAt: json["deleted_at"],
        isNewUser: json["is_new_user"],
        dateOfBirth: json["date_of_birth"],
        gender: json["gender"],
        address: json["address"],
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
        "updated_at": updatedAt,
        "deleted_at": deletedAt,
        "is_new_user": isNewUser,
        "date_of_birth": dateOfBirth,
        "gender": gender,
        "address": address,
        "profile_pic_download_url": profilePicDownloadUrl,
    };
}
