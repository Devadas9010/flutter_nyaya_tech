import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nyaya_tech/data_components/shared_preference.dart';
import 'package:nyaya_tech/responses/list_all_Cases_response.dart';
import 'package:nyaya_tech/flutter_flow/flutter_flow_theme.dart';
import 'package:nyaya_tech/flutter_flow/flutter_flow_util.dart';
import 'package:timeline_tile/timeline_tile.dart';

class CaseCardWidget extends StatefulWidget {
  final CaseCardData casedata;
  const CaseCardWidget({super.key, required this.casedata});

  @override
  State<CaseCardWidget> createState() => _CaseCardWidgetState();
}

class _CaseCardWidgetState extends State<CaseCardWidget> {
  int currentStage = 0;


  @override
  Widget build(BuildContext context) {
    String orginalText = widget.casedata.status ?? '--';
    String status = orginalText.replaceAll("_", " ");

    if (status == 'PRE BOARDING' || status== 'Pre Boarding') {
      currentStage = 0;
    } else if (status == 'ON BOARDING' || status== 'On Boarding') {
      currentStage = 1;
    } else if (status == 'CASE FILING' || status == 'Case Filing') {
      currentStage = 2;
    } else if (status == 'COURT PROCEEDINGS' || status == 'Court Proceedings') {
      currentStage = 3;
    } else if (status == 'TRAIL PHASE' || status == 'Trail Phase') {
      currentStage = 4;
    } else if (status == 'CASE CLOSURE' || status == 'Case Closure') {
      currentStage = 5;
    }
    return InkWell(
      onTap: () {
        context.pushNamed('View_case');
        SharedPrefernce.setcaseId(widget.casedata.id!.toInt());
        print('case id -- ${SharedPrefernce.getcaseId()}');
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: const Color(0xFFDBDBDB)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              width: double.infinity,
              decoration: const BoxDecoration(color: Color(0xFFF6F6F6)),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Text(
                        widget.casedata.issue?.caseType ?? '--',
                        overflow: TextOverflow.ellipsis,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Plus Jakarta Sans',
                              letterSpacing: 0,
                            ),
                      ),
                    ),
                  ),
                  Flexible(
                    child: Container(
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      child: Align(
                        alignment: const AlignmentDirectional(0, 0),
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: Text(
                            status,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Plus Jakarta Sans',
                                  color: const Color(0xFFFF5C00),
                                  letterSpacing: 0,
                                ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 7,
            ),



         SizedBox(
  height: 30,
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: List.generate(6, (index) {
      bool isCompleted = index < currentStage; // Green for completed stages
      bool isCurrentStage = index == currentStage; // Orange border for current stage

      return Expanded(
        child: TimelineTile(
          axis: TimelineAxis.horizontal,
          isFirst: index == 0,
          isLast: index == 5,
          beforeLineStyle: LineStyle(
            color: (index > 0 && index <= currentStage) ? Colors.green : Colors.grey,
            thickness: 3, 
          ),
          afterLineStyle: LineStyle(
            color: (index < currentStage) ? Colors.green : Colors.grey,
            thickness: 3, 
          ),
          indicatorStyle: IndicatorStyle(
            width: 23,
            height: 23,
            indicator: Container(
              width: 23, 
              height: 23, 
              alignment: Alignment.center, // Center text properly
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isCurrentStage
                    ? Colors.white
                    : (isCompleted ? Colors.green : Colors.grey), // Green for completed, Grey for pending
                border: Border.all(
                  color: isCurrentStage ? Colors.orange : Colors.transparent,
                  width: isCurrentStage ? 3 : 0, // Border width affects alignment
                ),
              ),
              child: FittedBox( 
                child: Text(
                  '${index + 1}',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 12, 
                    color: isCurrentStage
                        ? Colors.orange
                        : (isCompleted ? Colors.white : Colors.black),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    }),
  ),
),






            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
              child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Flexible(
                          child: Text(
                            widget.casedata.issue?.issueTitle ?? '--',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'DM Sans',
                                  fontSize: 16,
                                  letterSpacing: 0,
                                  fontWeight: FontWeight.w300,
                                ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          decoration: const BoxDecoration(
                            color: Color(0x32FFA800),
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 6),
                          child: Text(
                            widget.casedata.priority ?? '--',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'DM Sans',
                                  color: const Color(0xFFFF5C00),
                                  letterSpacing: 0,
                                  fontWeight: FontWeight.w300,
                                ),
                          ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 35,
                              height: 35,
                              clipBehavior: Clip.antiAlias,
                              decoration:
                                  const BoxDecoration(shape: BoxShape.circle),
                              child: Image.network(
                                  widget.casedata.lawyer?.profilePic ??
                                      'https://static.vecteezy.com/system/resources/thumbnails/053/545/258/small/courtroom-scene-with-lawyer-presenting-argument-judge-observing-tense-and-focused-atmosphere-photo.jpg',
                                  fit: BoxFit.cover),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              '${widget.casedata.lawyer?.firstName ?? '--'} ${widget.casedata.lawyer?.lastName ?? '--'}',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                      fontFamily: 'DM Sans',
                                      letterSpacing: 0,
                                      fontWeight: FontWeight.w300),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SvgPicture.asset('assets/images/Calendar.svg',
                            height: 20, width: 20),
                        Text(
                          DateFormat('dd MMM yy')
                              .format(widget.casedata.createdAt!.toLocal()),
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                  fontFamily: 'DM Sans',
                                  color: const Color(0xFF181616),
                                  letterSpacing: 0,
                                  fontWeight: FontWeight.w300),
                        ),
                      ].divide(const SizedBox(width: 8)),
                    ),
                  ].divide(const SizedBox(height: 12))),
            ),
            Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Color(0xFFE7E7E7),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 6, vertical: 12),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Text(
                        'Next Hearing',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'DM Sans',
                              letterSpacing: 0,
                              fontWeight: FontWeight.w300,
                            ),
                      ),
                    ),
                    Flexible(
                      child: Align(
                        alignment: const AlignmentDirectional(1, 0),
                        child: Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: Text(
                            widget.casedata.nextHearingDate == null
                                ? '--'
                                : DateFormat('dd MMM yyyy').format(
                                    DateTime.parse(
                                        widget.casedata.nextHearingDate)),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'DM Sans',
                                  color: const Color(0xFF181616),
                                  fontSize: 16,
                                  letterSpacing: 0,
                                  fontWeight: FontWeight.w300,
                                ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
