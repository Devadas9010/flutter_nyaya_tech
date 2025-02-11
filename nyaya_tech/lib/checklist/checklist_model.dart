import 'package:nyaya_tech/backend/custom_response.dart';
import 'package:nyaya_tech/backend/services/checklist_api.dart';
import 'package:nyaya_tech/responses/List_of_checklist_response.dart';

import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ListofchecklistModel extends FlutterFlowModel {
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  List<CheckListData> checklistdata = [];

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}

  Future<void> fetchCheckListData() async {
    CustomResponse<ListofCheckListResponse> response =
        await ListCheckListApi().call();
    if (response.statusCode == 200) {
      checklistdata = response.data!.data!.records!;
    } else {
      throw Exception(response.message);
    }
  }
}
