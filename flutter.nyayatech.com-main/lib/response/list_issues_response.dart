import 'dart:convert';

ListCasesIssues listCasesIssuesFromJson(String str) =>
    ListCasesIssues.fromJson(json.decode(str));

String listCasesIssuesToJson(ListCasesIssues data) =>
    json.encode(data.toJson());

class ListCasesIssues {
  int? status;
  bool? success;
  String? message;
  List<Issues>? data;

  ListCasesIssues({
    this.status,
    this.success,
    this.message,
    this.data,
  });

  factory ListCasesIssues.fromJson(Map<String, dynamic> json) =>
      ListCasesIssues(
        status: json["status"],
        success: json["success"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<Issues>.from(json["data"]!.map((x) => Issues.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "success": success,
        "message": message,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Issues {
  int? id;
  String? category;
  String? caseType;
  String? issue;
  String? categoryLogo;
  String? caseTypeLogo;
  String? issueLogo;

  Issues({
    this.id,
    this.category,
    this.caseType,
    this.issue,
    this.categoryLogo,
    this.caseTypeLogo,
    this.issueLogo,
  });

  factory Issues.fromJson(Map<String, dynamic> json) => Issues(
        id: json["id"],
        category: json["category"],
        caseType: json["case_type"],
        issue: json["issue"],
        categoryLogo: json["category_logo"],
        caseTypeLogo: json["case_type_logo"],
        issueLogo: json["issue_logo"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "category": category,
        "case_type": caseType,
        "issue": issue,
        "category_logo": categoryLogo,
        "case_type_logo": caseTypeLogo,
        "issue_logo": issueLogo,
      };
}
