// import 'package:flutter/material.dart';
// import 'package:flutter_animate/flutter_animate.dart';
// import 'package:get/get.dart';
// import 'package:nyaya_tech/components/step_2_component.dart';
// import 'package:nyaya_tech/data_components/get_routing.dart';
// import 'package:nyaya_tech/data_components/shared_prefernce.dart';
// import 'package:nyaya_tech/flutter_flow/flutter_flow_animation.dart';
// import 'package:nyaya_tech/flutter_flow/flutter_flow_theme.dart';
// import 'package:nyaya_tech/flutter_flow/flutter_flow_util.dart';
// import 'package:nyaya_tech/pages/login_page/step_3_screen/step3_screen_model.dart';

// class Step2ScreenWidget extends StatefulWidget {
//   const Step2ScreenWidget({super.key});

//   @override
//   State<Step2ScreenWidget> createState() => _Step2ScreenWidgetState();
// }

// class _Step2ScreenWidgetState extends State<Step2ScreenWidget> {
//   late Step3ScreenModel _model;
//   int? selectedIndex;
//   final scaffoldKey = GlobalKey<ScaffoldState>();
//   final animationsMap = <String, AnimationInfo>{};

//   @override
//   void initState() {
//     super.initState();
//     _model = createModel(context, () => Step3ScreenModel());
//     print('service title -- ${SharedPrefernce.getservicetitle()}');
//     animationsMap.addAll({
//       'rowOnPageLoadAnimation': AnimationInfo(
//         trigger: AnimationTrigger.onPageLoad,
//         effectsBuilder: () => [
//           MoveEffect(
//             curve: Curves.easeInOut,
//             delay: 0.0.ms,
//             duration: 700.0.ms,
//             begin: Offset(0.0, 20.0),
//             end: Offset(0.0, 0.0),
//           ),
//           FadeEffect(
//             curve: Curves.easeInOut,
//             delay: 0.0.ms,
//             duration: 700.0.ms,
//             begin: 0.0,
//             end: 1.0,
//           ),
//         ],
//       ),
//     });
//   }

//   @override
//   void dispose() {
//     _model.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final dataList = SharedPrefernce.getDataList();

//     final String selectedServiceTitle = SharedPrefernce.getservicetitle();

//     final filteredCaseList = dataList
//         .where((item) =>
//             item['category']?.toString().toLowerCase().trim() ==
//                 selectedServiceTitle.toLowerCase().trim() &&
//             item['case_type'] != null &&
//             item['case_type']!.toString().isNotEmpty)
//         .toList();

//     final fileteCaseLog = dataList
//         .where((item) =>
//             item['category']?.toString().toLowerCase() ==
//                 selectedServiceTitle.toLowerCase().toString() &&
//             item['case_type_logo'] != null &&
//             item['case_type_logo'].toString().isNotEmpty)
//         .toList();

//     final deduplicatedCaseList = filteredCaseList
//         .fold<List<Map<String, dynamic>>>([], (result, current) {
//       if (!result.any((item) => item['case_type'] == current['case_type'])) {
//         result.add(current);
//       }
//       return result;
//     });

//     final duplicteLogo =
//         fileteCaseLog.fold<List<Map<String, dynamic>>>([], (result, current) {
//       if (!result
//           .any((item) => item['case_type_logo'] == current['case_type_logo'])) {
//         result.add(current);
//       }
//       return result;
//     });
//     return WillPopScope(
//       onWillPop: () async {
//         return true;
//       },
//       child: SafeArea(
//         child: Scaffold(
//           key: scaffoldKey,
//           backgroundColor: const Color(0xFFFFFFFF),
//           body: Column(
//             mainAxisSize: MainAxisSize.max,
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Expanded(
//                 child: Padding(
//                   padding: const EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
//                   child: Column(
//                     mainAxisSize: MainAxisSize.max,
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     children: [
//                       Padding(
//                         padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 24),
//                         child: Row(
//                           mainAxisSize: MainAxisSize.max,
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             GestureDetector(
//                               onTap: () {
//                                 Get.back();
//                               },
//                               child: Container(
//                                 decoration: BoxDecoration(
//                                     color: Colors.white,
//                                     border: Border.all(
//                                         color: Colors.black, width: 1)),
//                                 child: Padding(
//                                   padding: EdgeInsets.all(10),
//                                   child: Icon(Icons.arrow_back,
//                                       color: FlutterFlowTheme.of(context)
//                                           .primaryText,
//                                       size: 24),
//                                 ),
//                               ),
//                             ),
//                             Flexible(
//                               child: Row(
//                                 mainAxisSize: MainAxisSize.max,
//                                 mainAxisAlignment: MainAxisAlignment.end,
//                                 children: [
//                                   Container(
//                                     decoration: BoxDecoration(
//                                       color: Colors.black,
//                                     ),
//                                     child: Padding(
//                                       padding: EdgeInsetsDirectional.fromSTEB(
//                                           16, 6, 16, 6),
//                                       child: Text(
//                                         '2',
//                                         style: FlutterFlowTheme.of(context)
//                                             .bodyMedium
//                                             .override(
//                                               fontFamily: 'DM Sans',
//                                               color: Colors.white,
//                                               fontSize: 20,
//                                               letterSpacing: 0.0,
//                                               fontWeight: FontWeight.normal,
//                                             ),
//                                       ),
//                                     ),
//                                   ),
//                                   Column(
//                                     mainAxisSize: MainAxisSize.max,
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.start,
//                                     children: [
//                                       Text(
//                                         'Step 2/3',
//                                         style: FlutterFlowTheme.of(context)
//                                             .bodyMedium
//                                             .override(
//                                               fontFamily: 'DM Sans',
//                                               color: Color(0xFFCA8A03),
//                                               letterSpacing: 0.0,
//                                               fontWeight: FontWeight.normal,
//                                             ),
//                                       ),
//                                       Text(
//                                         'Type of Service',
//                                         style: FlutterFlowTheme.of(context)
//                                             .bodyMedium
//                                             .override(
//                                               fontFamily: 'Plus Jakarta Sans',
//                                               color: Color(0xFF444444),
//                                               fontSize: 16,
//                                               letterSpacing: 0.0,
//                                               fontWeight: FontWeight.normal,
//                                             ),
//                                       ),
//                                     ],
//                                   ),
//                                 ].divide(SizedBox(width: 10)),
//                               ),
//                             ),
//                           ].divide(SizedBox(width: 7)),
//                         ),
//                       ),
//                       Row(
//                         mainAxisSize: MainAxisSize.max,
//                         children: [
//                           Text(
//                             'Select Case Type',
//                             style: FlutterFlowTheme.of(context)
//                                 .bodyMedium
//                                 .override(
//                                   fontFamily: 'DM Sans',
//                                   color: const Color(0xFFCA8A03),
//                                   fontSize: 16,
//                                   letterSpacing: 0,
//                                   fontWeight: FontWeight.normal,
//                                 ),
//                           ),
//                           const Icon(Icons.arrow_downward_outlined,
//                               color: Color(0xFFCA8A03), size: 24),
//                         ],
//                       ).animateOnPageLoad(
//                           animationsMap['rowOnPageLoadAnimation']!),
//                       Expanded(
//                         child: ListView.builder(
//                           physics: const AlwaysScrollableScrollPhysics(),
//                           itemCount: deduplicatedCaseList.length,
//                           itemBuilder: (context, index) {
//                             final caseTitle =
//                                 deduplicatedCaseList[index]['case_type'];
//                             final caseLogs =
//                                 duplicteLogo[index]['case_type_logo'];
//                             final isSelected = selectedIndex == index;
//                             return Padding(
//                               padding: const EdgeInsets.only(top: 8),
//                               child: GestureDetector(
//                                 onTap: () {
//                                   setState(() {
//                                     selectedIndex = index;
//                                     SharedPrefernce.setcasetitle(caseTitle);
//                                     print(
//                                         'data == ${SharedPrefernce.getcasetitle()}');
//                                   });
//                                   if (SharedPrefernce.getcasetitle() ==
//                                           'Other Issues' ||
//                                       SharedPrefernce.getcasetitle() ==
//                                           'Criminal Case' ||
//                                       SharedPrefernce.getcasetitle() ==
//                                           'Human Rights Violation / PIL / Against Government' ||
//                                       SharedPrefernce.getcasetitle() ==
//                                           'File a Bail Application for my Relative / Friend / Myself' ||
//                                       SharedPrefernce.getcasetitle() ==
//                                           'Cyber Crimes Case Filed on Me') {
//                                     Get.toNamed(Routes.otherissue);
//                                   } else if (SharedPrefernce.getcasetitle()
//                                       .isNotEmpty) {
//                                     Get.toNamed(Routes.step3);
//                                   }
//                                 },
//                                 child: Step2Component(
//                                   image: caseLogs,
//                                   isSelected: isSelected,
//                                   text1: caseTitle.toString().toUpperCase(),
//                                 ),
//                               ),
//                             );
//                           },
//                         ),
//                       ),
//                     ]
//                         .divide(const SizedBox(height: 12))
//                         .around(const SizedBox(height: 12)),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
