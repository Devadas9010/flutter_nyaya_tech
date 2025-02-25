import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nyaya_tech/data_components/get_routing.dart';
import 'package:nyaya_tech/data_components/shared_prefernce.dart';
import 'package:nyaya_tech/flutter_flow/flutter_flow_theme.dart';
import 'package:nyaya_tech/flutter_flow/flutter_flow_util.dart';
import 'package:nyaya_tech/response/list_cases_response.dart';
// import 'package:easy_stepper/easy_stepper.dart';
import 'package:timeline_tile/timeline_tile.dart';

class CaseCardWidget extends StatelessWidget {
  final CaseCardData casedata;
  const CaseCardWidget({super.key, required this.casedata});

  String capitalizeEachWord(String text) {
    return text
        .toLowerCase()
        .split(' ')
        .map((word) =>
            word.isNotEmpty ? word[0].toUpperCase() + word.substring(1) : '')
        .join(' ');
  }

  @override
  Widget build(BuildContext context) {
    String orginalText = casedata.status.toString();
    String formattedText = capitalizeEachWord(orginalText.replaceAll("_", " "));
    int currentStage = 0;
    if (formattedText == 'PRE BOARDING' || formattedText == 'Pre Boarding') {
      currentStage = 0;
    } else if (formattedText == 'ON BOARDING' ||
        formattedText == 'On Boarding') {
      currentStage = 1;
    } else if (formattedText == 'CASE FILING' ||
        formattedText == 'Case Filing') {
      currentStage = 2;
    } else if (formattedText == 'COURT PROCEEDINGS' ||
        formattedText == 'Court Proceedings') {
      currentStage = 3;
    } else if (formattedText == 'TRAIL PHASE' ||
        formattedText == 'Trail Phase') {
      currentStage = 4;
    } else if (formattedText == 'CASE CLOSURE' ||
        formattedText == 'Case Closure' || formattedText == 'Closure') {
      currentStage = 5;
    }

    String formattedPriority =
        capitalizeEachWord(casedata.priority?.toString() ?? 'Low');

    Color getPriorityBg(String? priority) {
      if (priority == 'High') {
        return const Color(0xFFFF7043).withOpacity(0.2);
      } else if (priority == 'Medium') {
        return const Color(0XFFFFA726).withOpacity(0.2);
      } else if (priority == 'Low') {
        return const Color(0XFF78909C).withOpacity(0.2);
      } else if (priority == 'Emergency') {
        return Color(0XFFD32F2F).withOpacity(0.2);
      }
      return Colors.grey;
    }

    Color getPriority(String? priority) {
      if (priority == 'High') {
        return const Color(0xFFFF7043);
      } else if (priority == 'Medium') {
        return const Color(0XFFFFA726);
      } else if (priority == 'Low') {
        return const Color(0XFF78909C);
      } else if (priority == 'Emergency') {
        return Color(0XFFD32F2F);
      }
      return Colors.black;
    }

    Color getStatus(String? status) {
      if (status == 'Pre Boarding') {
        return const Color(0XFF3B3B3B);
      } else if (status == 'On Boarding') {
        return const Color(0XFF1E88E5);
      } else if (status == 'Case Filing') {
        return const Color(0XFFFFB300);
      } else if (status == 'Court Proceedings') {
        return Color(0XFFD81B60);
      } else if (status == 'Trail Phase') {
        return Color(0XFF8E24AA);
      } else if (status == 'Closure') {
        return Color(0XFF219653);
      }
      return const Color(0xFFFF5C00);
    }

    return InkWell(
      onTap: () {
        if (casedata.id != null) {
          Get.toNamed(Routes.viewcase);
          SharedPrefernce.setcaseId(casedata.id!.toInt());
          SharedPrefernce.setcasesStatus(casedata.status.toString());
          print('case id -- ${casedata.id}');
        }
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
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Color(0xFFE7E7E7).withOpacity(0.2)),
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Text(
                        casedata.refId == null
                            ? casedata.tempId.toString()
                            : casedata.refId.toString(),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'DM Sans',
                            letterSpacing: 0,
                            fontSize: 14,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                ),
                Flexible(
                  child: Container(
                    decoration: BoxDecoration(color: Color(0XFFD1D1D1)),
                    child: Align(
                      alignment: AlignmentDirectional.center,
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: Text(
                          formattedText,
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                  fontFamily: 'DM Sans',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: getStatus(formattedText),
                                  letterSpacing: 0),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            


            SizedBox(
              height: 7,
            ),
            SizedBox(
              height: 30,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(6, (index) {
                  bool isCompleted =
                      index < currentStage; // Green for completed stages
                  bool isCurrentStage =
                      index == currentStage; // Orange border for current stage

                  return Expanded(
                    child: TimelineTile(
                      axis: TimelineAxis.horizontal,
                      isFirst: index == 0,
                      isLast: index == 5,
                      beforeLineStyle: LineStyle(
                        color: (index > 0 && index <= currentStage)
                            ? Colors.green
                            : Colors.grey,
                        thickness: 3,
                      ),
                      afterLineStyle: LineStyle(
                        color:
                            (index < currentStage) ? Colors.green : Colors.grey,
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
                                : (isCompleted
                                    ? Colors.green
                                    : Colors
                                        .grey), // Green for completed, Grey for pending
                            border: Border.all(
                              color: isCurrentStage
                                  ? Colors.orange
                                  : Colors.transparent,
                              width: isCurrentStage
                                  ? 3
                                  : 0, // Border width affects alignment
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
                                    : (isCompleted
                                        ? Colors.white
                                        : Colors.black),
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
              padding: const EdgeInsets.all(8),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      SvgPicture.network(
                          casedata.caseIssue!.categoryLogo.toString(),
                          height: 20,
                          width: 20),
                      Expanded(
                        child: Text(
                          '${casedata.caseIssue!.category}',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'DM Sans',
                                    fontSize: 14,
                                    fontWeight: FontWeight.w300,
                                  ),
                        ),
                      )
                    ].divide(SizedBox(width: 8)),
                  ),
                  if (casedata.description == null)
                    Row(
                      children: [
                        SvgPicture.network(
                            casedata.caseIssue!.caseTypeLogo.toString(),
                            height: 20,
                            width: 20),
                        Expanded(
                          child: Text(
                            '${casedata.caseIssue!.caseType}',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'DM Sans',
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                ),
                          ),
                        )
                      ].divide(SizedBox(width: 8)),
                    ),
                  casedata.description == null
                      ? Row(
                          children: [
                            SvgPicture.network(
                                casedata.caseIssue!.issueLogo.toString(),
                                height: 20,
                                width: 20),
                            Expanded(
                              child: Text(
                                '${casedata.caseIssue!.issue}',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                        fontFamily: 'DM Sans',
                                        fontSize: 16,
                                        fontWeight: FontWeight.w300),
                              ),
                            )
                          ].divide(SizedBox(width: 8)),
                        )
                      : Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Flexible(
                                child: Text(
                              casedata.description.toString(),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'DM Sans',
                                    fontSize: 16,
                                    letterSpacing: 0,
                                    fontWeight: FontWeight.w300,
                                  ),
                            )),
                          ],
                        ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SvgPicture.asset('assets/images/created.svg',
                            height: 20, width: 20),
                        Text(
                          casedata.createdAt != null
                              ? DateFormat('dd MMM yyyy')
                                  .format(casedata.createdAt!.toLocal())
                              : 'Unknown Date',
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                  fontFamily: 'DM Sans',
                                  color: const Color(0xFF181616),
                                  letterSpacing: 0,
                                  fontWeight: FontWeight.w300),
                        ),
                      ].divide(SizedBox(width: 8)),
                    ),
                  ),
                ].divide(SizedBox(height: 12)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 6, right: 6),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: 35,
                        height: 35,
                        clipBehavior: Clip.antiAlias,
                        decoration: const BoxDecoration(shape: BoxShape.circle),
                        child: (casedata.advocate?.profilePic?.isNotEmpty ??
                                false)
                            ? Image.network('${casedata.advocate!.profilePic}',
                                fit: BoxFit.cover)
                            : SvgPicture.asset('assets/images/law_profile.svg',
                                fit: BoxFit.cover),
                      ),
                      const SizedBox(width: 8),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            '${casedata.advocate?.firstName ?? 'Not Assign'} ${casedata.advocate?.lastName ?? ''}',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                    fontFamily: 'DM Sans',
                                    letterSpacing: 0,
                                    fontWeight: FontWeight.w300,
                                    fontSize: 14,
                                    color: Color(0xFF181616)),
                          ),
                          Text(
                            'Advocate',
                            style: TextStyle(
                                fontFamily: 'DM Sans',
                                fontSize: 12,
                                color: Color(0xFF444444).withOpacity(0.7),
                                fontWeight: FontWeight.w300),
                          )
                        ].divide(SizedBox(height: 6)),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: 35,
                        height: 35,
                        clipBehavior: Clip.antiAlias,
                        decoration: const BoxDecoration(shape: BoxShape.circle),
                        child: (casedata.legalAdvisor?.profilePic?.isNotEmpty ??
                                false)
                            ? Image.network(
                                '${casedata.legalAdvisor?.profilePic}',
                                fit: BoxFit.cover)
                            : SvgPicture.asset('assets/images/law_profile.svg',
                                fit: BoxFit.cover),
                      ),
                      const SizedBox(width: 8),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            '${casedata.legalAdvisor?.firstName ?? 'Not Assign'} ${casedata.legalAdvisor?.lastName ?? ''}',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                    fontFamily: 'DM Sans',
                                    letterSpacing: 0,
                                    fontWeight: FontWeight.w300,
                                    fontSize: 14,
                                    color: Color(0xFF181616)),
                          ),
                          Text(
                            'L A.D',
                            style: TextStyle(
                                fontFamily: 'DM Sans',
                                fontSize: 12,
                                color: Color(0XFF444444).withOpacity(0.7),
                                fontWeight: FontWeight.w300),
                          )
                        ].divide(SizedBox(height: 6)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8, right: 8),
              child: Divider(
                  thickness: 1, color: Color(0XFF000000).withOpacity(0.1)),
            ),
            Container(
              width: double.infinity,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.only(left: 12, right: 8, bottom: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Next Hearing :   ',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'DM Sans',
                                    letterSpacing: 0,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w300,
                                  ),
                        ),
                        Text(
                          casedata.nextHearingDate == null
                              ? '--'
                              : DateFormat('dd MMM yyyy').format(
                                  DateTime.tryParse(casedata.nextHearingDate
                                          .toString()) ??
                                      DateTime.now()),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'DM Sans',
                                    color: const Color(0xFF181616),
                                    fontSize: 16,
                                    letterSpacing: 0,
                                    fontWeight: FontWeight.w300,
                                  ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: getPriorityBg(formattedPriority),
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 6),
                          child: Text(
                            formattedPriority,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'DM Sans',
                                  color: getPriority(formattedPriority),
                                  letterSpacing: 0,
                                  fontWeight: FontWeight.w300,
                                ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )

            // Container(
            //   width: double.infinity,
            //   decoration: const BoxDecoration(color: Color(0xFFE7E7E7)),
            //   child: Padding(
            //     padding:
            //         const EdgeInsets.symmetric(horizontal: 6, vertical: 12),
            //     child: Row(
            //       children: [
            //         Row(
            //           mainAxisAlignment: MainAxisAlignment.start,
            //           children: [
            //             Flexible(
            //               child: Text(
            //                 'Next Hearing',
            //                 style: FlutterFlowTheme.of(context)
            //                     .bodyMedium
            //                     .override(
            //                       fontFamily: 'DM Sans',
            //                       letterSpacing: 0,
            //                       fontWeight: FontWeight.w300,
            //                     ),
            //               ),
            //             ),
            //             Flexible(
            //               child: Align(
            //                 alignment: AlignmentDirectional.centerEnd,
            //                 child: Padding(
            //                   padding: const EdgeInsets.only(right: 8),
            //                   child: Text(
            //                     casedata.nextHearingDate == null
            //                         ? '--'
            //                         : DateFormat('dd MMM yyyy').format(
            //                             DateTime.tryParse(casedata
            //                                     .nextHearingDate
            //                                     .toString()) ??
            //                                 DateTime.now()),
            //                     style: FlutterFlowTheme.of(context)
            //                         .bodyMedium
            //                         .override(
            //                           fontFamily: 'DM Sans',
            //                           color: const Color(0xFF181616),
            //                           fontSize: 16,
            //                           letterSpacing: 0,
            //                           fontWeight: FontWeight.w300,
            //                         ),
            //                   ),
            //                 ),
            //               ),
            //             ),
            //           ],
            //         ),
            //         Flexible(
            //           child: Row(
            //             children: [
            //               Container(
            //                 decoration: BoxDecoration(
            //                   color: getPriorityBg(formattedPriority),
            //                 ),
            //                 padding: const EdgeInsets.symmetric(
            //                     horizontal: 16, vertical: 6),
            //                 child: Text(
            //                   formattedPriority,
            //                   style: FlutterFlowTheme.of(context)
            //                       .bodyMedium
            //                       .override(
            //                         fontFamily: 'DM Sans',
            //                         color: getPriority(formattedPriority),
            //                         letterSpacing: 0,
            //                         fontWeight: FontWeight.w300,
            //                       ),
            //                 ),
            //               ),
            //             ],
            //           ),
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
          ].divide(SizedBox(height: 4)),
        ),
      ),
    );
  }
}
