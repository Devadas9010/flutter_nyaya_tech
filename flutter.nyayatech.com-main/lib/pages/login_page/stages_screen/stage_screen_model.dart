// import 'package:flutter/material.dart';
// import 'package:nyaya_tech/backend/custom_response.dart';
// import 'package:nyaya_tech/backend/services/case_stage_api.dart';
// import 'package:nyaya_tech/flutter_flow/flutter_flow_model.dart';
// import 'package:nyaya_tech/response/case_stage_response.dart';

// class StatusProductsModel extends FlutterFlowModel {
//   @override
//   void initState(BuildContext context) {}

//   List<Stages>? stagesdata = [];
//   Stages? stage;

//   @override
//   void dispose() {}

//   Future<void> fetchCaseStage() async {
//     CustomResponse<CaseStageResponse> response = await CaseStageApi().call();
//     if (response.statusCode == 200) {
//       stagesdata = response.data!.data;
//     } else {
//       print('error -${response.data}');
//     }
//   }
// }

import 'package:nyaya_tech/backend/custom_response.dart';
import 'package:nyaya_tech/backend/services/case_stage_api.dart';
import 'package:nyaya_tech/pages/login_page/stages_screen/stage_screen_widget.dart';
import 'package:nyaya_tech/response/case_stage_response.dart';

import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class StatusProductsModel extends FlutterFlowModel<StatusProductsWidget> {
  @override
  void initState(BuildContext context) {}
  List<Stages>? stagesdata = [];
  Stages? stage;
  @override
  void dispose() {}

  Future<void> fetchCaseStage() async {
    CustomResponse<CaseStageResponse> response = await CaseStageApi().call();
    if (response.statusCode == 200) {
      stagesdata = response.data!.data;
    } else {
      print('error -${response.data}');
    }
  }
}
