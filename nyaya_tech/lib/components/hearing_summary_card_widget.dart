import 'package:flutter/material.dart';
import 'package:nyaya_tech/data_components/shared_preference.dart';
import 'package:nyaya_tech/flutter_flow/flutter_flow_theme.dart';
import 'package:nyaya_tech/flutter_flow/flutter_flow_util.dart';
import 'package:nyaya_tech/responses/list_all_cases_hearing_summary_response.dart';

class HearingSummaryCardWidget extends StatelessWidget {
  final ListCaseSummary caseSummary;
  const HearingSummaryCardWidget({super.key, required this.caseSummary});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.pushNamed('view_hearing_summary');
        //Get.toNamed(Routes.viewHearingNotes);
        SharedPrefernce.setsummaryid(caseSummary.id.toString());
      },
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(color: Color(0xFFEDEDED)),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(12, 12, 12, 12),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                DateFormat('dd MMM yyyy').format(caseSummary.date!.toLocal()),
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'DM Sans',
                      color: Color(0xFFFF5C00),
                      fontSize: 14,
                      letterSpacing: 0,
                    ),
              ),
              SizedBox(height: 12),
              Text(
                '${caseSummary.note}',
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'DM Sans',
                      color: Color(0xFF1A1A1A),
                      letterSpacing: 0,
                      fontWeight: FontWeight.normal,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
