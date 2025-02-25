class HearingSummaryDto {
  final int caseid;
  final DateTime date;
  final String notes;

  HearingSummaryDto(
      {required this.caseid, required this.date, required this.notes});

  Map<String, dynamic> toJson() {
    return {'case_id': caseid, 'date': date, 'note': notes};
  }
}
