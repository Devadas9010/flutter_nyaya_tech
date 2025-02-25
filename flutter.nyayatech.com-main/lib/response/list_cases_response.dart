import 'dart:convert';

ListCases listCasesFromJson(String str) => ListCases.fromJson(json.decode(str));

String listCasesToJson(ListCases data) => json.encode(data.toJson());

class ListCases {
  int? status;
  bool? success;
  String? message;
  Data? data;

  ListCases({
    this.status,
    this.success,
    this.message,
    this.data,
  });

  factory ListCases.fromJson(Map<String, dynamic> json) => ListCases(
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
  PaginationInfo? paginationInfo;
  List<CaseCardData>? records;

  Data({
    this.paginationInfo,
    this.records,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        paginationInfo: json["pagination_info"] == null
            ? null
            : PaginationInfo.fromJson(json["pagination_info"]),
        records: json["records"] == null
            ? []
            : List<CaseCardData>.from(
                json["records"]!.map((x) => CaseCardData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "pagination_info": paginationInfo?.toJson(),
        "records": records == null
            ? []
            : List<dynamic>.from(records!.map((x) => x.toJson())),
      };
}

class PaginationInfo {
  int? totalCaseCardDatas;
  int? totalPages;
  int? pageSize;
  int? currentPage;
  dynamic nextPage;
  dynamic prevPage;

  PaginationInfo({
    this.totalCaseCardDatas,
    this.totalPages,
    this.pageSize,
    this.currentPage,
    this.nextPage,
    this.prevPage,
  });

  factory PaginationInfo.fromJson(Map<String, dynamic> json) => PaginationInfo(
        totalCaseCardDatas: json["total_records"],
        totalPages: json["total_pages"],
        pageSize: json["page_size"],
        currentPage: json["current_page"],
        nextPage: json["next_page"],
        prevPage: json["prev_page"],
      );

  Map<String, dynamic> toJson() => {
        "total_records": totalCaseCardDatas,
        "total_pages": totalPages,
        "page_size": pageSize,
        "current_page": currentPage,
        "next_page": nextPage,
        "prev_page": prevPage,
      };
}

class CaseCardData {
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
  dynamic advocateApprovedAt;
  DateTime? advocateAssignedAt;
  dynamic advocateRejectedAt;
  dynamic advocateRejectedNotes;
  dynamic cnrNumber;
  String? tempId;
  dynamic refId;
  String? price;
  dynamic recentPaymentDate;
  String? paidAmount;
  dynamic advocateApprovedBy;
  dynamic advocateApprovedNotes;
  bool? isAdvocateApproved;
  bool? isAdvocateAssigned;
  bool? isLegalAdvisorAssigned;
  dynamic onboardingBrief;
  DateTime? caseApprovedAt;
  int? caseApprovedBy;
  dynamic caseRejectedAt;
  dynamic caseRejectedBy;
  dynamic caseRejectedNotes;
  CaseIssue? caseIssue;
  Advocate? user;
  Advocate? legalAdvisor;
  Advocate? advocate;

  CaseCardData({
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
    this.isAdvocateAssigned,
    this.isLegalAdvisorAssigned,
    this.onboardingBrief,
    this.caseApprovedAt,
    this.caseApprovedBy,
    this.caseRejectedAt,
    this.caseRejectedBy,
    this.caseRejectedNotes,
    this.caseIssue,
    this.user,
    this.legalAdvisor,
    this.advocate,
  });

  factory CaseCardData.fromJson(Map<String, dynamic> json) => CaseCardData(
        id: json["id"],
        description: json["description"],
        status: json["status"],
        priority: json["priority"],
        nextHearingDate: json["next_hearing_date"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
        issueId: json["issue_id"],
        userId: json["user_id"],
        legalAdvisorId: json["legal_advisor_id"],
        advocateId: json["advocate_id"],
        advisorAssignedAt: json["advisor_assigned_at"] == null
            ? null
            : DateTime.parse(json["advisor_assigned_at"]),
        advocateApprovedAt: json["advocate_approved_at"],
        advocateAssignedAt: json["advocate_assigned_at"] == null
            ? null
            : DateTime.parse(json["advocate_assigned_at"]),
        advocateRejectedAt: json["advocate_rejected_at"],
        advocateRejectedNotes: json["advocate_rejected_notes"],
        cnrNumber: json["cnr_number"],
        tempId: json["temp_id"],
        refId: json["ref_id"],
        price: json["price"],
        recentPaymentDate: json["recent_payment_date"],
        paidAmount: json["paid_amount"],
        advocateApprovedBy: json["advocate_approved_by"],
        advocateApprovedNotes: json["advocate_approved_notes"],
        isAdvocateApproved: json["is_advocate_approved"],
        isAdvocateAssigned: json["is_advocate_assigned"],
        isLegalAdvisorAssigned: json["is_legal_advisor_assigned"],
        onboardingBrief: json["onboarding_brief"],
        caseApprovedAt: json["case_approved_at"] == null
            ? null
            : DateTime.parse(json["case_approved_at"]),
        caseApprovedBy: json["case_approved_by"],
        caseRejectedAt: json["case_rejected_at"],
        caseRejectedBy: json["case_rejected_by"],
        caseRejectedNotes: json["case_rejected_notes"],
        caseIssue: json["case_issue"] == null
            ? null
            : CaseIssue.fromJson(json["case_issue"]),
        user: json["user"] == null ? null : Advocate.fromJson(json["user"]),
        legalAdvisor: json["legal_advisor"] == null
            ? null
            : Advocate.fromJson(json["legal_advisor"]),
        advocate: json["advocate"] == null
            ? null
            : Advocate.fromJson(json["advocate"]),
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
        "advocate_approved_at": advocateApprovedAt,
        "advocate_assigned_at": advocateAssignedAt?.toIso8601String(),
        "advocate_rejected_at": advocateRejectedAt,
        "advocate_rejected_notes": advocateRejectedNotes,
        "cnr_number": cnrNumber,
        "temp_id": tempId,
        "ref_id": refId,
        "price": price,
        "recent_payment_date": recentPaymentDate,
        "paid_amount": paidAmount,
        "advocate_approved_by": advocateApprovedBy,
        "advocate_approved_notes": advocateApprovedNotes,
        "is_advocate_approved": isAdvocateApproved,
        "is_advocate_assigned": isAdvocateAssigned,
        "is_legal_advisor_assigned": isLegalAdvisorAssigned,
        "onboarding_brief": onboardingBrief,
        "case_approved_at": caseApprovedAt?.toIso8601String(),
        "case_approved_by": caseApprovedBy,
        "case_rejected_at": caseRejectedAt,
        "case_rejected_by": caseRejectedBy,
        "case_rejected_notes": caseRejectedNotes,
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
  String? profilePic;
  String? email;
  dynamic designation;
  String? userType;

  Advocate({
    this.id,
    this.firstName,
    this.lastName,
    this.profilePic,
    this.email,
    this.designation,
    this.userType,
  });

  factory Advocate.fromJson(Map<String, dynamic> json) => Advocate(
        id: json["id"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        profilePic: json["profile_pic"],
        email: json["email"],
        designation: json["designation"],
        userType: json["user_type"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "first_name": firstName,
        "last_name": lastName,
        "profile_pic": profilePic,
        "email": email,
        "designation": designation,
        "user_type": userType,
      };
}

class CaseIssue {
  int? id;
  String? category;
  String? caseType;
  String? issue;
  String? caseTypeLogo;
  String? issueLogo;
  String? categoryLogo;

  CaseIssue({
    this.id,
    this.category,
    this.caseType,
    this.issue,
    this.caseTypeLogo,
    this.issueLogo,
    this.categoryLogo,
  });

  factory CaseIssue.fromJson(Map<String, dynamic> json) => CaseIssue(
        id: json["id"],
        category: json["category"],
        caseType: json["case_type"],
        issue: json["issue"],
        caseTypeLogo: json["case_type_logo"],
        issueLogo: json["issue_logo"],
        categoryLogo: json["category_logo"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "category": category,
        "case_type": caseType,
        "issue": issue,
        "case_type_logo": caseTypeLogo,
        "issue_logo": issueLogo,
        "category_logo": categoryLogo,
      };
}
