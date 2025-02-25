import 'package:flutter/material.dart';
import 'package:nyaya_tech/flutter_flow/flutter_flow_theme.dart';
import 'package:nyaya_tech/flutter_flow/flutter_flow_util.dart';
import 'package:nyaya_tech/response/case_logs_response.dart';

class LogsCardsWidget extends StatelessWidget {
  final CaseLogs caseLogs;
  const LogsCardsWidget({super.key, required this.caseLogs});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            DateFormat('dd MMM yyyy [h:mm a]')
                .format(caseLogs.createdAt!.toLocal()),
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'DM Sans',
                  color: Colors.black,
                  letterSpacing: 0,
                  fontWeight: FontWeight.normal,
                ),
          ),
          Text(
            '${caseLogs.description}',
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'DM Sans',
                  color: Color(0xFF444444),
                  letterSpacing: 0,
                  fontWeight: FontWeight.w300,
                ),
          ),
        ].divide(SizedBox(height: 4)),
      ),
    );
  }
}
