import 'package:flutter/material.dart';
import 'package:nyaya_tech/backend/custom_response.dart';
import 'package:nyaya_tech/backend/services/check_list_api.dart';
import 'package:nyaya_tech/flutter_flow/flutter_flow_model.dart';
import 'package:nyaya_tech/response/checkList_response.dart';

class ListofchecklistModel extends FlutterFlowModel {
  @override
  void initState(BuildContext context) {}

  List<CheckList> checklistdata = [];
    num total_pages = 0;
  num per_page = 0;
  num current_page = 0;

  @override
  void dispose() {}

  Future<void> fetchCheckListData({int?page,int?limit}) async {
    CustomResponse<CheckListResponse> response =
        await ListCheckListApi().call(page: page,limit: limit);

    if (response.statusCode == 200) {
      if (page == 1) {
        checklistdata = response.data!.data!.records!;
      } else {
        checklistdata.addAll(response.data!.data!.records!);
      }
      per_page = response.data!.data!.paginationInfo!.pageSize!.toInt();
      current_page = response.data!.data!.paginationInfo!.currentPage!.toInt();
      total_pages = response.data!.data!.paginationInfo!.totalPages!.toInt();
    }
  }
}
