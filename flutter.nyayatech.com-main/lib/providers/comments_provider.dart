import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:nyaya_tech/response/get_comments_response.dart';

class CommentsProvider with ChangeNotifier, DiagnosticableTreeMixin{
  List<Commentdata> _taskcommentsData = [];

  List<Commentdata> get taskcommentsData => _taskcommentsData;

  void setTaskCommentData(List<Commentdata> taskcommentsData) {
    this._taskcommentsData = taskcommentsData;
    notifyListeners();
  }
}