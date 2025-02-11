import 'package:get/get.dart';
import 'package:nyaya_tech/backend/custom_response.dart';
import 'package:nyaya_tech/backend/services/hearing_summary_api.dart';
import 'package:nyaya_tech/responses/add_hearing_summary_response.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'add_hearing_summary_widget.dart' show AddHearingSummaryWidget;
import 'package:flutter/material.dart';

class AddHearingSummaryModel extends FlutterFlowModel<AddHearingSummaryWidget> {
  String message = '';
  bool error=false;
  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}

  Future<void> fetchAddHearingSummary(
      {required int case_id,
      required String date,
      required String note}) async {
    CustomResponse<AddHearingSummaryResponse> response =
        await AddHearingSummaryApi()
            .call(case_id: case_id, date: date, note: note);

    if (response.statusCode == 200 || response.statusCode == 201) {
      message = response.data!.message.toString();
    } else {
      message = response.data!.message.toString();
    }
  }
}
