import 'dart:convert';

CreateuserResponse createuserResponseFromJson(String str) =>
    CreateuserResponse.fromJson(json.decode(str));

String createuserResponseToJson(CreateuserResponse data) =>
    json.encode(data.toJson());

class CreateuserResponse {
  int? status;
  bool? success;
  String? message;
  UpdateUser? data;
  ErrData? errData;

  CreateuserResponse(
      {this.status, this.success, this.message, this.data, this.errData});

  factory CreateuserResponse.fromJson(Map<String, dynamic> json) =>
      CreateuserResponse(
        status: json["status"],
        success: json["success"],
        message: json["message"],
        data: json["data"] == null ? null : UpdateUser.fromJson(json["data"]),
        errData:
            json["errData"] == null ? null : ErrData.fromJson(json["errData"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "success": success,
        "message": message,
        "data": data?.toJson(),
        "errData": errData?.toJson(),
      };
}

class UpdateUser {
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
  DateTime? updatedAt;
  dynamic deletedAt;

  UpdateUser({
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

  factory UpdateUser.fromJson(Map<String, dynamic> json) => UpdateUser(
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
      };
}

class ErrData {
  List<String>? firstName;
  List<String>? phone;
  List<String>? id;
  List<String>? gender;
  List<String>? dateOfBirth;
  List<String>? lastName;
  List<String>? email;
  List<String>? address;
  List<String>? state;
  List<String>? bio;
  List<String>? qualification;
  List<String>? aadhaar;
  List<String>? occupation;

  ErrData({
    this.firstName,
    this.phone,
    this.id,
    this.gender,
    this.dateOfBirth,
    this.lastName,
    this.email,
    this.address,
    this.state,
    this.bio,
    this.qualification,
    this.aadhaar,
    this.occupation,
  });

  factory ErrData.fromJson(Map<String, dynamic> json) => ErrData(
        firstName: json["first_name"] == null
            ? []
            : List<String>.from(json["first_name"]!.map((x) => x)),
        phone: json["phone"] == null
            ? []
            : List<String>.from(json["phone"]!.map((x) => x)),
        id: json["id"] == null
            ? []
            : List<String>.from(json["id"]!.map((x) => x)),
        gender: json["gender"] == null
            ? []
            : List<String>.from(json["gender"]!.map((x) => x)),
        dateOfBirth: json["date_of_birth"] == null
            ? []
            : List<String>.from(json["date_of_birth"]!.map((x) => x)),
        lastName: json["last_name"] == null
            ? []
            : List<String>.from(json["last_name"]!.map((x) => x)),
        email: json["email"] == null
            ? []
            : List<String>.from(json["email"]!.map((x) => x)),
        address: json["address"] == null
            ? []
            : List<String>.from(json["address"]!.map((x) => x)),
        state: json["state"] == null
            ? []
            : List<String>.from(json["state"]!.map((x) => x)),
        bio: json["bio"] == null
            ? []
            : List<String>.from(json["bio"]!.map((x) => x)),
        qualification: json["qualification"] == null
            ? []
            : List<String>.from(json["qualification"]!.map((x) => x)),
        aadhaar: json["aadhaar"] == null
            ? []
            : List<String>.from(json["aadhaar"]!.map((x) => x)),
        occupation: json["occupation"] == null
            ? []
            : List<String>.from(json["occupation"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "first_name": firstName == null
            ? []
            : List<dynamic>.from(firstName!.map((x) => x)),
        "phone": phone == null ? [] : List<dynamic>.from(phone!.map((x) => x)),
        "id": id == null ? [] : List<dynamic>.from(id!.map((x) => x)),
        "gender":
            gender == null ? [] : List<dynamic>.from(gender!.map((x) => x)),
        "date_of_birth": dateOfBirth == null
            ? []
            : List<dynamic>.from(dateOfBirth!.map((x) => x)),
        "last_name":
            lastName == null ? [] : List<dynamic>.from(lastName!.map((x) => x)),
        "email": email == null ? [] : List<dynamic>.from(email!.map((x) => x)),
        "address":
            address == null ? [] : List<dynamic>.from(address!.map((x) => x)),
        "bio": bio == null ? [] : List<dynamic>.from(bio!.map((x) => x)),
        "qualification": qualification == null
            ? []
            : List<dynamic>.from(qualification!.map((x) => x)),
        "aadhaar":
            aadhaar == null ? [] : List<dynamic>.from(aadhaar!.map((x) => x)),
        "occupation": occupation == null
            ? []
            : List<dynamic>.from(occupation!.map((x) => x)),
      };
}
