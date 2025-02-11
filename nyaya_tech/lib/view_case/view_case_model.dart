import 'package:flutter/material.dart';
import 'package:nyaya_tech/backend/custom_response.dart';
import 'package:nyaya_tech/backend/services/view_case_api.dart';
import 'package:nyaya_tech/components/details_screen_model.dart';
import 'package:nyaya_tech/flutter_flow/flutter_flow_util.dart';
import 'package:nyaya_tech/responses/view_Case_response.dart';

class ViewCaseModel extends FlutterFlowModel {
  late DetailsScreenModel detailsScreenModel;

  @override
  void initState(BuildContext context) {
    detailsScreenModel = createModel(context, () => DetailsScreenModel());
  }

  ViewCase? viewcase;

  @override
  void dispose() {
    detailsScreenModel.dispose();
  }

  Future<void> fetchViewCase() async {
    CustomResponse<ViewCaseResponse> response = await ViewCaseApi().call();
    if (response.statusCode == 200) {
      viewcase = response.data!.data;
    } else {
      response.message;
    }
  }
}
