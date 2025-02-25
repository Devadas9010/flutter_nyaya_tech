class CommentsDto {
  final int caseid;
  final String comments;
  final String type;

  CommentsDto({required this.caseid, required this.comments,required this.type});

  Map<String, dynamic> toJson() {
    return {'case_id': caseid, 'message': comments,'type':type};
  }
}
