import 'package:flutter/material.dart';
import 'package:nyaya_tech/flutter_flow/flutter_flow_theme.dart';
import 'package:nyaya_tech/flutter_flow/flutter_flow_util.dart';
import 'package:nyaya_tech/response/case_summary_response.dart';

// class HearingSummaryCardWidget extends StatelessWidget {
//   final CaseSummary caseSummary;
//   const HearingSummaryCardWidget({super.key, required this.caseSummary});

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: () {
//         Get.toNamed(Routes.viewHearingNotes);
//         SharedPrefernce.setsummaryid(caseSummary.id.toString());
//       },
//       child: Container(
//         width: double.infinity,
//         decoration: BoxDecoration(color: Color(0xFFEDEDED)),
//         child: Padding(
//           padding: EdgeInsetsDirectional.fromSTEB(12, 12, 12, 12),
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Row(
//                 children: [
//                   Text(
//                     DateFormat('dd MMM yyyy')
//                         .format(caseSummary.date!.toLocal()),
//                     style: FlutterFlowTheme.of(context).bodyMedium.override(
//                         fontFamily: 'DM Sans',
//                         color: Color(0xFFFF5C00),
//                         fontSize: 14,
//                         letterSpacing: 0),
//                   ),
//                 ].divide(SizedBox(width: 8)),
//               ),
//               SizedBox(height: 12),
//               Text(
//                 '${caseSummary.note}',
//                 maxLines: 2,
//                 overflow: TextOverflow.ellipsis,
//                 style: FlutterFlowTheme.of(context).bodyMedium.override(
//                       fontFamily: 'DM Sans',
//                       color: Color(0xFF1A1A1A),
//                       letterSpacing: 0,
//                       fontWeight: FontWeight.normal,
//                     ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
class HearingSummaryCardWidget extends StatefulWidget {
  final CaseSummary caseSummary;
  const HearingSummaryCardWidget({super.key, required this.caseSummary});

  @override
  _HearingSummaryCardWidgetState createState() =>
      _HearingSummaryCardWidgetState();
}

class _HearingSummaryCardWidgetState extends State<HearingSummaryCardWidget> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    const int maxLinesCollapsed = 4;

    final bool isTextLong = widget.caseSummary.note!.length > 210;

    return InkWell(
      onTap: () {
        // Get.toNamed(Routes.viewHearingNotes);
        // SharedPrefernce.setsummaryid(widget.caseSummary.id.toString());
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
              Row(
                children: [
                  Text(
                    DateFormat('dd MMM yyyy')
                        .format(widget.caseSummary.createdAt!.toLocal()),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'DM Sans',
                        color: Color(0xFF4F4F4F),
                        fontSize: 14,
                        letterSpacing: 0),
                  ),
                ].divide(SizedBox(width: 8)),
              ),
              SizedBox(height: 12),
              Text(
                "${widget.caseSummary.note}",
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'DM Sans',
                      color: Color(0xFF1A1A1A),
                      letterSpacing: 0,
                      fontWeight: FontWeight.normal,
                    ),
                maxLines: isExpanded ? null : maxLinesCollapsed,
                overflow:
                    isExpanded ? TextOverflow.visible : TextOverflow.ellipsis,
              ),
              if (isTextLong) ...[
                SizedBox(height: 8),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isExpanded = !isExpanded;
                    });
                  },
                  child: Text(
                    isExpanded ? 'Show less' : 'Show more',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'DM Sans',
                          color: Color(0xFFFF5C00),
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
