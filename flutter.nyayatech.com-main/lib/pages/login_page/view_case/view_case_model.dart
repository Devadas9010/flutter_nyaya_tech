import 'package:flutter/material.dart';
import 'package:nyaya_tech/backend/custom_response.dart';
import 'package:nyaya_tech/backend/services/case_stage_api.dart';
import 'package:nyaya_tech/backend/services/view_case_api.dart';
import 'package:nyaya_tech/components/details_screen_model.dart';
import 'package:nyaya_tech/data_components/shared_prefernce.dart';
import 'package:nyaya_tech/flutter_flow/flutter_flow_util.dart';
import 'package:nyaya_tech/response/case_stage_response.dart';
import 'package:nyaya_tech/response/view_case_response.dart';

class ViewCaseModel extends FlutterFlowModel {
  late DetailsScreenModel detailsScreenModel;

  @override
  void initState(BuildContext context) {
    detailsScreenModel = createModel(context, () => DetailsScreenModel());
  }

  Data? viewCase;
  List<Stages>? stagesdata = [];
  Stages? stage;
  

  @override
  void dispose() {
    detailsScreenModel.dispose();
  }

  Future<void> fetchViewCase() async {
    CustomResponse<ViewCasesResponse> response = await ViewCaseApi().call();
    if (response.statusCode == 200) {
      viewCase = response.data!.data;
      SharedPrefernce.setcasesStatus(response.data!.data!.status.toString());
    } else {
      response.message;
    }
  }


   Future<void> fetchCaseStagesData() async {
    CustomResponse<CaseStageResponse> response = await CaseStagesApi().call();
    if (response.statusCode == 200) {
      stagesdata = response.data!.data;
    } else {
      print('error -${response.data}');
    }
  }
}
