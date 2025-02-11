import 'package:nyaya_tech/backend/custom_response.dart';
import 'package:nyaya_tech/backend/services/hearing_summary_api.dart';
import 'package:nyaya_tech/responses/view_hearing_summary_response.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'view_hearing_summary_widget.dart' show ViewHearingSummaryWidget;
import 'package:flutter/material.dart';

class ViewHearingSummaryModel
    extends FlutterFlowModel<ViewHearingSummaryWidget> {
  ViewSummary? viewSummary;
  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}

  Future<void> fetchViewSummary() async {
    CustomResponse<ViewHearingSummaryResponse> response =
        await ViewHearingSummaryApi().call();
    if (response.statusCode == 200) {
      viewSummary = response.data!.data;
    }
    else{
      print('error');
    }
  }


  
}
