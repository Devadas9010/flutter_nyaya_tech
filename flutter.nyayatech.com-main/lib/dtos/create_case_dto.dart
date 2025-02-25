class CreateCaseDto {
  final String serviceTitle;
  final String caseType;
  final String issueTitle;
  final String? description;
  CreateCaseDto(
      {required this.serviceTitle,
      required this.caseType,
      required this.issueTitle,
      this.description});
  Map<String, dynamic> toJson() {
    return {
      'category': serviceTitle,
      'case_type': caseType,
      'issue': issueTitle,
      'description': description
    };
  }
}
