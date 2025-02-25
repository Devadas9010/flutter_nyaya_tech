import 'dart:convert';

AssigneResponse assigneResponseFromJson(String str) => AssigneResponse.fromJson(json.decode(str));

String assigneResponseToJson(AssigneResponse data) => json.encode(data.toJson());

class AssigneResponse {
    int? status;
    bool? success;
    String? message;
    userdata? data;

    AssigneResponse({
        this.status,
        this.success,
        this.message,
        this.data,
    });

    factory AssigneResponse.fromJson(Map<String, dynamic> json) => AssigneResponse(
        status: json["status"],
        success: json["success"],
        message: json["message"],
        data: json["data"] == null ? null : userdata.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "success": success,
        "message": message,
        "data": data?.toJson(),
    };
}

class userdata {
    int? id;
    String? customerId;
    dynamic email;
    String? firstName;
    String? lastName;
    String? phone;
    dynamic designation;
    String? userType;
    bool? active;
    dynamic profilePic;
    DateTime? createdAt;
    DateTime? updatedAt;
    dynamic deletedAt;
    bool? isNewUser;
    bool? isVerified;
    dynamic dateOfBirth;
    String? gender;
    dynamic address;
    dynamic bio;
    dynamic experience;
    dynamic qualification;
    dynamic degreeCertificate;
    dynamic aadhaar;
    dynamic advocateCode;
    dynamic barCouncilEnrollmentId;
    dynamic barAffiliations;
    dynamic areaOfInterest;
    dynamic achievements;
    String? state;
    dynamic occupation;
    bool? isPhoneVerified;
    bool? isEmailVerified;
    bool? isAadhaarVerified;

    userdata({
        this.id,
        this.customerId,
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
        this.isVerified,
        this.dateOfBirth,
        this.gender,
        this.address,
        this.bio,
        this.experience,
        this.qualification,
        this.degreeCertificate,
        this.aadhaar,
        this.advocateCode,
        this.barCouncilEnrollmentId,
        this.barAffiliations,
        this.areaOfInterest,
        this.achievements,
        this.state,
        this.occupation,
        this.isPhoneVerified,
        this.isEmailVerified,
        this.isAadhaarVerified,
    });

    factory userdata.fromJson(Map<String, dynamic> json) => userdata(
        id: json["id"],
        customerId: json["customer_id"],
        email: json["email"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        phone: json["phone"],
        designation: json["designation"],
        userType: json["user_type"],
        active: json["active"],
        profilePic: json["profile_pic"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
        isNewUser: json["is_new_user"],
        isVerified: json["is_verified"],
        dateOfBirth: json["date_of_birth"],
        gender: json["gender"],
        address: json["address"],
        bio: json["bio"],
        experience: json["experience"],
        qualification: json["qualification"],
        degreeCertificate: json["degree_certificate"],
        aadhaar: json["aadhaar"],
        advocateCode: json["advocate_code"],
        barCouncilEnrollmentId: json["bar_council_enrollment_id"],
        barAffiliations: json["bar_affiliations"],
        areaOfInterest: json["area_of_interest"],
        achievements: json["achievements"],
        state: json["state"],
        occupation: json["occupation"],
        isPhoneVerified: json["is_phone_verified"],
        isEmailVerified: json["is_email_verified"],
        isAadhaarVerified: json["is_aadhaar_verified"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "customer_id": customerId,
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
        "is_new_user": isNewUser,
        "is_verified": isVerified,
        "date_of_birth": dateOfBirth,
        "gender": gender,
        "address": address,
        "bio": bio,
        "experience": experience,
        "qualification": qualification,
        "degree_certificate": degreeCertificate,
        "aadhaar": aadhaar,
        "advocate_code": advocateCode,
        "bar_council_enrollment_id": barCouncilEnrollmentId,
        "bar_affiliations": barAffiliations,
        "area_of_interest": areaOfInterest,
        "achievements": achievements,
        "state": state,
        "occupation": occupation,
        "is_phone_verified": isPhoneVerified,
        "is_email_verified": isEmailVerified,
        "is_aadhaar_verified": isAadhaarVerified,
    };
}
