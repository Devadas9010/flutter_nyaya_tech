class AddNotesDto {
  final int caseid;
  final String title;
  final String note;
  final String type;
  AddNotesDto({required this.caseid, required this.title, required this.note,required this.type});
  Map<String, dynamic> toJson() {
    return {'case_id': caseid, 'title': title, 'note': note,'type':type};
  }
}
