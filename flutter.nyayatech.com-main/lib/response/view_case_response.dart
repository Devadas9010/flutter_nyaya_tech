// To parse this JSON data, do
//
//     final viewCasesResponse = viewCasesResponseFromJson(jsonString);

import 'dart:convert';

ViewCasesResponse viewCasesResponseFromJson(String str) => ViewCasesResponse.fromJson(json.decode(str));

String viewCasesResponseToJson(ViewCasesResponse data) => json.encode(data.toJson());

class ViewCasesResponse {
    int? status;
    bool? success;
    String? message;
    Data? data;

    ViewCasesResponse({
        this.status,
        this.success,
        this.message,
        this.data,
    });

    factory ViewCasesResponse.fromJson(Map<String, dynamic> json) => ViewCasesResponse(
        status: json["status"],
        success: json["success"],
        message: json["message"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "success": success,
        "message": message,
        "data": data?.toJson(),
    };
}

class Data {
    int? id;
    dynamic description;
    String? status;
    String? priority;
    dynamic nextHearingDate;
    DateTime? createdAt;
    DateTime? updatedAt;
    dynamic deletedAt;
    int? issueId;
    int? userId;
    int? legalAdvisorId;
    int? advocateId;
    DateTime? advisorAssignedAt;
    DateTime? advocateApprovedAt;
    DateTime? advocateAssignedAt;
    dynamic advocateRejectedAt;
    dynamic advocateRejectedNotes;
    dynamic cnrNumber;
    String? tempId;
    String? refId;
    String? price;
    DateTime? recentPaymentDate;
    String? paidAmount;
    int? advocateApprovedBy;
    dynamic advocateApprovedNotes;
    bool? isAdvocateApproved;
    bool? isLegalAdvisorAssigned;
    bool? isAdvocateAssigned;
    String? onboardingBrief;
    DateTime? caseApprovedAt;
    int? caseApprovedBy;
    dynamic caseRejectedAt;
    dynamic caseRejectedBy;
    dynamic caseRejectedNotes;
    bool? isKycCompleted;
    bool? isPaymentCompleted;
    CaseIssue? caseIssue;
    User? user;
    Advocate? legalAdvisor;
    Advocate? advocate;

    Data({
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
        this.legalAdvisorId,
        this.advocateId,
        this.advisorAssignedAt,
        this.advocateApprovedAt,
        this.advocateAssignedAt,
        this.advocateRejectedAt,
        this.advocateRejectedNotes,
        this.cnrNumber,
        this.tempId,
        this.refId,
        this.price,
        this.recentPaymentDate,
        this.paidAmount,
        this.advocateApprovedBy,
        this.advocateApprovedNotes,
        this.isAdvocateApproved,
        this.isLegalAdvisorAssigned,
        this.isAdvocateAssigned,
        this.onboardingBrief,
        this.caseApprovedAt,
        this.caseApprovedBy,
        this.caseRejectedAt,
        this.caseRejectedBy,
        this.caseRejectedNotes,
        this.isKycCompleted,
        this.isPaymentCompleted,
        this.caseIssue,
        this.user,
        this.legalAdvisor,
        this.advocate,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        description: json["description"],
        status: json["status"],
        priority: json["priority"],
        nextHearingDate: json["next_hearing_date"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
        issueId: json["issue_id"],
        userId: json["user_id"],
        legalAdvisorId: json["legal_advisor_id"],
        advocateId: json["advocate_id"],
        advisorAssignedAt: json["advisor_assigned_at"] == null ? null : DateTime.parse(json["advisor_assigned_at"]),
        advocateApprovedAt: json["advocate_approved_at"] == null ? null : DateTime.parse(json["advocate_approved_at"]),
        advocateAssignedAt: json["advocate_assigned_at"] == null ? null : DateTime.parse(json["advocate_assigned_at"]),
        advocateRejectedAt: json["advocate_rejected_at"],
        advocateRejectedNotes: json["advocate_rejected_notes"],
        cnrNumber: json["cnr_number"],
        tempId: json["temp_id"],
        refId: json["ref_id"],
        price: json["price"],
        recentPaymentDate: json["recent_payment_date"] == null ? null : DateTime.parse(json["recent_payment_date"]),
        paidAmount: json["paid_amount"],
        advocateApprovedBy: json["advocate_approved_by"],
        advocateApprovedNotes: json["advocate_approved_notes"],
        isAdvocateApproved: json["is_advocate_approved"],
        isLegalAdvisorAssigned: json["is_legal_advisor_assigned"],
        isAdvocateAssigned: json["is_advocate_assigned"],
        onboardingBrief: json["onboarding_brief"],
        caseApprovedAt: json["case_approved_at"] == null ? null : DateTime.parse(json["case_approved_at"]),
        caseApprovedBy: json["case_approved_by"],
        caseRejectedAt: json["case_rejected_at"],
        caseRejectedBy: json["case_rejected_by"],
        caseRejectedNotes: json["case_rejected_notes"],
        isKycCompleted: json["is_kyc_completed"],
        isPaymentCompleted: json["is_payment_completed"],
        caseIssue: json["case_issue"] == null ? null : CaseIssue.fromJson(json["case_issue"]),
        user: json["user"] == null ? null : User.fromJson(json["user"]),
        legalAdvisor: json["legal_advisor"] == null ? null : Advocate.fromJson(json["legal_advisor"]),
        advocate: json["advocate"] == null ? null : Advocate.fromJson(json["advocate"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "description": description,
        "status": status,
        "priority": priority,
        "next_hearing_date": nextHearingDate,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "deleted_at": deletedAt,
        "issue_id": issueId,
        "user_id": userId,
        "legal_advisor_id": legalAdvisorId,
        "advocate_id": advocateId,
        "advisor_assigned_at": advisorAssignedAt?.toIso8601String(),
        "advocate_approved_at": advocateApprovedAt?.toIso8601String(),
        "advocate_assigned_at": advocateAssignedAt?.toIso8601String(),
        "advocate_rejected_at": advocateRejectedAt,
        "advocate_rejected_notes": advocateRejectedNotes,
        "cnr_number": cnrNumber,
        "temp_id": tempId,
        "ref_id": refId,
        "price": price,
        "recent_payment_date": recentPaymentDate?.toIso8601String(),
        "paid_amount": paidAmount,
        "advocate_approved_by": advocateApprovedBy,
        "advocate_approved_notes": advocateApprovedNotes,
        "is_advocate_approved": isAdvocateApproved,
        "is_legal_advisor_assigned": isLegalAdvisorAssigned,
        "is_advocate_assigned": isAdvocateAssigned,
        "onboarding_brief": onboardingBrief,
        "case_approved_at": caseApprovedAt?.toIso8601String(),
        "case_approved_by": caseApprovedBy,
        "case_rejected_at": caseRejectedAt,
        "case_rejected_by": caseRejectedBy,
        "case_rejected_notes": caseRejectedNotes,
        "is_kyc_completed": isKycCompleted,
        "is_payment_completed": isPaymentCompleted,
        "case_issue": caseIssue?.toJson(),
        "user": user?.toJson(),
        "legal_advisor": legalAdvisor?.toJson(),
        "advocate": advocate?.toJson(),
    };
}

class Advocate {
    int? id;
    String? firstName;
    String? lastName;
    String? email;
    String? designation;
    String? phone;
    String? profilePic;

    Advocate({
        this.id,
        this.firstName,
        this.lastName,
        this.email,
        this.designation,
        this.phone,
        this.profilePic,
    });

    factory Advocate.fromJson(Map<String, dynamic> json) => Advocate(
        id: json["id"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        email: json["email"],
        designation: json["designation"],
        phone: json["phone"],
        profilePic: json["profile_pic"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "first_name": firstName,
        "last_name": lastName,
        "email": email,
        "designation": designation,
        "phone": phone,
        "profile_pic": profilePic,
    };
}

class CaseIssue {
    String? category;
    String? caseType;
    String? issue;
    String? caseTypeLogo;
    String? categoryLogo;

    CaseIssue({
        this.category,
        this.caseType,
        this.issue,
        this.caseTypeLogo,
        this.categoryLogo,
    });

    factory CaseIssue.fromJson(Map<String, dynamic> json) => CaseIssue(
        category: json["category"],
        caseType: json["case_type"],
        issue: json["issue"],
        caseTypeLogo: json["case_type_logo"],
        categoryLogo: json["category_logo"],
    );

    Map<String, dynamic> toJson() => {
        "category": category,
        "case_type": caseType,
        "issue": issue,
        "case_type_logo": caseTypeLogo,
        "category_logo": categoryLogo,
    };
}

class User {
    int? id;
    String? firstName;
    String? lastName;
    String? phone;
    String? email;
    String? profilePic;
    String? aadhaar;
    dynamic advocateCode;
    dynamic barCouncilEnrollmentId;

    User({
        this.id,
        this.firstName,
        this.lastName,
        this.phone,
        this.email,
        this.profilePic,
        this.aadhaar,
        this.advocateCode,
        this.barCouncilEnrollmentId,
    });

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        phone: json["phone"],
        email: json["email"],
        profilePic: json["profile_pic"],
        aadhaar: json["aadhaar"],
        advocateCode: json["advocate_code"],
        barCouncilEnrollmentId: json["bar_council_enrollment_id"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "first_name": firstName,
        "last_name": lastName,
        "phone": phone,
        "email": email,
        "profile_pic": profilePic,
        "aadhaar": aadhaar,
        "advocate_code": advocateCode,
        "bar_council_enrollment_id": barCouncilEnrollmentId,
    };
}
