import 'dart:convert';

OtpResponse otpResponseFromJson(String str) => OtpResponse.fromJson(json.decode(str));

String otpResponseToJson(OtpResponse data) => json.encode(data.toJson());

class OtpResponse {
    int? status;
    bool? success;
    String? message;
    Data? data;
    ErrData? errData;

    OtpResponse({
        this.status,
        this.success,
        this.message,
        this.data,
        this.errData,
    });

    factory OtpResponse.fromJson(Map<String, dynamic> json) => OtpResponse(
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
    String? accessToken;
    String? refreshToken;
    int? refreshTokenExpiresAt;
    UserDetails? userDetails;

    Data({
        this.accessToken,
        this.refreshToken,
        this.refreshTokenExpiresAt,
        this.userDetails,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        accessToken: json["access_token"],
        refreshToken: json["refresh_token"],
        refreshTokenExpiresAt: json["refresh_token_expires_at"],
        userDetails: json["user_details"] == null ? null : UserDetails.fromJson(json["user_details"]),
    );

    Map<String, dynamic> toJson() => {
        "access_token": accessToken,
        "refresh_token": refreshToken,
        "refresh_token_expires_at": refreshTokenExpiresAt,
        "user_details": userDetails?.toJson(),
    };
}

class UserDetails {
    int? id;
    String? email;
    String? firstName;
    String? lastName;
    dynamic phone;
    dynamic designation;
    String? userType;
    bool? active;
    dynamic profilePic;
    DateTime? createdAt;
    dynamic updatedAt;
    dynamic deletedAt;

    UserDetails({
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
    });

    factory UserDetails.fromJson(Map<String, dynamic> json) => UserDetails(
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
    };
}

class ErrData {
    List<String>? phone;
    List<String>? otp;

    ErrData({
        this.phone,
        this.otp,
    });

    factory ErrData.fromJson(Map<String, dynamic> json) => ErrData(
        phone: json["phone"] == null ? [] : List<String>.from(json["phone"]!.map((x) => x)),
        otp: json["otp"] == null ? [] : List<String>.from(json["otp"]!.map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "phone": phone == null ? [] : List<dynamic>.from(phone!.map((x) => x)),
        "otp": otp == null ? [] : List<dynamic>.from(otp!.map((x) => x)),
    };
}
