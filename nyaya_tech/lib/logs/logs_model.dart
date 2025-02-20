import 'package:nyaya_tech/backend/custom_response.dart';
import 'package:nyaya_tech/backend/services/logs_api.dart';
import 'package:nyaya_tech/responses/list_case_logs_response.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'logs_widget.dart' show LogsWidget;
import 'package:flutter/material.dart';

class LogsModel extends FlutterFlowModel<LogsWidget> {
  @override
  void initState(BuildContext context) {}
  List<LogsData> listlogs = [];
  int currentPage = 1;
  int pageSize = 1;
  int totalPages = 1;

  @override
  void dispose() {}

  Future<List<LogsData>> fetchAllLogsData(int page, int pageSize) async {
    CustomResponse<ListCaseLogsResponse> response =
        await ListLogsApi().call(page: page, pageSize: pageSize);

        if(response.statusCode==200){
          final logs=response.data!.data!.records!;
          currentPage=response.data!.data!.paginationInfo!.currentPage!.toInt();
          pageSize=response.data!.data!.paginationInfo!.pageSize!.toInt();
          totalPages=response.data!.data!.paginationInfo!.totalPages!.toInt();
          return logs;
        }
        else{
          throw Exception(response.message);
        }
  }
}
