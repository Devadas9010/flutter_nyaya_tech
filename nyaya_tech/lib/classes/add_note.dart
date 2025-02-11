class AddNotes {
  final int caseid;
  final String title;
  final String note;
  AddNotes({required this.caseid, required this.title, required this.note});
  Map<String, dynamic> toJson() {
    return {'case_id': caseid, 'title': title, 'note': note};
  }
}

