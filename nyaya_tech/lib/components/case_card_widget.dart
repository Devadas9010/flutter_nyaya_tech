import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nyaya_tech/data_components/shared_preference.dart';
import 'package:nyaya_tech/responses/list_all_Cases_response.dart';
import 'package:nyaya_tech/flutter_flow/flutter_flow_theme.dart';
import 'package:nyaya_tech/flutter_flow/flutter_flow_util.dart';

class CaseCardWidget extends StatelessWidget {
  final CaseCardData casedata;
  const CaseCardWidget({super.key, required this.casedata});

  @override
  Widget build(BuildContext context) {
    String orginalText = '${casedata.status?? '--'}';
    String formattedText = orginalText.replaceAll("_", " ");
    return InkWell(
      onTap: () {
        context.pushNamed('View_case');
        SharedPrefernce.setcaseId(casedata.id!.toInt());
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
                        casedata.issue?.caseType?? '--',
                        overflow: TextOverflow.ellipsis,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Plus Jakarta Sans',
                              letterSpacing: 0,
                            ),
                      ),
                      //created
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
                            formattedText,
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
                            casedata.issue?.issueTitle?? '--',
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
                          padding:
                              const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                          child: Text(
                            casedata.priority?? '--',
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
                              decoration: const BoxDecoration(shape: BoxShape.circle),
                              child: Image.network(
                                  casedata.lawyer?.profilePic?? 'https://static.vecteezy.com/system/resources/thumbnails/053/545/258/small/courtroom-scene-with-lawyer-presenting-argument-judge-observing-tense-and-focused-atmosphere-photo.jpg',
                                  fit: BoxFit.cover),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              '${casedata.lawyer?.firstName?? '--'} ${casedata.lawyer?.lastName?? '--'}',
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
                              .format(casedata.createdAt!.toLocal()),
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
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 12),
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
                            casedata.nextHearingDate == null
                                ? '--'
                                : DateFormat('dd MMM yyyy').format(DateTime.parse(casedata.nextHearingDate)),
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
