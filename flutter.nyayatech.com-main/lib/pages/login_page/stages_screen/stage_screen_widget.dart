// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:get/get.dart';
// import 'package:lottie/lottie.dart';
// import 'package:intl/intl.dart';
// import 'package:nyaya_tech/flutter_flow/flutter_flow_theme.dart';
// import 'package:nyaya_tech/flutter_flow/flutter_flow_util.dart';
// import 'package:nyaya_tech/pages/login_page/stages_screen/stage_screen_model.dart';

// class StatusProductsWidget extends StatefulWidget {
//   const StatusProductsWidget({super.key});

//   @override
//   State<StatusProductsWidget> createState() => _StatusProductsWidgetState();
// }

// class _StatusProductsWidgetState extends State<StatusProductsWidget> {
//   late StatusProductsModel _model;
//   late Future<void> _future;
//   final scaffoldKey = GlobalKey<ScaffoldState>();

//   @override
//   void initState() {
//     super.initState();
//     _model = createModel(context, () => StatusProductsModel());
//     _future = fetchdata();
//   }

//   Future<void> fetchdata() async {
//     await _model.fetchCaseStage();
//   }

//   @override
//   void dispose() {
//     _model.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         FocusScope.of(context).unfocus();
//         FocusManager.instance.primaryFocus?.unfocus();
//       },
//       child: Scaffold(
//         key: scaffoldKey,
//         backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
//         body: SafeArea(
//           top: true,
//           child: Padding(
//             padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 0),
//             child: Column(
//               mainAxisSize: MainAxisSize.max,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Row(
//                   mainAxisSize: MainAxisSize.max,
//                   children: [
//                     InkWell(
//                       onTap: () {
//                         Get.back();
//                       },
//                       child: Container(
//                         decoration: BoxDecoration(
//                           color:
//                               FlutterFlowTheme.of(context).secondaryBackground,
//                           border: Border.all(
//                             color: FlutterFlowTheme.of(context).primaryText,
//                           ),
//                         ),
//                         child: Padding(
//                           padding: EdgeInsets.all(8),
//                           child: Icon(
//                             Icons.arrow_back,
//                             color: FlutterFlowTheme.of(context).primaryText,
//                             size: 24,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//                 Expanded(
//                   child: SingleChildScrollView(
//                       child: FutureBuilder(
//                           future: _future,
//                           builder: (context, snapshot) {
//                             if (snapshot.connectionState ==
//                                 ConnectionState.waiting) {
//                               return Padding(
//                                 padding: const EdgeInsets.only(top: 200),
//                                 child: Center(
//                                     child: Lottie.asset(
//                                         'assets/lottie_animations/loading_animation.json',
//                                         width: 150,
//                                         height: 150)),
//                               );
//                             } else if (snapshot.hasError) {
//                               return Center(
//                                 child: Column(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   children: [
//                                     SvgPicture.asset(
//                                       'assets/images/No_internet1.svg',
//                                       height: 100,
//                                       width: 100,
//                                     ),
//                                     Text('No-Connection',
//                                         style: TextStyle(
//                                             color: Colors.black,
//                                             fontSize: 16,
//                                             fontWeight: FontWeight.w500))
//                                   ],
//                                 ),
//                               );
//                             } else {
//                               return

// Column(
//                                 mainAxisSize: MainAxisSize.max,
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [

//                                   Container(
//                                     decoration: BoxDecoration(
//                                       color: Color(0xFFF6F6F6),
//                                       border:
//                                           Border.all(color: Color(0xFFDBDBDB)),
//                                     ),
//                                     child: Padding(
//                                       padding: EdgeInsetsDirectional.fromSTEB(
//                                           10, 0, 10, 0),
//                                       child: Column(
//                                         mainAxisSize: MainAxisSize.max,
//                                         children: [
//                                           Padding(
//                                             padding:
//                                                 EdgeInsetsDirectional.fromSTEB(
//                                                     0, 10, 0, 10),
//                                             child: Row(
//                                               mainAxisSize: MainAxisSize.max,
//                                               mainAxisAlignment:
//                                                   MainAxisAlignment
//                                                       .spaceBetween,
//                                               children: [
//                                                 Row(
//                                                   mainAxisSize:
//                                                       MainAxisSize.max,
//                                                   crossAxisAlignment:
//                                                       CrossAxisAlignment.start,
//                                                   children: [
//                                                     Container(
//                                                       decoration: BoxDecoration(
//                                                         color:
//                                                             Color(0xFFF2994A),
//                                                       ),
//                                                       child: Padding(
//                                                         padding: EdgeInsets.all(
//                                                             7.33),
//                                                         child: ClipRRect(
//                                                           borderRadius:
//                                                               BorderRadius
//                                                                   .circular(0),
//                                                           child:
//                                                               SvgPicture.asset(
//                                                             'assets/images/fi_4272432_(1).svg',
//                                                             fit: BoxFit.cover,
//                                                           ),
//                                                         ),
//                                                       ),
//                                                     ),
//                                                     Column(
//                                                       mainAxisSize:
//                                                           MainAxisSize.max,
//                                                       crossAxisAlignment:
//                                                           CrossAxisAlignment
//                                                               .start,
//                                                       children: [
//                                                         Text(
//                                                           'Pre-boarding',
//                                                           style: FlutterFlowTheme
//                                                                   .of(context)
//                                                               .bodyMedium
//                                                               .override(
//                                                                 fontFamily:
//                                                                     'DM Sans',
//                                                                 color: Color(
//                                                                     0xFF444444),
//                                                                 fontSize: 18,
//                                                                 letterSpacing:
//                                                                     0.0,
//                                                               ),
//                                                         ),
//                                                         Text(
//                                                           'Date & Time',
//                                                           style: FlutterFlowTheme
//                                                                   .of(context)
//                                                               .bodyMedium
//                                                               .override(
//                                                                 fontFamily:
//                                                                     'DM Sans',
//                                                                 color: Color(
//                                                                     0xFF444444),
//                                                                 fontSize: 12,
//                                                                 letterSpacing:
//                                                                     0.0,
//                                                                 fontWeight:
//                                                                     FontWeight
//                                                                         .w300,
//                                                               ),
//                                                         ),
//                                                       ].divide(
//                                                           SizedBox(height: 4)),
//                                                     ),
//                                                   ].divide(SizedBox(width: 10)),
//                                                 ),
//                                                 FaIcon(
//                                                   FontAwesomeIcons.angleDown,
//                                                   color: FlutterFlowTheme.of(
//                                                           context)
//                                                       .primaryText,
//                                                   size: 24,
//                                                 ),
//                                               ].divide(SizedBox(width: 10)),
//                                             ),
//                                           ),
//                                           Column(
//                                             mainAxisSize: MainAxisSize.max,
//                                             crossAxisAlignment:
//                                                 CrossAxisAlignment.start,
//                                             children: [
//                                               Padding(
//                                                 padding: EdgeInsetsDirectional
//                                                     .fromSTEB(0, 4, 0, 4),
//                                                 child: Row(
//                                                   mainAxisSize:
//                                                       MainAxisSize.max,
//                                                   crossAxisAlignment:
//                                                       CrossAxisAlignment.start,
//                                                   children: [
//                                                     _model.stagesdata![0]
//                                                                     .stage ==
//                                                                 'Pre-boarding' &&
//                                                             _model.stagesdata![0]
//                                                                     .isCompleted ==
//                                                                 true
//                                                         ? Container(
//                                                             decoration:
//                                                                 BoxDecoration(
//                                                               color: FlutterFlowTheme
//                                                                       .of(context)
//                                                                   .secondaryBackground,
//                                                               border:
//                                                                   Border.all(
//                                                                 color: Color(
//                                                                     0xFF27AE60),
//                                                               ),
//                                                             ),
//                                                             child: Padding(
//                                                               padding:
//                                                                   EdgeInsets
//                                                                       .all(
//                                                                           5.33),
//                                                               child: ClipRRect(
//                                                                 borderRadius:
//                                                                     BorderRadius
//                                                                         .circular(
//                                                                             0),
//                                                                 child:
//                                                                     SvgPicture
//                                                                         .asset(
//                                                                   'assets/images/check_1.svg',
//                                                                   fit: BoxFit
//                                                                       .cover,
//                                                                 ),
//                                                               ),
//                                                             ),
//                                                           )
//                                                         : ClipRRect(
//                                                             borderRadius:
//                                                                 BorderRadius
//                                                                     .circular(
//                                                                         0),
//                                                             child: SvgPicture
//                                                                 .asset(
//                                                               'assets/images/Component_24.svg',
//                                                               fit: BoxFit.cover,
//                                                             ),
//                                                           ),
//                                                     Expanded(
//                                                       child: Column(
//                                                         mainAxisSize:
//                                                             MainAxisSize.max,
//                                                         crossAxisAlignment:
//                                                             CrossAxisAlignment
//                                                                 .start,
//                                                         children: [
//                                                           Text(
//                                                             'Customer Login',
//                                                             style: FlutterFlowTheme
//                                                                     .of(context)
//                                                                 .bodyMedium
//                                                                 .override(
//                                                                   fontFamily:
//                                                                       'DM Sans',
//                                                                   color: Color(
//                                                                       0xFF444444),
//                                                                   letterSpacing:
//                                                                       0.0,
//                                                                   fontWeight:
//                                                                       FontWeight
//                                                                           .w300,
//                                                                 ),
//                                                           ),
//                                                           Text(
//                                                             _model
//                                                                         .stagesdata![
//                                                                             0]
//                                                                         .completedAt ==
//                                                                     null
//                                                                 ? '--'
//                                                                 : DateFormat(
//                                                                         "dd MM yyyy hh:mm a")
//                                                                     .format(DateTime.parse(_model
//                                                                             .stagesdata![0]
//                                                                             .completedAt)
//                                                                         .toUtc()),
//                                                             style: FlutterFlowTheme
//                                                                     .of(context)
//                                                                 .bodyMedium
//                                                                 .override(
//                                                                   fontFamily:
//                                                                       'DM Sans',
//                                                                   color: Color(
//                                                                       0xFF444444),
//                                                                   letterSpacing:
//                                                                       0.0,
//                                                                   fontWeight:
//                                                                       FontWeight
//                                                                           .w300,
//                                                                 ),
//                                                           ),
//                                                         ].divide(SizedBox(
//                                                             height: 4)),
//                                                       ),
//                                                     ),
//                                                   ].divide(
//                                                       SizedBox(width: 8.7)),
//                                                 ),
//                                               ),
//                                               ClipRRect(
//                                                 borderRadius:
//                                                     BorderRadius.circular(0),
//                                                 child: Image.asset(
//                                                   'assets/images/Frame_1321314409.png',
//                                                   fit: BoxFit.cover,
//                                                 ),
//                                               ),
//                                               Padding(
//                                                 padding: EdgeInsetsDirectional
//                                                     .fromSTEB(0, 4, 0, 4),
//                                                 child: Row(
//                                                   mainAxisSize:
//                                                       MainAxisSize.max,
//                                                   crossAxisAlignment:
//                                                       CrossAxisAlignment.start,
//                                                   children: [
//                                                     _model.stagesdata![1]
//                                                                     .stage ==
//                                                                 'Pre-boarding' &&
//                                                             _model.stagesdata![1]
//                                                                     .isCompleted ==
//                                                                 true
//                                                         ? Container(
//                                                             decoration:
//                                                                 BoxDecoration(
//                                                               color: FlutterFlowTheme
//                                                                       .of(context)
//                                                                   .secondaryBackground,
//                                                               border:
//                                                                   Border.all(
//                                                                 color: Color(
//                                                                     0xFF27AE60),
//                                                               ),
//                                                             ),
//                                                             child: Padding(
//                                                               padding:
//                                                                   EdgeInsets
//                                                                       .all(
//                                                                           5.33),
//                                                               child: ClipRRect(
//                                                                 borderRadius:
//                                                                     BorderRadius
//                                                                         .circular(
//                                                                             0),
//                                                                 child:
//                                                                     SvgPicture
//                                                                         .asset(
//                                                                   'assets/images/check_1.svg',
//                                                                   fit: BoxFit
//                                                                       .cover,
//                                                                 ),
//                                                               ),
//                                                             ),
//                                                           )
//                                                         : ClipRRect(
//                                                             borderRadius:
//                                                                 BorderRadius
//                                                                     .circular(
//                                                                         0),
//                                                             child: SvgPicture
//                                                                 .asset(
//                                                               'assets/images/Component_24.svg',
//                                                               fit: BoxFit.cover,
//                                                             ),
//                                                           ),
//                                                     Expanded(
//                                                       child: Column(
//                                                         mainAxisSize:
//                                                             MainAxisSize.max,
//                                                         crossAxisAlignment:
//                                                             CrossAxisAlignment
//                                                                 .start,
//                                                         children: [
//                                                           Text(
//                                                             'Case Creation & Approval',
//                                                             style: FlutterFlowTheme
//                                                                     .of(context)
//                                                                 .bodyMedium
//                                                                 .override(
//                                                                   fontFamily:
//                                                                       'DM Sans',
//                                                                   color: Color(
//                                                                       0xFF444444),
//                                                                   letterSpacing:
//                                                                       0.0,
//                                                                   fontWeight:
//                                                                       FontWeight
//                                                                           .w300,
//                                                                 ),
//                                                           ),
//                                                           Text(
//                                                             _model
//                                                                         .stagesdata![
//                                                                             1]
//                                                                         .completedAt ==
//                                                                     null
//                                                                 ? '--'
//                                                                 : DateFormat(
//                                                                         "dd MM yyyy hh:mm a")
//                                                                     .format(DateTime.parse(_model
//                                                                             .stagesdata![1]
//                                                                             .completedAt)
//                                                                         .toUtc()),
//                                                             style: FlutterFlowTheme
//                                                                     .of(context)
//                                                                 .bodyMedium
//                                                                 .override(
//                                                                   fontFamily:
//                                                                       'DM Sans',
//                                                                   color: Color(
//                                                                       0xFF444444),
//                                                                   letterSpacing:
//                                                                       0.0,
//                                                                   fontWeight:
//                                                                       FontWeight
//                                                                           .w300,
//                                                                 ),
//                                                           ),
//                                                         ].divide(SizedBox(
//                                                             height: 4)),
//                                                       ),
//                                                     ),
//                                                   ].divide(
//                                                       SizedBox(width: 8.7)),
//                                                 ),
//                                               ),
//                                               ClipRRect(
//                                                 borderRadius:
//                                                     BorderRadius.circular(0),
//                                                 child: Image.asset(
//                                                   'assets/images/Frame_1321314409.png',
//                                                   fit: BoxFit.cover,
//                                                 ),
//                                               ),
//                                               Container(
//                                                 child: Padding(
//                                                   padding: EdgeInsetsDirectional
//                                                       .fromSTEB(6, 4, 6, 4),
//                                                   child: Row(
//                                                     mainAxisSize:
//                                                         MainAxisSize.max,
//                                                     children: [
//                                                       _model.stagesdata![2]
//                                                                       .stage ==
//                                                                   'Pre-boarding' &&
//                                                               _model.stagesdata![2]
//                                                                       .isCompleted ==
//                                                                   true
//                                                           ? Container(
//                                                               decoration:
//                                                                   BoxDecoration(
//                                                                 color: FlutterFlowTheme.of(
//                                                                         context)
//                                                                     .secondaryBackground,
//                                                                 border:
//                                                                     Border.all(
//                                                                   color: Color(
//                                                                       0xFF27AE60),
//                                                                 ),
//                                                               ),
//                                                               child: Padding(
//                                                                 padding:
//                                                                     EdgeInsets
//                                                                         .all(
//                                                                             5.33),
//                                                                 child:
//                                                                     ClipRRect(
//                                                                   borderRadius:
//                                                                       BorderRadius
//                                                                           .circular(
//                                                                               0),
//                                                                   child:
//                                                                       SvgPicture
//                                                                           .asset(
//                                                                     'assets/images/check_1.svg',
//                                                                     fit: BoxFit
//                                                                         .cover,
//                                                                   ),
//                                                                 ),
//                                                               ),
//                                                             )
//                                                           : ClipRRect(
//                                                               borderRadius:
//                                                                   BorderRadius
//                                                                       .circular(
//                                                                           0),
//                                                               child: SvgPicture
//                                                                   .asset(
//                                                                 'assets/images/Component_24.svg',
//                                                                 fit: BoxFit
//                                                                     .cover,
//                                                               ),
//                                                             ),
//                                                       Expanded(
//                                                         child: Column(
//                                                           mainAxisSize:
//                                                               MainAxisSize.max,
//                                                           crossAxisAlignment:
//                                                               CrossAxisAlignment
//                                                                   .start,
//                                                           children: [
//                                                             Text(
//                                                               'Full Profile Capture',
//                                                               style: FlutterFlowTheme
//                                                                       .of(context)
//                                                                   .bodyMedium
//                                                                   .override(
//                                                                     fontFamily:
//                                                                         'DM Sans',
//                                                                     color: Color(
//                                                                         0xFF444444),
//                                                                     letterSpacing:
//                                                                         0.0,
//                                                                     fontWeight:
//                                                                         FontWeight
//                                                                             .w300,
//                                                                   ),
//                                                             ),
//                                                             Text(
//                                                               _model
//                                                                           .stagesdata![
//                                                                               2]
//                                                                           .completedAt ==
//                                                                       null
//                                                                   ? '--'
//                                                                   : DateFormat(
//                                                                           "dd MM yyyy hh:mm a")
//                                                                       .format(DateTime.parse(_model
//                                                                               .stagesdata![2]
//                                                                               .completedAt)
//                                                                           .toUtc()),
//                                                               style: FlutterFlowTheme
//                                                                       .of(context)
//                                                                   .bodyMedium
//                                                                   .override(
//                                                                     fontFamily:
//                                                                         'DM Sans',
//                                                                     color: Color(
//                                                                         0xFF444444),
//                                                                     letterSpacing:
//                                                                         0.0,
//                                                                     fontWeight:
//                                                                         FontWeight
//                                                                             .w300,
//                                                                   ),
//                                                             ),
//                                                           ].divide(SizedBox(
//                                                               height: 4)),
//                                                         ),
//                                                       ),
//                                                     ].divide(
//                                                         SizedBox(width: 8.7)),
//                                                   ),
//                                                 ),
//                                               ),
//                                               ClipRRect(
//                                                 borderRadius:
//                                                     BorderRadius.circular(0),
//                                                 child: Image.asset(
//                                                   'assets/images/Frame_1321314424.png',
//                                                   fit: BoxFit.cover,
//                                                 ),
//                                               ),
//                                               Container(
//                                                 decoration: BoxDecoration(),
//                                                 child: Padding(
//                                                   padding: EdgeInsetsDirectional
//                                                       .fromSTEB(6, 4, 6, 4),
//                                                   child: Row(
//                                                     mainAxisSize:
//                                                         MainAxisSize.max,
//                                                     children: [
//                                                       _model.stagesdata![3]
//                                                                       .stage ==
//                                                                   'Pre-boarding' &&
//                                                               _model.stagesdata![3]
//                                                                       .isCompleted ==
//                                                                   true
//                                                           ? Container(
//                                                               decoration:
//                                                                   BoxDecoration(
//                                                                 color: FlutterFlowTheme.of(
//                                                                         context)
//                                                                     .secondaryBackground,
//                                                                 border:
//                                                                     Border.all(
//                                                                   color: Color(
//                                                                       0xFF27AE60),
//                                                                 ),
//                                                               ),
//                                                               child: Padding(
//                                                                 padding:
//                                                                     EdgeInsets
//                                                                         .all(
//                                                                             5.33),
//                                                                 child:
//                                                                     ClipRRect(
//                                                                   borderRadius:
//                                                                       BorderRadius
//                                                                           .circular(
//                                                                               0),
//                                                                   child:
//                                                                       SvgPicture
//                                                                           .asset(
//                                                                     'assets/images/check_1.svg',
//                                                                     fit: BoxFit
//                                                                         .cover,
//                                                                   ),
//                                                                 ),
//                                                               ),
//                                                             )
//                                                           : ClipRRect(
//                                                               borderRadius:
//                                                                   BorderRadius
//                                                                       .circular(
//                                                                           0),
//                                                               child: SvgPicture
//                                                                   .asset(
//                                                                 'assets/images/fi_833602.svg',
//                                                                 fit: BoxFit
//                                                                     .cover,
//                                                               ),
//                                                             ),
//                                                       Expanded(
//                                                         child: Column(
//                                                           mainAxisSize:
//                                                               MainAxisSize.max,
//                                                           crossAxisAlignment:
//                                                               CrossAxisAlignment
//                                                                   .start,
//                                                           children: [
//                                                             Text(
//                                                               'On-boarding brief and sign-off"',
//                                                               style: FlutterFlowTheme
//                                                                       .of(context)
//                                                                   .bodyMedium
//                                                                   .override(
//                                                                     fontFamily:
//                                                                         'DM Sans',
//                                                                     color: Color(
//                                                                         0xFF444444),
//                                                                     letterSpacing:
//                                                                         0.0,
//                                                                     fontWeight:
//                                                                         FontWeight
//                                                                             .w300,
//                                                                   ),
//                                                             ),
//                                                             Text(
//                                                               _model
//                                                                           .stagesdata![
//                                                                               3]
//                                                                           .completedAt ==
//                                                                       null
//                                                                   ? '--'
//                                                                   : DateFormat(
//                                                                           "dd MM yyyy hh:mm a")
//                                                                       .format(DateTime.parse(_model
//                                                                               .stagesdata![3]
//                                                                               .completedAt)
//                                                                           .toUtc()),
//                                                               style: FlutterFlowTheme
//                                                                       .of(context)
//                                                                   .bodyMedium
//                                                                   .override(
//                                                                     fontFamily:
//                                                                         'DM Sans',
//                                                                     color: Color(
//                                                                         0xFF444444),
//                                                                     letterSpacing:
//                                                                         0.0,
//                                                                     fontWeight:
//                                                                         FontWeight
//                                                                             .w300,
//                                                                   ),
//                                                             ),
//                                                           ].divide(SizedBox(
//                                                               height: 4)),
//                                                         ),
//                                                       ),
//                                                     ].divide(
//                                                         SizedBox(width: 8.7)),
//                                                   ),
//                                                 ),
//                                               ),
//                                             ],
//                                           ),
//                                         ].divide(SizedBox(height: 12)),
//                                       ),
//                                     ),
//                                   ),
//                                   ClipRRect(
//                                     borderRadius: BorderRadius.circular(0),
//                                     child: Image.asset(
//                                       'assets/images/Frame_1321314409_(1).png',
//                                       fit: BoxFit.cover,
//                                     ),
//                                   ),
//                                   Container(
//                                     decoration: BoxDecoration(
//                                       color: Color(0xFFF6F6F6),
//                                       border:
//                                           Border.all(color: Color(0xFFDBDBDB)),
//                                     ),
//                                     child: Padding(
//                                       padding: EdgeInsetsDirectional.fromSTEB(
//                                           10, 0, 10, 0),
//                                       child: Column(
//                                         mainAxisSize: MainAxisSize.max,
//                                         children: [
//                                           Padding(
//                                             padding:
//                                                 EdgeInsetsDirectional.fromSTEB(
//                                                     0, 10, 0, 10),
//                                             child: Row(
//                                               mainAxisSize: MainAxisSize.max,
//                                               mainAxisAlignment:
//                                                   MainAxisAlignment
//                                                       .spaceBetween,
//                                               children: [
//                                                 Row(
//                                                   mainAxisSize:
//                                                       MainAxisSize.max,
//                                                   crossAxisAlignment:
//                                                       CrossAxisAlignment.start,
//                                                   children: [
//                                                     Container(
//                                                       decoration: BoxDecoration(
//                                                         color:
//                                                             Color(0xFFF2994A),
//                                                       ),
//                                                       child: Padding(
//                                                         padding: EdgeInsets.all(
//                                                             7.33),
//                                                         child: ClipRRect(
//                                                           borderRadius:
//                                                               BorderRadius
//                                                                   .circular(0),
//                                                           child:
//                                                               SvgPicture.asset(
//                                                             'assets/images/Component_3.svg',
//                                                             fit: BoxFit.cover,
//                                                           ),
//                                                         ),
//                                                       ),
//                                                     ),
//                                                     Column(
//                                                       mainAxisSize:
//                                                           MainAxisSize.max,
//                                                       crossAxisAlignment:
//                                                           CrossAxisAlignment
//                                                               .start,
//                                                       children: [
//                                                         Text(
//                                                           'On-boarding',
//                                                           style: FlutterFlowTheme
//                                                                   .of(context)
//                                                               .bodyMedium
//                                                               .override(
//                                                                 fontFamily:
//                                                                     'DM Sans',
//                                                                 color: Color(
//                                                                     0xFF444444),
//                                                                 fontSize: 18,
//                                                                 letterSpacing:
//                                                                     0.0,
//                                                               ),
//                                                         ),
//                                                         Text(
//                                                           'Date & Time',
//                                                           style: FlutterFlowTheme
//                                                                   .of(context)
//                                                               .bodyMedium
//                                                               .override(
//                                                                 fontFamily:
//                                                                     'DM Sans',
//                                                                 color: Color(
//                                                                     0xFF444444),
//                                                                 fontSize: 12,
//                                                                 letterSpacing:
//                                                                     0.0,
//                                                                 fontWeight:
//                                                                     FontWeight
//                                                                         .w300,
//                                                               ),
//                                                         ),
//                                                       ].divide(
//                                                           SizedBox(height: 4)),
//                                                     ),
//                                                   ].divide(SizedBox(width: 10)),
//                                                 ),
//                                                 FaIcon(
//                                                   FontAwesomeIcons.angleDown,
//                                                   color: FlutterFlowTheme.of(
//                                                           context)
//                                                       .primaryText,
//                                                   size: 24,
//                                                 ),
//                                               ].divide(SizedBox(width: 10)),
//                                             ),
//                                           ),
//                                           Column(
//                                             mainAxisSize: MainAxisSize.max,
//                                             crossAxisAlignment:
//                                                 CrossAxisAlignment.start,
//                                             children: [
//                                               Padding(
//                                                 padding: EdgeInsetsDirectional
//                                                     .fromSTEB(0, 4, 0, 4),
//                                                 child: Row(
//                                                   mainAxisSize:
//                                                       MainAxisSize.max,
//                                                   crossAxisAlignment:
//                                                       CrossAxisAlignment.start,
//                                                   children: [
//                                                     _model.stagesdata![4]
//                                                                     .stage ==
//                                                                 'On-boarding' &&
//                                                             _model.stagesdata![4]
//                                                                     .isCompleted ==
//                                                                 true
//                                                         ? Container(
//                                                             decoration:
//                                                                 BoxDecoration(
//                                                               color: FlutterFlowTheme
//                                                                       .of(context)
//                                                                   .secondaryBackground,
//                                                               border:
//                                                                   Border.all(
//                                                                 color: Color(
//                                                                     0xFF27AE60),
//                                                               ),
//                                                             ),
//                                                             child: Padding(
//                                                               padding:
//                                                                   EdgeInsets
//                                                                       .all(
//                                                                           5.33),
//                                                               child: ClipRRect(
//                                                                 borderRadius:
//                                                                     BorderRadius
//                                                                         .circular(
//                                                                             0),
//                                                                 child:
//                                                                     SvgPicture
//                                                                         .asset(
//                                                                   'assets/images/check_1.svg',
//                                                                   fit: BoxFit
//                                                                       .cover,
//                                                                 ),
//                                                               ),
//                                                             ),
//                                                           )
//                                                         : ClipRRect(
//                                                             borderRadius:
//                                                                 BorderRadius
//                                                                     .circular(
//                                                                         0),
//                                                             child: SvgPicture
//                                                                 .asset(
//                                                               'assets/images/fi_833602.svg',
//                                                               fit: BoxFit.cover,
//                                                             ),
//                                                           ),
//                                                     Expanded(
//                                                       child: Column(
//                                                         mainAxisSize:
//                                                             MainAxisSize.max,
//                                                         crossAxisAlignment:
//                                                             CrossAxisAlignment
//                                                                 .start,
//                                                         children: [
//                                                           Text(
//                                                             'KYC Verification',
//                                                             style: FlutterFlowTheme
//                                                                     .of(context)
//                                                                 .bodyMedium
//                                                                 .override(
//                                                                   fontFamily:
//                                                                       'DM Sans',
//                                                                   color: Color(
//                                                                       0xFF444444),
//                                                                   letterSpacing:
//                                                                       0.0,
//                                                                   fontWeight:
//                                                                       FontWeight
//                                                                           .w300,
//                                                                 ),
//                                                           ),
//                                                           Text(
//                                                             _model
//                                                                         .stagesdata![
//                                                                             4]
//                                                                         .completedAt ==
//                                                                     null
//                                                                 ? '--'
//                                                                 : DateFormat(
//                                                                         "dd MM yyyy hh:mm a")
//                                                                     .format(DateTime.parse(_model
//                                                                             .stagesdata![4]
//                                                                             .completedAt)
//                                                                         .toUtc()),
//                                                             style: FlutterFlowTheme
//                                                                     .of(context)
//                                                                 .bodyMedium
//                                                                 .override(
//                                                                   fontFamily:
//                                                                       'DM Sans',
//                                                                   color: Color(
//                                                                       0xFF444444),
//                                                                   letterSpacing:
//                                                                       0.0,
//                                                                   fontWeight:
//                                                                       FontWeight
//                                                                           .w300,
//                                                                 ),
//                                                           ),
//                                                         ].divide(SizedBox(
//                                                             height: 4)),
//                                                       ),
//                                                     ),
//                                                   ].divide(
//                                                       SizedBox(width: 8.7)),
//                                                 ),
//                                               ),
//                                               ClipRRect(
//                                                 borderRadius:
//                                                     BorderRadius.circular(0),
//                                                 child: Image.asset(
//                                                   'assets/images/Frame_1321314409.png',
//                                                   fit: BoxFit.cover,
//                                                 ),
//                                               ),
//                                               Padding(
//                                                 padding: EdgeInsetsDirectional
//                                                     .fromSTEB(0, 4, 0, 4),
//                                                 child: Row(
//                                                   mainAxisSize:
//                                                       MainAxisSize.max,
//                                                   crossAxisAlignment:
//                                                       CrossAxisAlignment.start,
//                                                   children: [
//                                                     _model.stagesdata![5]
//                                                                     .stage ==
//                                                                 'On-boarding' &&
//                                                             _model.stagesdata![5]
//                                                                     .isCompleted ==
//                                                                 true
//                                                         ? Container(
//                                                             decoration:
//                                                                 BoxDecoration(
//                                                               color: FlutterFlowTheme
//                                                                       .of(context)
//                                                                   .secondaryBackground,
//                                                               border:
//                                                                   Border.all(
//                                                                 color: Color(
//                                                                     0xFF27AE60),
//                                                               ),
//                                                             ),
//                                                             child: Padding(
//                                                               padding:
//                                                                   EdgeInsets
//                                                                       .all(
//                                                                           5.33),
//                                                               child: ClipRRect(
//                                                                 borderRadius:
//                                                                     BorderRadius
//                                                                         .circular(
//                                                                             0),
//                                                                 child:
//                                                                     SvgPicture
//                                                                         .asset(
//                                                                   'assets/images/check_1.svg',
//                                                                   fit: BoxFit
//                                                                       .cover,
//                                                                 ),
//                                                               ),
//                                                             ),
//                                                           )
//                                                         : ClipRRect(
//                                                             borderRadius:
//                                                                 BorderRadius
//                                                                     .circular(
//                                                                         0),
//                                                             child: SvgPicture
//                                                                 .asset(
//                                                               'assets/images/fi_833602.svg',
//                                                               fit: BoxFit.cover,
//                                                             ),
//                                                           ),
//                                                     Expanded(
//                                                       child: Column(
//                                                         mainAxisSize:
//                                                             MainAxisSize.max,
//                                                         crossAxisAlignment:
//                                                             CrossAxisAlignment
//                                                                 .start,
//                                                         children: [
//                                                           Text(
//                                                             'Case ID assigning',
//                                                             style: FlutterFlowTheme
//                                                                     .of(context)
//                                                                 .bodyMedium
//                                                                 .override(
//                                                                   fontFamily:
//                                                                       'DM Sans',
//                                                                   color: Color(
//                                                                       0xFF444444),
//                                                                   letterSpacing:
//                                                                       0.0,
//                                                                   fontWeight:
//                                                                       FontWeight
//                                                                           .w300,
//                                                                 ),
//                                                           ),
//                                                           Text(
//                                                             _model
//                                                                         .stagesdata![
//                                                                             5]
//                                                                         .completedAt ==
//                                                                     null
//                                                                 ? '--'
//                                                                 : DateFormat(
//                                                                         "dd MM yyyy hh:mm a")
//                                                                     .format(DateTime.parse(_model
//                                                                             .stagesdata![5]
//                                                                             .completedAt)
//                                                                         .toUtc()),
//                                                             style: FlutterFlowTheme
//                                                                     .of(context)
//                                                                 .bodyMedium
//                                                                 .override(
//                                                                   fontFamily:
//                                                                       'DM Sans',
//                                                                   color: Color(
//                                                                       0xFF444444),
//                                                                   letterSpacing:
//                                                                       0.0,
//                                                                   fontWeight:
//                                                                       FontWeight
//                                                                           .w300,
//                                                                 ),
//                                                           ),
//                                                         ].divide(SizedBox(
//                                                             height: 4)),
//                                                       ),
//                                                     ),
//                                                   ].divide(
//                                                       SizedBox(width: 8.7)),
//                                                 ),
//                                               ),
//                                               ClipRRect(
//                                                 borderRadius:
//                                                     BorderRadius.circular(0),
//                                                 child: Image.asset(
//                                                   'assets/images/Frame_1321314424.png',
//                                                   fit: BoxFit.cover,
//                                                 ),
//                                               ),
//                                               Container(
//                                                 decoration: BoxDecoration(),
//                                                 child: Padding(
//                                                   padding: EdgeInsetsDirectional
//                                                       .fromSTEB(6, 4, 6, 4),
//                                                   child: Row(
//                                                     mainAxisSize:
//                                                         MainAxisSize.max,
//                                                     children: [
//                                                       _model.stagesdata![6]
//                                                                       .stage ==
//                                                                   'Pre-boarding' &&
//                                                               _model.stagesdata![6]
//                                                                       .isCompleted ==
//                                                                   true
//                                                           ? Container(
//                                                               decoration:
//                                                                   BoxDecoration(
//                                                                 color: FlutterFlowTheme.of(
//                                                                         context)
//                                                                     .secondaryBackground,
//                                                                 border:
//                                                                     Border.all(
//                                                                   color: Color(
//                                                                       0xFF27AE60),
//                                                                 ),
//                                                               ),
//                                                               child: Padding(
//                                                                 padding:
//                                                                     EdgeInsets
//                                                                         .all(
//                                                                             5.33),
//                                                                 child:
//                                                                     ClipRRect(
//                                                                   borderRadius:
//                                                                       BorderRadius
//                                                                           .circular(
//                                                                               0),
//                                                                   child:
//                                                                       SvgPicture
//                                                                           .asset(
//                                                                     'assets/images/check_1.svg',
//                                                                     fit: BoxFit
//                                                                         .cover,
//                                                                   ),
//                                                                 ),
//                                                               ),
//                                                             )
//                                                           : ClipRRect(
//                                                               borderRadius:
//                                                                   BorderRadius
//                                                                       .circular(
//                                                                           0),
//                                                               child: SvgPicture
//                                                                   .asset(
//                                                                 'assets/images/fi_833602.svg',
//                                                                 fit: BoxFit
//                                                                     .cover,
//                                                               ),
//                                                             ),
//                                                       Expanded(
//                                                         child: Column(
//                                                           mainAxisSize:
//                                                               MainAxisSize.max,
//                                                           crossAxisAlignment:
//                                                               CrossAxisAlignment
//                                                                   .start,
//                                                           children: [
//                                                             Text(
//                                                               'Assigning of Advocate & Approval',
//                                                               style: FlutterFlowTheme
//                                                                       .of(context)
//                                                                   .bodyMedium
//                                                                   .override(
//                                                                     fontFamily:
//                                                                         'DM Sans',
//                                                                     color: Color(
//                                                                         0xFF444444),
//                                                                     letterSpacing:
//                                                                         0.0,
//                                                                     fontWeight:
//                                                                         FontWeight
//                                                                             .w300,
//                                                                   ),
//                                                             ),
//                                                             Text(
//                                                               _model
//                                                                           .stagesdata![
//                                                                               6]
//                                                                           .completedAt ==
//                                                                       null
//                                                                   ? '--'
//                                                                   : DateFormat(
//                                                                           "dd MM yyyy hh:mm a")
//                                                                       .format(DateTime.parse(_model
//                                                                               .stagesdata![6]
//                                                                               .completedAt)
//                                                                           .toUtc()),
//                                                               style: FlutterFlowTheme
//                                                                       .of(context)
//                                                                   .bodyMedium
//                                                                   .override(
//                                                                     fontFamily:
//                                                                         'DM Sans',
//                                                                     color: Color(
//                                                                         0xFF444444),
//                                                                     letterSpacing:
//                                                                         0.0,
//                                                                     fontWeight:
//                                                                         FontWeight
//                                                                             .w300,
//                                                                   ),
//                                                             ),
//                                                           ].divide(SizedBox(
//                                                               height: 4)),
//                                                         ),
//                                                       ),
//                                                     ].divide(
//                                                         SizedBox(width: 8.7)),
//                                                   ),
//                                                 ),
//                                               ),
//                                               ClipRRect(
//                                                 borderRadius:
//                                                     BorderRadius.circular(0),
//                                                 child: Image.asset(
//                                                   'assets/images/Frame_1321314424.png',
//                                                   fit: BoxFit.cover,
//                                                 ),
//                                               ),
//                                               Container(
//                                                 decoration: BoxDecoration(),
//                                                 child: Padding(
//                                                   padding: EdgeInsetsDirectional
//                                                       .fromSTEB(6, 4, 6, 4),
//                                                   child: Row(
//                                                     mainAxisSize:
//                                                         MainAxisSize.max,
//                                                     children: [
//                                                       _model.stagesdata![7]
//                                                                       .stage ==
//                                                                   'Pre-boarding' &&
//                                                               _model.stagesdata![7]
//                                                                       .isCompleted ==
//                                                                   true
//                                                           ? Container(
//                                                               decoration:
//                                                                   BoxDecoration(
//                                                                 color: FlutterFlowTheme.of(
//                                                                         context)
//                                                                     .secondaryBackground,
//                                                                 border:
//                                                                     Border.all(
//                                                                   color: Color(
//                                                                       0xFF27AE60),
//                                                                 ),
//                                                               ),
//                                                               child: Padding(
//                                                                 padding:
//                                                                     EdgeInsets
//                                                                         .all(
//                                                                             5.33),
//                                                                 child:
//                                                                     ClipRRect(
//                                                                   borderRadius:
//                                                                       BorderRadius
//                                                                           .circular(
//                                                                               0),
//                                                                   child:
//                                                                       SvgPicture
//                                                                           .asset(
//                                                                     'assets/images/check_1.svg',
//                                                                     fit: BoxFit
//                                                                         .cover,
//                                                                   ),
//                                                                 ),
//                                                               ),
//                                                             )
//                                                           : ClipRRect(
//                                                               borderRadius:
//                                                                   BorderRadius
//                                                                       .circular(
//                                                                           0),
//                                                               child: SvgPicture
//                                                                   .asset(
//                                                                 'assets/images/fi_833602.svg',
//                                                                 fit: BoxFit
//                                                                     .cover,
//                                                               ),
//                                                             ),
//                                                       Expanded(
//                                                         child: Column(
//                                                           mainAxisSize:
//                                                               MainAxisSize.max,
//                                                           crossAxisAlignment:
//                                                               CrossAxisAlignment
//                                                                   .start,
//                                                           children: [
//                                                             Text(
//                                                               'VakalatNama signing',
//                                                               style: FlutterFlowTheme
//                                                                       .of(context)
//                                                                   .bodyMedium
//                                                                   .override(
//                                                                     fontFamily:
//                                                                         'DM Sans',
//                                                                     color: Color(
//                                                                         0xFF444444),
//                                                                     letterSpacing:
//                                                                         0.0,
//                                                                     fontWeight:
//                                                                         FontWeight
//                                                                             .w300,
//                                                                   ),
//                                                             ),
//                                                             Text(
//                                                               _model
//                                                                           .stagesdata![
//                                                                               7]
//                                                                           .completedAt ==
//                                                                       null
//                                                                   ? '--'
//                                                                   : DateFormat(
//                                                                           "dd MM yyyy hh:mm a")
//                                                                       .format(DateTime.parse(_model
//                                                                               .stagesdata![7]
//                                                                               .completedAt)
//                                                                           .toUtc()),
//                                                               style: FlutterFlowTheme
//                                                                       .of(context)
//                                                                   .bodyMedium
//                                                                   .override(
//                                                                     fontFamily:
//                                                                         'DM Sans',
//                                                                     color: Color(
//                                                                         0xFF444444),
//                                                                     letterSpacing:
//                                                                         0.0,
//                                                                     fontWeight:
//                                                                         FontWeight
//                                                                             .w300,
//                                                                   ),
//                                                             ),
//                                                           ].divide(SizedBox(
//                                                               height: 4)),
//                                                         ),
//                                                       ),
//                                                     ].divide(
//                                                         SizedBox(width: 8.7)),
//                                                   ),
//                                                 ),
//                                               ),
//                                             ],
//                                           ),
//                                         ].divide(SizedBox(height: 12)),
//                                       ),
//                                     ),
//                                   ),
//                                   ClipRRect(
//                                     borderRadius: BorderRadius.circular(0),
//                                     child: Image.asset(
//                                       'assets/images/Frame_1321314410.png',
//                                       fit: BoxFit.cover,
//                                     ),
//                                   ),
//                                   Container(
//                                     decoration: BoxDecoration(
//                                       border: Border.all(
//                                         color: Color(0xFFDBDBDB),
//                                       ),
//                                     ),
//                                     child: Padding(
//                                       padding: EdgeInsets.all(10),
//                                       child: Row(
//                                         mainAxisSize: MainAxisSize.max,
//                                         children: [
//                                           Container(
//                                             decoration: BoxDecoration(
//                                               color:
//                                                   FlutterFlowTheme.of(context)
//                                                       .secondaryBackground,
//                                               boxShadow: [
//                                                 BoxShadow(
//                                                   blurRadius: 4,
//                                                   color: Color(0x33000000),
//                                                   offset: Offset(
//                                                     0,
//                                                     2,
//                                                   ),
//                                                 )
//                                               ],
//                                             ),
//                                             child: Padding(
//                                               padding: EdgeInsets.all(7.33),
//                                               child: ClipRRect(
//                                                 borderRadius:
//                                                     BorderRadius.circular(0),
//                                                 child: SvgPicture.asset(
//                                                   'assets/images/Group.svg',
//                                                   fit: BoxFit.cover,
//                                                 ),
//                                               ),
//                                             ),
//                                           ),
//                                           Expanded(
//                                             child: Text(
//                                               'Case Filing',
//                                               style: FlutterFlowTheme.of(
//                                                       context)
//                                                   .bodyMedium
//                                                   .override(
//                                                     fontFamily: 'DM Sans',
//                                                     color: Color(0xFF444444),
//                                                     fontSize: 18,
//                                                     letterSpacing: 0.0,
//                                                     fontWeight: FontWeight.w500,
//                                                   ),
//                                             ),
//                                           ),
//                                           FaIcon(
//                                             FontAwesomeIcons.angleUp,
//                                             color: Colors.black,
//                                             size: 24,
//                                           ),
//                                         ].divide(SizedBox(width: 10)),
//                                       ),
//                                     ),
//                                   ),
//                                   ClipRRect(
//                                     borderRadius: BorderRadius.circular(0),
//                                     child: Image.asset(
//                                       'assets/images/Frame_1321314410.png',
//                                       fit: BoxFit.cover,
//                                     ),
//                                   ),
//                                   Container(
//                                     decoration: BoxDecoration(
//                                       border: Border.all(
//                                         color: Color(0xFFDBDBDB),
//                                       ),
//                                     ),
//                                     child: Padding(
//                                       padding: EdgeInsets.all(10),
//                                       child: Row(
//                                         mainAxisSize: MainAxisSize.max,
//                                         children: [
//                                           Container(
//                                             decoration: BoxDecoration(
//                                               color:
//                                                   FlutterFlowTheme.of(context)
//                                                       .secondaryBackground,
//                                               boxShadow: [
//                                                 BoxShadow(
//                                                   blurRadius: 4,
//                                                   color: Color(0x33000000),
//                                                   offset: Offset(
//                                                     0,
//                                                     2,
//                                                   ),
//                                                 )
//                                               ],
//                                             ),
//                                             child: Padding(
//                                               padding: EdgeInsets.all(7.33),
//                                               child: ClipRRect(
//                                                 borderRadius:
//                                                     BorderRadius.circular(0),
//                                                 child: SvgPicture.asset(
//                                                   'assets/images/Component_3_(1).svg',
//                                                   fit: BoxFit.cover,
//                                                 ),
//                                               ),
//                                             ),
//                                           ),
//                                           Expanded(
//                                             child: Text(
//                                               'Court proceedings',
//                                               style: FlutterFlowTheme.of(
//                                                       context)
//                                                   .bodyMedium
//                                                   .override(
//                                                     fontFamily: 'DM Sans',
//                                                     color: Color(0xFF444444),
//                                                     fontSize: 18,
//                                                     letterSpacing: 0.0,
//                                                     fontWeight: FontWeight.w500,
//                                                   ),
//                                             ),
//                                           ),
//                                           FaIcon(
//                                             FontAwesomeIcons.angleUp,
//                                             color: Colors.black,
//                                             size: 24,
//                                           ),
//                                         ].divide(SizedBox(width: 10)),
//                                       ),
//                                     ),
//                                   ),
//                                   ClipRRect(
//                                     borderRadius: BorderRadius.circular(0),
//                                     child: Image.asset(
//                                       'assets/images/Frame_1321314410.png',
//                                       fit: BoxFit.cover,
//                                     ),
//                                   ),
//                                   Container(
//                                     decoration: BoxDecoration(
//                                       border: Border.all(
//                                         color: Color(0xFFDBDBDB),
//                                       ),
//                                     ),
//                                     child: Padding(
//                                       padding: EdgeInsets.all(10),
//                                       child: Row(
//                                         mainAxisSize: MainAxisSize.max,
//                                         children: [
//                                           Container(
//                                             decoration: BoxDecoration(
//                                               color:
//                                                   FlutterFlowTheme.of(context)
//                                                       .secondaryBackground,
//                                               boxShadow: [
//                                                 BoxShadow(
//                                                   blurRadius: 4,
//                                                   color: Color(0x33000000),
//                                                   offset: Offset(
//                                                     0,
//                                                     2,
//                                                   ),
//                                                 )
//                                               ],
//                                             ),
//                                             child: Padding(
//                                               padding: EdgeInsets.all(7.33),
//                                               child: ClipRRect(
//                                                 borderRadius:
//                                                     BorderRadius.circular(0),
//                                                 child: SvgPicture.asset(
//                                                   'assets/images/Group_(1).svg',
//                                                   fit: BoxFit.cover,
//                                                 ),
//                                               ),
//                                             ),
//                                           ),
//                                           Expanded(
//                                             child: Text(
//                                               'Trail Phase',
//                                               style: FlutterFlowTheme.of(
//                                                       context)
//                                                   .bodyMedium
//                                                   .override(
//                                                     fontFamily: 'DM Sans',
//                                                     color: Color(0xFF444444),
//                                                     fontSize: 18,
//                                                     letterSpacing: 0.0,
//                                                     fontWeight: FontWeight.w500,
//                                                   ),
//                                             ),
//                                           ),
//                                           FaIcon(
//                                             FontAwesomeIcons.angleUp,
//                                             color: Colors.black,
//                                             size: 24,
//                                           ),
//                                         ].divide(SizedBox(width: 10)),
//                                       ),
//                                     ),
//                                   ),
//                                   ClipRRect(
//                                     borderRadius: BorderRadius.circular(0),
//                                     child: Image.asset(
//                                       'assets/images/Frame_1321314410.png',
//                                       fit: BoxFit.cover,
//                                     ),
//                                   ),
//                                   Container(
//                                     decoration: BoxDecoration(
//                                       border: Border.all(
//                                         color: Color(0xFFDBDBDB),
//                                       ),
//                                     ),
//                                     child: Padding(
//                                       padding: EdgeInsets.all(10),
//                                       child: Row(
//                                         mainAxisSize: MainAxisSize.max,
//                                         children: [
//                                           Container(
//                                             decoration: BoxDecoration(
//                                               color:
//                                                   FlutterFlowTheme.of(context)
//                                                       .secondaryBackground,
//                                               boxShadow: [
//                                                 BoxShadow(
//                                                   blurRadius: 4,
//                                                   color: Color(0x33000000),
//                                                   offset: Offset(
//                                                     0,
//                                                     2,
//                                                   ),
//                                                 )
//                                               ],
//                                             ),
//                                             child: Padding(
//                                               padding: EdgeInsets.all(7.33),
//                                               child: ClipRRect(
//                                                 borderRadius:
//                                                     BorderRadius.circular(0),
//                                                 child: SvgPicture.asset(
//                                                   'assets/images/Case_Closure.svg',
//                                                   fit: BoxFit.cover,
//                                                 ),
//                                               ),
//                                             ),
//                                           ),
//                                           Expanded(
//                                             child: Text(
//                                               'Case Closure',
//                                               style: FlutterFlowTheme.of(
//                                                       context)
//                                                   .bodyMedium
//                                                   .override(
//                                                     fontFamily: 'DM Sans',
//                                                     color: Color(0xFF444444),
//                                                     fontSize: 18,
//                                                     letterSpacing: 0.0,
//                                                     fontWeight: FontWeight.w500,
//                                                   ),
//                                             ),
//                                           ),
//                                           FaIcon(
//                                             FontAwesomeIcons.angleUp,
//                                             color: Colors.black,
//                                             size: 24,
//                                           ),
//                                         ].divide(SizedBox(width: 10)),
//                                       ),
//                                     ),
//                                   ),
//                                 ],
//                               );
//                             }
//                           })),
//                 ),
//               ].divide(SizedBox(height: 24)).addToEnd(SizedBox(height: 40)),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lottie/lottie.dart';
import 'package:nyaya_tech/backend/api_manager.dart';
import 'package:nyaya_tech/data_components/get_routing.dart';
import 'package:nyaya_tech/pages/login_page/stages_screen/stage_screen_model.dart';

import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class StatusProductsWidget extends StatefulWidget {
  const StatusProductsWidget({super.key});

  @override
  State<StatusProductsWidget> createState() => _StatusProductsWidgetState();
}

class _StatusProductsWidgetState extends State<StatusProductsWidget> {
  late StatusProductsModel _model;
  late Future<void> _future;
  bool preBoardingisUp = false;
  bool onBoardingisUp = false;
  bool caseFilingisUp = false;
  bool courtProceedingsisUp = false;
  bool trailPhaseisUp = false;
  bool caseClosureisUp = false;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => StatusProductsModel());
    _future = fetchData();
  }

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }

  Future<void> fetchData() async {
    await _model.fetchCaseStage();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        body: SafeArea(
            top: true,
            child: 
                Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            border: Border.all(
                              color: FlutterFlowTheme.of(context).primaryText,
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(8),
                            child: InkWell(
                              onTap: () {
                                Get.offNamed(Routes.viewcase);
                              },
                              child: Icon(
                                Icons.arrow_back,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 24,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                        child: FutureBuilder(
                            future: _future,
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return Padding(
                                  padding: const EdgeInsets.only(top: 200),
                                  child: Center(
                                      child: Lottie.asset(
                                          'assets/lottie_animations/loading_animation.json',
                                          width: 150,
                                          height: 150)),
                                );
                              } else if (snapshot.hasError) {
                                return Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SvgPicture.asset(
                                        'assets/images/No_internet1.svg',
                                        height: 100,
                                        width: 100,
                                      ),
                                      Text('No-Connection',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500))
                                    ],
                                  ),
                                );
                              } else {
                                return Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
// 1)Pre Boarding

                                   Container(
  decoration: BoxDecoration(
    color: Color(0xFFF6F6F6),
    border: Border.all(color: Color(0xFFDBDBDB)),
  ),
  child: Padding(
    padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
    child: Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 10),
          child: InkWell(
            onTap: () {
                            setState(() {
                              if (preBoardingisUp) {
                                preBoardingisUp = false; // Close if already open
                              } else {
                                // Open Pre-boarding and close all others
                                preBoardingisUp = true;
                                onBoardingisUp = false;
                                caseFilingisUp = false;
                                courtProceedingsisUp = false;
                                trailPhaseisUp = false;
                                caseClosureisUp = false;
                              }
                            });
                          },
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Builder(
                      builder: (context) {
                        final preBoardingStages = _model.stagesdata!
                            .where((stage) => stage.stage == 'Pre-boarding')
                            .toList();
                        final anyCompleted = preBoardingStages.any((stage) => stage.isCompleted==true);
                        final allCompleted = preBoardingStages.every((stage) => stage.isCompleted==true);
                        if (allCompleted) {
                          return Container(
                            decoration: BoxDecoration(
                              color: Color(0xFF4CAF50),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(7.33),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(0),
                                child: SvgPicture.asset(
                                  color: Colors.white,
                                  'assets/images/check_1.svg', 
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          );
                        } else if (anyCompleted) {
                          return Container(
                            decoration: BoxDecoration(
                              color: Color(0xFFF2994A),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(7.33),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(0),
                                child: SvgPicture.asset(
                                  'assets/images/pre_boarding.svg',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          );
                        } else {
                          return Container(
                            decoration: BoxDecoration(
                              color: Color(0xFFFFFFFF),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(7.33),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(0),
                                child: SvgPicture.asset(
                                  'assets/images/pre_boarding.svg',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          );
                        }
                      },
                    ),
                  
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Pre-boarding',
                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                  fontFamily: 'DM Sans',
                                  color: Color(0xFF444444),
                                  fontSize: 18,
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ),
                  ].divide(SizedBox(width: 10)),
                ),
                FaIcon(
                  preBoardingisUp
                      ? FontAwesomeIcons.angleUp
                      : FontAwesomeIcons.angleDown,
                  color: FlutterFlowTheme.of(context).primaryText,
                  size: 24,
                ),
              ].divide(SizedBox(width: 10)),
            ),
          ),
        ),
        if (preBoardingisUp)
          Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              for (int i = 0; i < 4; i++) 
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 4),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (_model.stagesdata![i].stage == 'Pre-boarding' &&
                              _model.stagesdata![i].isCompleted == true)
                            Row(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context).secondaryBackground,
                                    border: Border.all(color: Color(0xFF27AE60)),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(5.33),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(0),
                                      child: SvgPicture.asset(
                                        'assets/images/check_1.svg',
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 8.7),
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      _model.stagesdata![i].subStage ?? '',
                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                            fontFamily: 'DM Sans',
                                            color: Color(0xFF444444),
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w300,
                                          ),
                                    ),
                                    SizedBox(height: 4),
                                    Text(
                                      _model.stagesdata![i].completedAt == null
                                          ? '--'
                                          : DateFormat("dd-MM-yyyy hh:mm a")
                                              .format(DateTime.parse(_model.stagesdata![i].completedAt!).toUtc()),
                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                            fontFamily: 'DM Sans',
                                            color: Color(0xFF444444),
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w300,
                                          ),
                                    ),
                                  ],
                                ),
                              ],
                            )
                          else if (_model.stagesdata![i].stage == 'Pre-boarding' &&
                              _model.stagesdata![i].isCompleted == false &&
                              (i == 0 || _model.stagesdata![i - 1].isCompleted == true))
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                  border: Border.all(color: Color(0x66000000)),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(6, 4, 6, 4),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(0),
                                        child: SvgPicture.asset(
                                          'assets/images/Component_24.svg',
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      SizedBox(width: 8.7),
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            _model.stagesdata![i].subStage ?? '',
                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                  fontFamily: 'DM Sans',
                                                  color: Color(0xFF444444),
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w300,
                                                ),
                                          ),
                                          SizedBox(height: 4),
                                          Text(
                                            _model.stagesdata![i].completedAt == null
                                                ? '--'
                                                : DateFormat("dd MM yyyy hh:mm a")
                                                    .format(DateTime.parse(_model.stagesdata![i].completedAt!).toUtc()),
                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                  fontFamily: 'DM Sans',
                                                  color: Color(0xFF444444),
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w300,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            )
                          else if (_model.stagesdata![i].stage == 'Pre-boarding' &&
                              _model.stagesdata![i].isCompleted == false)
                            Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(5.33),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(0),
                                    child: SvgPicture.asset(
                                      'assets/images/fi_833602.svg',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 8.7),
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      _model.stagesdata![i].subStage ?? '',
                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                            fontFamily: 'DM Sans',
                                            color: Color(0xFF444444),
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w300,
                                          ),
                                    ),
                                    SizedBox(height: 4),
                                    Text(
                                      _model.stagesdata![i].completedAt == null
                                          ? '--'
                                          : DateFormat("dd MM yyyy hh:mm a")
                                              .format(DateTime.parse(_model.stagesdata![i].completedAt!).toUtc()),
                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                            fontFamily: 'DM Sans',
                                            color: Color(0xFF444444),
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w300,
                                          ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                        ],
                      ),
                    ),
                    if (i < 3)
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 4),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(0),
                          child: Image.asset(
                            'assets/images/Frame_line.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                  ],
                ),
            ].divide(SizedBox(height: 10)),
          ),
      ].divide(SizedBox(height: 10)),
    ),
  ),
),
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(0),
                                      child: Image.asset(
                                        'assets/images/Frame_1321314409.png',
                                        fit: BoxFit.cover,
                                      ),
                                    ),
// 2) On Boarding

                                     Container(
  decoration: BoxDecoration(
    color: Color(0xFFF6F6F6),
    border: Border.all(color: Color(0xFFDBDBDB)),
  ),
  child: Padding(
    padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
    child: Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 10),
          child: InkWell(
            onTap: () {
                            setState(() {
                              if (onBoardingisUp) {
                                onBoardingisUp = false; 
                              } 
                              else {
                                preBoardingisUp = false;
                                onBoardingisUp = true;
                                caseFilingisUp = false;
                                courtProceedingsisUp = false;
                                trailPhaseisUp = false;
                                caseClosureisUp = false;
                              }
                            });
                          },
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Builder(
                      builder: (context) {
                        final onBoardingStages = _model.stagesdata!
                            .where((stage) => stage.stage == 'On-boarding')
                            .toList();
                        final anyCompleted = onBoardingStages.any((stage) => stage.isCompleted==true);
                        final allCompleted = onBoardingStages.every((stage) => stage.isCompleted==true);
                        if (allCompleted) {
                          return Container(
                            decoration: BoxDecoration(
                              color: Color(0xFF4CAF50),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(7.33),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(0),
                                child: SvgPicture.asset(
                                  color: Colors.white,
                                  'assets/images/check_1.svg', 
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          );
                        } else if (anyCompleted) {
                          return Container(
                            decoration: BoxDecoration(
                              color: Color(0xFFF2994A),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(7.33),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(0),
                                child: SvgPicture.asset(
                                  'assets/images/on_boarding.svg',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          );
                        } else {
                          return Container(
                            decoration: BoxDecoration(
                              color: Color(0xFFFFFFFF),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(7.33),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(0),
                                child: SvgPicture.asset(
                                  'assets/images/on_boarding.svg',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          );
                        }
                      },
                    ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'On-boarding',
                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                  fontFamily: 'DM Sans',
                                  color: Color(0xFF444444),
                                  fontSize: 18,
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ),
                  ].divide(SizedBox(width: 10)),
                ),
                FaIcon(
                  onBoardingisUp
                      ? FontAwesomeIcons.angleUp
                      : FontAwesomeIcons.angleDown,
                  color: FlutterFlowTheme.of(context).primaryText,
                  size: 24,
                ),
              ].divide(SizedBox(width: 10)),
            ),
          ),
        ),
        if (onBoardingisUp)
          Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              for (int i = 4; i < 8; i++) 
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 4),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (_model.stagesdata![i].stage == 'On-boarding' &&
                              _model.stagesdata![i].isCompleted == true)
                            Row(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context).secondaryBackground,
                                    border: Border.all(color: Color(0xFF27AE60)),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(5.33),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(0),
                                      child: SvgPicture.asset(
                                        'assets/images/check_1.svg',
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 8.7),
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      _model.stagesdata![i].subStage ?? '',
                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                            fontFamily: 'DM Sans',
                                            color: Color(0xFF444444),
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w300,
                                          ),
                                    ),
                                    SizedBox(height: 4),
                                    Text(
                                      _model.stagesdata![i].completedAt == null
                                          ? '--'
                                          : DateFormat("dd MM yyyy hh:mm a")
                                              .format(DateTime.parse(_model.stagesdata![i].completedAt!).toUtc()),
                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                            fontFamily: 'DM Sans',
                                            color: Color(0xFF444444),
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w300,
                                          ),
                                    ),
                                  ],
                                ),
                              ],
                            )
                          else if (_model.stagesdata![i].stage == 'On-boarding' &&
                              _model.stagesdata![i].isCompleted == false &&
                              (i == 3 || _model.stagesdata![i - 1].isCompleted == true))
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                  border: Border.all(color: Color(0x66000000)),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(6, 4, 6, 4),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(0),
                                        child: SvgPicture.asset(
                                          'assets/images/Component_24.svg',
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      SizedBox(width: 8.7),
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            _model.stagesdata![i].subStage ?? '',
                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                  fontFamily: 'DM Sans',
                                                  color: Color(0xFF444444),
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w300,
                                                ),
                                          ),
                                          SizedBox(height: 4),
                                          Text(
                                            _model.stagesdata![i].completedAt == null
                                                ? '--'
                                                : DateFormat("dd MM yyyy hh:mm a")
                                                    .format(DateTime.parse(_model.stagesdata![i].completedAt!).toUtc()),
                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                  fontFamily: 'DM Sans',
                                                  color: Color(0xFF444444),
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w300,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            )
                          else if (_model.stagesdata![i].stage == 'On-boarding' &&
                              _model.stagesdata![i].isCompleted == false)
                            Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(5.33),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(0),
                                    child: SvgPicture.asset(
                                      'assets/images/fi_833602.svg',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 8.7),
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      _model.stagesdata![i].subStage ?? '',
                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                            fontFamily: 'DM Sans',
                                            color: Color(0xFF444444),
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w300,
                                          ),
                                    ),
                                    SizedBox(height: 4),
                                    Text(
                                      _model.stagesdata![i].completedAt == null
                                          ? '--'
                                          : DateFormat("dd MM yyyy hh:mm a")
                                              .format(DateTime.parse(_model.stagesdata![i].completedAt!).toUtc()),
                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                            fontFamily: 'DM Sans',
                                            color: Color(0xFF444444),
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w300,
                                          ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                        ],
                      ),
                    ),
                    
                    if (
                        i < 7) 
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 4), 
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(0),
                          child: Image.asset(
                            'assets/images/Frame_line.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                  ],
                ),
            ].divide(SizedBox(height: 10)),
          ),
      ].divide(SizedBox(height: 10)),
    ),
  ),
),
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(0),
                                      child: Image.asset(
                                        'assets/images/Frame_1321314410.png',
                                        fit: BoxFit.cover,
                                      ),
                                    ),

//3) Case Filing

                                    Container(
  decoration: BoxDecoration(
    color: Color(0xFFF6F6F6),
    border: Border.all(color: Color(0xFFDBDBDB)),
  ),
  child: Padding(
    padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
    child: Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 10),
          child: InkWell(
            onTap: () {
                            setState(() {
                              if (caseFilingisUp) {
                                caseFilingisUp = false; 
                              } else {
                                preBoardingisUp = false;
                                onBoardingisUp = false;
                                caseFilingisUp = true;
                                courtProceedingsisUp = false;
                                trailPhaseisUp = false;
                                caseClosureisUp = false;
                              }
                            });
                          },
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:[
                      Builder(
                        builder: (context) {
                          final caseFilingStages = _model.stagesdata!
                              .where((stage) => stage.stage == 'Case Filing')
                              .toList();
                          final anyCompleted = caseFilingStages.any((stage) => stage.isCompleted==true);
                          final allCompleted = caseFilingStages.every((stage) => stage.isCompleted==true);
                          if (allCompleted) {
                            return Container(
                              decoration: BoxDecoration(
                                color: Color(0xFF4CAF50),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(7.33),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(0),
                                  child: SvgPicture.asset(
                                    color: Colors.white,
                                    'assets/images/check_1.svg', 
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            );
                          } else if (anyCompleted) {
                            return Container(
                              decoration: BoxDecoration(
                                color: Color(0xFFF2994A),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(7.33),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(0),
                                  child: SvgPicture.asset(
                                    'assets/images/case_filing.svg',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            );
                          } else {
                            return Container(
                              decoration: BoxDecoration(
                                color: Color(0xFFFFFFFF),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(7.33),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(0),
                                  child: SvgPicture.asset(
                                    'assets/images/case_filing.svg',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            );
                          }
                        },
                      ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Case Filing',
                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'DM Sans',
                                    color: Color(0xFF444444),
                                    fontSize: 18,
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ),
                    ].divide(SizedBox(width: 10)),
                ),
                FaIcon(
                  caseFilingisUp
                      ? FontAwesomeIcons.angleUp
                      : FontAwesomeIcons.angleDown,
                  color: FlutterFlowTheme.of(context).primaryText,
                  size: 24,
                ),
              ].divide(SizedBox(width: 10)),
            ),
          ),
        ),
        if (caseFilingisUp)
          Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              for (int i = 8; i < 13; i++) 
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 4),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (_model.stagesdata![i].stage == 'Case Filing' &&
                              _model.stagesdata![i].isCompleted == true)
                            Row(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context).secondaryBackground,
                                    border: Border.all(color: Color(0xFF27AE60)),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(5.33),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(0),
                                      child: SvgPicture.asset(
                                        'assets/images/check_1.svg',
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 8.7),
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      _model.stagesdata![i].subStage ?? '',
                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                            fontFamily: 'DM Sans',
                                            color: Color(0xFF444444),
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w300,
                                          ),
                                    ),
                                    SizedBox(height: 4),
                                    Text(
                                      _model.stagesdata![i].completedAt == null
                                          ? '--'
                                          : DateFormat("dd-MM-yyyy hh:mm a")
                                              .format(DateTime.parse(_model.stagesdata![i].completedAt!).toUtc()),
                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                            fontFamily: 'DM Sans',
                                            color: Color(0xFF444444),
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w300,
                                          ),
                                    ),
                                  ],
                                ),
                              ],
                            )
                          else if (_model.stagesdata![i].stage == 'Case Filing' &&
                              _model.stagesdata![i].isCompleted == false &&
                              (i == 7 || _model.stagesdata![i - 1].isCompleted == true))
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                  border: Border.all(color: Color(0x66000000)),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(6, 4, 6, 4),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(0),
                                        child: SvgPicture.asset(
                                          'assets/images/Component_24.svg',
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      SizedBox(width: 8.7),
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            _model.stagesdata![i].subStage ?? '',
                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                  fontFamily: 'DM Sans',
                                                  color: Color(0xFF444444),
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w300,
                                                ),
                                          ),
                                          SizedBox(height: 4),
                                          Text(
                                           '--'
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            )
                          else if (_model.stagesdata![i].stage == 'Case Filing' &&
                              _model.stagesdata![i].isCompleted == false)
                            Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(5.33),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(0),
                                    child: SvgPicture.asset(
                                      'assets/images/fi_833602.svg',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 8.7),
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      _model.stagesdata![i].subStage ?? '',
                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                            fontFamily: 'DM Sans',
                                            color: Color(0xFF444444),
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w300,
                                          ),
                                    ),
                                    SizedBox(height: 4),
                                    Text(
                                     '--'
                                    ),
                                  ],
                                ),
                              ],
                            ),
                        ],
                      ),
                    ),
                    if (i < 12) 
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 4),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(0),
                          child: Image.asset(
                            'assets/images/Frame_line.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                  ],
                ),
            ].divide(SizedBox(height: 10)),
          ),
      ].divide(SizedBox(height: 10)),
    ),
  ),
),
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(0),
                                      child: Image.asset(
                                        'assets/images/Frame_1321314410.png',
                                        fit: BoxFit.cover,
                                      ),
                                    ),

//4)Court Proceedings
                                    Container(
  decoration: BoxDecoration(
    color: Color(0xFFF6F6F6),
    border: Border.all(color: Color(0xFFDBDBDB)),
  ),
  child: Padding(
    padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
    child: Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 10),
          child: InkWell(
             onTap: () {
                            setState(() {
                              if (courtProceedingsisUp) {
                                courtProceedingsisUp = false; 
                              } else {
                                preBoardingisUp = false;
                                onBoardingisUp = false;
                                caseFilingisUp = false;
                                courtProceedingsisUp = true;
                                trailPhaseisUp = false;
                                caseClosureisUp = false;
                              }
                            });
                          },
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                      Builder(
                        builder: (context) {
                          final courtProceedingsStages = _model.stagesdata!
                              .where((stage) => stage.stage == 'Court proceedings')
                              .toList();
                          final anyCompleted = courtProceedingsStages.any((stage) => stage.isCompleted==true);
                          final allCompleted = courtProceedingsStages.every((stage) => stage.isCompleted==true);
                          if (allCompleted) {
                            return Container(
                              decoration: BoxDecoration(
                                color: Color(0xFF4CAF50),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(7.33),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(0),
                                  child: SvgPicture.asset(
                                    color: Colors.white,
                                    'assets/images/check_1.svg', 
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            );
                          } else if (anyCompleted) {
                            return Container(
                              decoration: BoxDecoration(
                                color: Color(0xFFF2994A),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(7.33),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(0),
                                  child: SvgPicture.asset(
                                    'assets/images/court_proceedings.svg',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            );
                          } else {
                            return Container(
                              decoration: BoxDecoration(
                                color: Color(0xFFFFFFFF),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(7.33),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(0),
                                  child: SvgPicture.asset(
                                    'assets/images/court_proceedings.svg',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            );
                          }
                        },
                      ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Court Proceedings',
                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'DM Sans',
                                    color: Color(0xFF444444),
                                    fontSize: 18,
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ),
                    ].divide(SizedBox(width: 10)),
                ),
                FaIcon(
                  courtProceedingsisUp
                      ? FontAwesomeIcons.angleUp
                      : FontAwesomeIcons.angleDown,
                  color: FlutterFlowTheme.of(context).primaryText,
                  size: 24,
                ),
              ].divide(SizedBox(width: 10)),
            ),
          ),
        ),
        if (courtProceedingsisUp)
          Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              for (int i = 13; i < 18; i++) 
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 4),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (_model.stagesdata![i].stage == 'Court proceedings' &&
                              _model.stagesdata![i].isCompleted == true)
                            Row(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context).secondaryBackground,
                                    border: Border.all(color: Color(0xFF27AE60)),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(5.33),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(0),
                                      child: SvgPicture.asset(
                                        'assets/images/check_1.svg',
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 8.7),
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      _model.stagesdata![i].subStage ?? '',
                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                            fontFamily: 'DM Sans',
                                            color: Color(0xFF444444),
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w300,
                                          ),
                                    ),
                                    SizedBox(height: 4),
                                    Text(
                                      _model.stagesdata![i].completedAt == null
                                          ? '--'
                                          : DateFormat("dd MM yyyy hh:mm a")
                                              .format(DateTime.parse(_model.stagesdata![i].completedAt!).toUtc()),
                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                            fontFamily: 'DM Sans',
                                            color: Color(0xFF444444),
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w300,
                                          ),
                                    ),
                                  ],
                                ),
                              ],
                            )
                          else if (_model.stagesdata![i].stage == 'Court proceedings' &&
                              _model.stagesdata![i].isCompleted == false &&
                              (i == 12 || _model.stagesdata![i - 1].isCompleted == true))
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                  border: Border.all(color: Color(0x66000000)),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(6, 4, 6, 4),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(0),
                                        child: SvgPicture.asset(
                                          'assets/images/Component_24.svg',
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      SizedBox(width: 8.7),
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            _model.stagesdata![i].subStage ?? '',
                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                  fontFamily: 'DM Sans',
                                                  color: Color(0xFF444444),
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w300,
                                                ),
                                          ),
                                          SizedBox(height: 4),
                                          Text(
                                           '--'
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            )
                          else if (_model.stagesdata![i].stage == 'Court proceedings' &&
                              _model.stagesdata![i].isCompleted == false)
                            Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(5.33),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(0),
                                    child: SvgPicture.asset(
                                      'assets/images/fi_833602.svg',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 8.7),
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      _model.stagesdata![i].subStage ?? '',
                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                            fontFamily: 'DM Sans',
                                            color: Color(0xFF444444),
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w300,
                                          ),
                                    ),
                                    SizedBox(height: 4),
                                    Text(
                                     '--'
                                    ),
                                  ],
                                ),
                              ],
                            ),
                        ],
                      ),
                    ),
                    if (i < 17) 
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 4),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(0),
                          child: Image.asset(
                            'assets/images/Frame_line.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                  ],
                ),
            ].divide(SizedBox(height: 10)),
          ),
      ].divide(SizedBox(height: 10)),
    ),
  ),
),

                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(0),
                                      child: Image.asset(
                                        'assets/images/Frame_1321314410.png',
                                        fit: BoxFit.cover,
                                      ),
                                    ),

// 5) Trail Phase

                                    Container(
  decoration: BoxDecoration(
    color: Color(0xFFF6F6F6),
    border: Border.all(color: Color(0xFFDBDBDB)),
  ),
  child: Padding(
    padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
    child: Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 10),
          child: InkWell(
             onTap: () {
                            setState(() {
                              if (trailPhaseisUp) {
                                trailPhaseisUp = false; 
                              } else {
                                preBoardingisUp = false;
                                onBoardingisUp = false;
                                caseFilingisUp = false;
                                courtProceedingsisUp = false;
                                trailPhaseisUp = true;
                                caseClosureisUp = false;
                              }
                            });
                          },
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                        Builder(
                          builder: (context) {
                            final trailPhaseStages = _model.stagesdata!
                                .where((stage) => stage.stage == 'Trail phase')
                                .toList();
                            final anyCompleted = trailPhaseStages.any((stage) => stage.isCompleted==true);
                            final allCompleted = trailPhaseStages.every((stage) => stage.isCompleted==true);
                            if (allCompleted) {
                              return Container(
                                decoration: BoxDecoration(
                                  color: Color(0xFF4CAF50),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(7.33),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(0),
                                    child: SvgPicture.asset(
                                      color: Colors.white,
                                      'assets/images/check_1.svg', 
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              );
                            } else if (anyCompleted) {
                              return Container(
                                decoration: BoxDecoration(
                                  color: Color(0xFFF2994A),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(7.33),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(0),
                                    child: SvgPicture.asset(
                                      'assets/images/trail_phase.svg',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              );
                            } else {
                              return Container(
                                decoration: BoxDecoration(
                                  color: Color(0xFFFFFFFF),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(7.33),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(0),
                                    child: SvgPicture.asset(
                                      'assets/images/trail_phase.svg',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              );
                            }
                          },
                        ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Trail Phase',
                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                      fontFamily: 'DM Sans',
                                      color: Color(0xFF444444),
                                      fontSize: 18,
                                      letterSpacing: 0.0,
                                    ),
                              ),
                            ),
                      ].divide(SizedBox(width: 10)),
                ),
                FaIcon(
                  trailPhaseisUp
                      ? FontAwesomeIcons.angleUp
                      : FontAwesomeIcons.angleDown,
                  color: FlutterFlowTheme.of(context).primaryText,
                  size: 24,
                ),
              ].divide(SizedBox(width: 10)),
            ),
          ),
        ),
        if (trailPhaseisUp)
          Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              for (int i = 18; i < 28; i++) 
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 4),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (_model.stagesdata![i].stage == 'Trail phase' &&
                              _model.stagesdata![i].isCompleted == true)
                            Row(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context).secondaryBackground,
                                    border: Border.all(color: Color(0xFF27AE60)),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(5.33),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(0),
                                      child: SvgPicture.asset(
                                        'assets/images/check_1.svg',
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 8.7),
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      _model.stagesdata![i].subStage ?? '',
                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                            fontFamily: 'DM Sans',
                                            color: Color(0xFF444444),
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w300,
                                          ),
                                    ),
                                    SizedBox(height: 4),
                                    Text(
                                      _model.stagesdata![i].completedAt == null
                                          ? '--'
                                          : DateFormat("dd MM yyyy hh:mm a")
                                              .format(DateTime.parse(_model.stagesdata![i].completedAt!).toUtc()),
                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                            fontFamily: 'DM Sans',
                                            color: Color(0xFF444444),
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w300,
                                          ),
                                    ),
                                  ],
                                ),
                              ],
                            )
                          else if (_model.stagesdata![i].stage == 'Trail phase' &&
                              _model.stagesdata![i].isCompleted == false &&
                              (i == 17 || _model.stagesdata![i - 1].isCompleted == true))
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                  border: Border.all(color: Color(0x66000000)),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(6, 4, 6, 4),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(0),
                                        child: SvgPicture.asset(
                                          'assets/images/Component_24.svg',
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      SizedBox(width: 8.7),
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            _model.stagesdata![i].subStage ?? '',
                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                  fontFamily: 'DM Sans',
                                                  color: Color(0xFF444444),
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w300,
                                                ),
                                          ),
                                          SizedBox(height: 4),
                                          Text(
                                          '--'
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            )
                          else if (_model.stagesdata![i].stage == 'Trail phase' &&
                              _model.stagesdata![i].isCompleted == false)
                            Expanded(
                              child: Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.all(5.33),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(0),
                                      child: SvgPicture.asset(
                                        'assets/images/fi_833602.svg',
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 8.7),
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        _model.stagesdata![i].subStage ?? '',
                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                              fontFamily: 'DM Sans',
                                              color: Color(0xFF444444),
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w300,
                                            ),
                                      ),
                                      SizedBox(height: 4),
                                      Text(
                                       '--'
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                        ],
                      ),
                    ),
                   
                    if (i < 27) 
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 4),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(0),
                          child: Image.asset(
                            'assets/images/Frame_line.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                  ],
                ),
            ].divide(SizedBox(height: 10)),
          ),
      ].divide(SizedBox(height: 10)),
    ),
  ),
),

                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(0),
                                      child: Image.asset(
                                        'assets/images/Frame_1321314410.png',
                                        fit: BoxFit.cover,
                                      ),
                                    ),

// 6)Case Closure

                                    Container(
  decoration: BoxDecoration(
    color: Color(0xFFF6F6F6),
    border: Border.all(color: Color(0xFFDBDBDB)),
  ),
  child: Padding(
    padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
    child: Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 10),
          child: InkWell(
             onTap: () {
                            setState(() {
                              if (caseClosureisUp) {
                                caseClosureisUp = false; 
                              } else {
                                preBoardingisUp = false;
                                onBoardingisUp = false;
                                caseFilingisUp = false;
                                courtProceedingsisUp = false;
                                trailPhaseisUp = false;
                                caseClosureisUp = true;
                              }
                            });
                          },
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:[
                        Builder(
                          builder: (context) {
                            final caseClosureStages = _model.stagesdata!
                                .where((stage) => stage.stage == 'Case Closure')
                                .toList();
                            final anyCompleted = caseClosureStages.any((stage) => stage.isCompleted==true);
                            final allCompleted = caseClosureStages.every((stage) => stage.isCompleted==true);
                            if (allCompleted) {
                              return Container(
                                decoration: BoxDecoration(
                                  color: Color(0xFF4CAF50),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(7.33),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(0),
                                    child: SvgPicture.asset(
                                      color: Colors.white,
                                      'assets/images/check_1.svg', 
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              );
                            } else if (anyCompleted) {
                              return Container(
                                decoration: BoxDecoration(
                                  color: Color(0xFFF2994A),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(7.33),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(0),
                                    child: SvgPicture.asset(
                                      'assets/images/case_closure.svg',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              );
                            } else {
                              return Container(
                                decoration: BoxDecoration(
                                  color: Color(0xFFFFFFFF),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(7.33),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(0),
                                    child: SvgPicture.asset(
                                      'assets/images/case_closure.svg',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              );
                            }
                          },
                        ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Case Closure',
                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                      fontFamily: 'DM Sans',
                                      color: Color(0xFF444444),
                                      fontSize: 18,
                                      letterSpacing: 0.0,
                                    ),
                              ),
                            ),
                      ].divide(SizedBox(width: 10)),
                ),
                FaIcon(
                  caseClosureisUp
                      ? FontAwesomeIcons.angleUp
                      : FontAwesomeIcons.angleDown,
                  color: FlutterFlowTheme.of(context).primaryText,
                  size: 24,
                ),
              ].divide(SizedBox(width: 10)),
            ),
          ),
        ),
        if (caseClosureisUp)
          Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              for (int i = 28; i < 32; i++) // Case Closure stages (index 28 to 31)
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 4),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (_model.stagesdata![i].stage == 'Case Closure' &&
                              _model.stagesdata![i].isCompleted == true)
                            Row(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context).secondaryBackground,
                                    border: Border.all(color: Color(0xFF27AE60)),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(5.33),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(0),
                                      child: SvgPicture.asset(
                                        'assets/images/check_1.svg',
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 8.7),
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      _model.stagesdata![i].subStage ?? '',
                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                            fontFamily: 'DM Sans',
                                            color: Color(0xFF444444),
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w300,
                                          ),
                                    ),
                                    SizedBox(height: 4),
                                    Text(
                                      _model.stagesdata![i].completedAt == null
                                          ? '--'
                                          : DateFormat("dd-MM-yyyy hh:mm a")
                                              .format(DateTime.parse(_model.stagesdata![i].completedAt!).toUtc()),
                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                            fontFamily: 'DM Sans',
                                            color: Color(0xFF444444),
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w300,
                                          ),
                                    ),
                                  ],
                                ),
                              ],
                            )
                          else if (_model.stagesdata![i].stage == 'Case Closure' &&
                              _model.stagesdata![i].isCompleted == false &&
                              (i == 27 || _model.stagesdata![i - 1].isCompleted == true))
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                  border: Border.all(color: Color(0x66000000)),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(6, 4, 6, 4),
                                  child: Expanded(
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        ClipRRect(
                                          borderRadius: BorderRadius.circular(0),
                                          child: SvgPicture.asset(
                                            'assets/images/Component_24.svg',
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        SizedBox(width: 8.7),
                                        Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              _model.stagesdata![i].subStage ?? '',
                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                    fontFamily: 'DM Sans',
                                                    color: Color(0xFF444444),
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w300,
                                                  ),
                                            ),
                                            SizedBox(height: 4),
                                            Text(
                                           '--'
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            )
                          else if (_model.stagesdata![i].stage == 'Case Closure' &&
                              _model.stagesdata![i].isCompleted == false)
                            Expanded(
                              child: Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.all(5.33),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(0),
                                      child: SvgPicture.asset(
                                        'assets/images/fi_833602.svg',
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 8.7),
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        _model.stagesdata![i].subStage ?? '',
                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                              fontFamily: 'DM Sans',
                                              color: Color(0xFF444444),
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w300,
                                            ),
                                      ),
                                      SizedBox(height: 4),
                                      Text(
                                     '--'
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                        ],
                      ),
                    ),
                    if (i < 31) 
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 4),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(0),
                          child: Image.asset(
                            'assets/images/Frame_line.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                  ],
                ),
            ].divide(SizedBox(height: 10)),
          ),
      ].divide(SizedBox(height: 10)),
    ),
  ),
),
                                  ],
                                );
                              }
                            })),
                  ),                  
                ].divide(SizedBox(height: 24)).addToEnd(SizedBox(height: 40)),
              ),
            )),
      ),
    );
  }
}
