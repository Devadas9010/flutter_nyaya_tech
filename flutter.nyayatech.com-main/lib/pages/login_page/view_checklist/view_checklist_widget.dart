import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:nyaya_tech/data_components/genric_text_field.dart';
import 'package:nyaya_tech/pages/login_page/view_checklist/view_checklist_model.dart';

import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';

class VIewchecklistWidget extends StatefulWidget {
  const VIewchecklistWidget({super.key});

  @override
  State<VIewchecklistWidget> createState() => _VIewchecklistWidgetState();
}

class _VIewchecklistWidgetState extends State<VIewchecklistWidget> {
  late VIewchecklistModel _model;
  late Future<void> _future;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => VIewchecklistModel());

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();
    _future = fetchdata();
  }

  Future<void> fetchdata() async {
    await _model.fetchviewCheckList();
  }

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: WillPopScope(
        onWillPop: () async {
          return false;
        },
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          body: SafeArea(
            top: true,
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(16, 16, 8, 0),
                    child: InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Icon(Icons.close_sharp,
                              color: FlutterFlowTheme.of(context).primaryText,
                              size: 24),
                        ],
                      ),
                    ),
                  ),
                  Divider(
                    thickness: 2,
                    color: FlutterFlowTheme.of(context).alternate,
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
                                          width: 100),
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
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16, 0, 16, 0),
                                      child: ListView(
                                        padding: EdgeInsets.zero,
                                        shrinkWrap: true,
                                        scrollDirection: Axis.vertical,
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              border: Border.all(
                                                color: Color(0xFFDBDBDB),
                                              ),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsets.all(10),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Icon(Icons.square_outlined,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      size: 24),
                                                  Expanded(
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          '${_model.viewCheckList!.desc}',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'DM Sans',
                                                                color: Color(
                                                                    0xFF181616),
                                                                fontSize: 14,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                              ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ].divide(SizedBox(width: 12)),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                );
                              }
                            })),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        InkWell(
                          onTap: () async {},
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color(0xFFE0E0E0),
                            ),
                            child: Padding(
                                padding: EdgeInsets.all(8),
                                child: SvgPicture.asset(
                                    'assets/images/check_upload.svg',
                                    width: 24,
                                    height: 24)),
                          ),
                        ),
                        Expanded(
                            child: CommentTextField(
                          controller: _model.textController!,
                          maxLine: 1,
                        )),
                        Container(
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).primaryText,
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(8),
                            child: Icon(
                              Icons.ios_share_sharp,
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              size: 24,
                            ),
                          ),
                        ),
                      ].divide(SizedBox(width: 8)),
                    ),
                  ),
                ].divide(SizedBox(height: 12)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
