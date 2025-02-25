class AddSummarydto {
  final int caseid;
  final String date;
  final String note;
  AddSummarydto({required this.caseid, required this.date, required this.note});
  Map<String, dynamic> toJson() {
    return {'case_id': caseid, 'date': date, 'note': note};
  }
}
