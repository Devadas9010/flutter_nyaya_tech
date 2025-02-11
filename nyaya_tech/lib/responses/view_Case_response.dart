import 'dart:convert';

ViewCaseResponse viewCaseResponseFromJson(String str) => ViewCaseResponse.fromJson(json.decode(str));

String viewCaseResponseToJson(ViewCaseResponse data) => json.encode(data.toJson());

class ViewCaseResponse {
    int? status;
    bool? success;
    String? message;
    ViewCase? data;

    ViewCaseResponse({
        this.status,
        this.success,
        this.message,
        this.data,
    });

    factory ViewCaseResponse.fromJson(Map<String, dynamic> json) => ViewCaseResponse(
        status: json["status"],
        success: json["success"],
        message: json["message"],
        data: json["data"] == null ? null : ViewCase.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "success": success,
        "message": message,
        "data": data?.toJson(),
    };
}

class ViewCase {
    int? id;
    dynamic description;
    String? status;
    String? priority;
    dynamic nextHearingDate;
    DateTime? createdAt;
    dynamic updatedAt;
    dynamic deletedAt;
    int? issueId;
    int? userId;
    int? associateId;
    int? lawyerId;
    Issue? issue;
    Associate? user;
    Associate? associate;
    Associate? lawyer;

    ViewCase({
        this.id,
        this.description,
        this.status,
        this.priority,
        this.nextHearingDate,
        this.createdAt,
        this.updatedAt,
        this.deletedAt,
        this.issueId,
        this.userId,
        this.associateId,
        this.lawyerId,
        this.issue,
        this.user,
        this.associate,
        this.lawyer,
    });

    factory ViewCase.fromJson(Map<String, dynamic> json) => ViewCase(
        id: json["id"],
        description: json["description"],
        status: json["status"],
        priority: json["priority"],
        nextHearingDate: json["next_hearing_date"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"],
        deletedAt: json["deleted_at"],
        issueId: json["issue_id"],
        userId: json["user_id"],
        associateId: json["associate_id"],
        lawyerId: json["lawyer_id"],
        issue: json["issue"] == null ? null : Issue.fromJson(json["issue"]),
        user: json["user"] == null ? null : Associate.fromJson(json["user"]),
        associate: json["associate"] == null ? null : Associate.fromJson(json["associate"]),
        lawyer: json["lawyer"] == null ? null : Associate.fromJson(json["lawyer"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "description": description,
        "status": status,
        "priority": priority,
        "next_hearing_date": nextHearingDate,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt,
        "deleted_at": deletedAt,
        "issue_id": issueId,
        "user_id": userId,
        "associate_id": associateId,
        "lawyer_id": lawyerId,
        "issue": issue?.toJson(),
        "user": user?.toJson(),
        "associate": associate?.toJson(),
        "lawyer": lawyer?.toJson(),
    };
}

class Associate {
    String? firstName;
    String? lastName;
    String? email;
    String? designation;
    String? phone;
    String? profilePic;

    Associate({
        this.firstName,
        this.lastName,
        this.email,
        this.designation,
        this.phone,
        this.profilePic,
    });

    factory Associate.fromJson(Map<String, dynamic> json) => Associate(
        firstName: json["first_name"],
        lastName: json["last_name"],
        email: json["email"],
        designation: json["designation"],
        phone: json["phone"],
        profilePic: json["profile_pic"],
    );

    Map<String, dynamic> toJson() => {
        "first_name": firstName,
        "last_name": lastName,
        "email": email,
        "designation": designation,
        "phone": phone,
        "profile_pic": profilePic,
    };
}

class Issue {
    String? serviceTitle;
    String? caseType;
    String? issueTitle;

    Issue({
        this.serviceTitle,
        this.caseType,
        this.issueTitle,
    });

    factory Issue.fromJson(Map<String, dynamic> json) => Issue(
        serviceTitle: json["service_title"],
        caseType: json["case_type"],
        issueTitle: json["issue_title"],
    );

    Map<String, dynamic> toJson() => {
        "service_title": serviceTitle,
        "case_type": caseType,
        "issue_title": issueTitle,
    };
}
