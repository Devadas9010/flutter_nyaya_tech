import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:nyaya_tech/components/details_screen_widget.dart';
import 'package:nyaya_tech/components/menu_item.dart';
import 'package:nyaya_tech/data_components/get_routing.dart';
import 'package:nyaya_tech/data_components/shared_prefernce.dart';
import 'package:nyaya_tech/flutter_flow/flutter_flow_animation.dart';
import 'package:nyaya_tech/flutter_flow/flutter_flow_theme.dart';
import 'package:nyaya_tech/flutter_flow/flutter_flow_util.dart';
import 'package:nyaya_tech/flutter_flow/flutter_flow_widgets.dart';
import 'package:nyaya_tech/index.dart';
import 'package:nyaya_tech/pages/login_page/check_list/check_list_widget.dart';
import 'package:nyaya_tech/pages/login_page/kyc_upload/kyc_widget.dart';
import 'package:nyaya_tech/pages/login_page/view_case/case_number_widget.dart';
import 'package:nyaya_tech/pages/login_page/view_case/drafting_and_signing_widget.dart';
import 'package:nyaya_tech/pages/login_page/view_case/help_line.dart';
import 'package:nyaya_tech/pages/login_page/view_case/view_case_model.dart';
import 'package:popover/popover.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ViewCaseWidget extends StatefulWidget {
  const ViewCaseWidget({super.key});

  @override
  State<ViewCaseWidget> createState() => _ViewCaseWidgetState();
}

class _ViewCaseWidgetState extends State<ViewCaseWidget> {
  late ViewCaseModel _model;
  String? selectedValue;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  bool refreshLoading = false;
  bool hasMore = true;
  late Future<void> _future;
  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ViewCaseModel());
    // print("Data -- ${SharedPrefernce.getDataList()}");
    _future = fetchdata();
    animationsMap.addAll({
      'rowOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 700.0.ms,
            begin: Offset(0.0, 10.0),
            end: Offset(0.0, 0.0),
          ),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 700.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'containerOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 700.0.ms,
            begin: Offset(-20.0, 0.0),
            end: Offset(0.0, 0.0),
          ),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 700.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'containerOnPageLoadAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 700.0.ms,
            begin: Offset(20.0, 0.0),
            end: Offset(0.0, 0.0),
          ),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 700.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'containerOnPageLoadAnimation3': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 700.0.ms,
            begin: Offset(0.0, 20.0),
            end: Offset(0.0, 0.0),
          ),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 700.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'containerOnPageLoadAnimation4': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 700.0.ms,
            begin: Offset(0.0, 20.0),
            end: Offset(0.0, 0.0),
          ),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 700.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'containerOnPageLoadAnimation5': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 700.0.ms,
            begin: Offset(0.0, 20.0),
            end: Offset(0.0, 0.0),
          ),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 700.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'columnOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 700.0.ms,
            begin: Offset(0.0, 20.0),
            end: Offset(0.0, 0.0),
          ),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 700.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'floatingActionButtonOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 700.0.ms,
            begin: Offset(0.0, 20.0),
            end: Offset(0.0, 0.0),
          ),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 700.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
    });
  }

  Future<void> fetchdata() async {
    await _model.fetchViewCase();
  }

  Future<void> _refresh(BuildContext context) async {
    setState(() {
      refreshLoading = true;
      hasMore = true;
    });
    try {
      await fetchdata();
      setState(() {
        refreshLoading = false;
      });
    } catch (e) {
      setState(() {
        refreshLoading = false;
      });
    }
  }

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Color(0XFFFFFFFF),
          floatingActionButton: Builder(
            builder: (context) => Container(
              height: 50,
              width: 50,
              child: FloatingActionButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.zero)),
                onPressed: () {
                  showPopover(
                      context: context,
                      bodyBuilder: (context) => Padding(
                            padding: const EdgeInsets.only(top: 30, bottom: 20),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                MenuItem(
                                    text: 'Case Details',
                                    color: Colors.white,
                                    ontap: () {}),
                                MenuItem(
                                  text: 'Files',
                                  color: Colors.white.withOpacity(0.5),
                                  ontap: () {
                                    Get.back();
                                    Navigator.push(
                                      context,
                                      PageTransition(
                                          type: PageTransitionType.fade,
                                          child: FilesWidget()),
                                    );
                                  },
                                ),
                                MenuItem(
                                    text: 'List of Documents',
                                    color: Colors.white.withOpacity(0.5),
                                    ontap: () {
                                      Get.back();
                                      Navigator.push(
                                        context,
                                        PageTransition(
                                            type: PageTransitionType.fade,
                                            child: ListofchecklistWidget()),
                                      );
                                    }),
                                MenuItem(
                                  text: 'Chat Box',
                                  color: Colors.white.withOpacity(0.5),
                                  ontap: () {
                                    Get.back();
                                    Navigator.push(
                                      context,
                                      PageTransition(
                                          type: PageTransitionType.fade,
                                          child: ChatBoxWidget()),
                                    );
                                  },
                                ),
                                MenuItem(
                                  text: 'Notes',
                                  color: Colors.white.withOpacity(0.5),
                                  ontap: () {
                                    Get.back();
                                    Navigator.push(
                                      context,
                                      PageTransition(
                                          type: PageTransitionType.fade,
                                          child: NotesScreenWidget()),
                                    );
                                  },
                                ),
                                MenuItem(
                                  text: 'Hearing Summary',
                                  color: Colors.white.withOpacity(0.5),
                                  ontap: () {
                                    Get.back();
                                    Navigator.push(
                                      context,
                                      PageTransition(
                                          type: PageTransitionType.fade,
                                          child: HearingSummaryWidget()),
                                    );
                                  },
                                ),
                                // MenuItem(
                                //   text: 'Logs',
                                //   color: Colors.white.withOpacity(0.5),
                                //   ontap: () {
                                //     Get.back();
                                //     Navigator.push(
                                //       context,
                                //       PageTransition(
                                //           type: PageTransitionType.fade,
                                //           child: LogsWidget()),
                                //     );
                                //   },
                                // ),
                              ].divide(SizedBox(height: 16)),
                            ),
                          ),
                      direction: PopoverDirection.right,
                      width: 250,
                      height: 230,
                      arrowHeight: 15,
                      arrowWidth: 30,
                      backgroundColor: Colors.black);
                },
                backgroundColor: Colors.black,
                elevation: 8,
                child: Icon(Icons.menu_rounded, color: Colors.white, size: 32),
              ),
            ),
          ),
          body: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 0),
              child: FutureBuilder(
                  future: _future,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                          child: Lottie.asset(
                              'assets/lottie_animations/loading_animation.json',
                              width: 150,
                              height: 150));
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
                      String capitalizeEachWord(String text) {
                        return text
                            .toLowerCase()
                            .split(' ')
                            .map((word) => word.isNotEmpty
                                ? word[0].toUpperCase() + word.substring(1)
                                : '')
                            .join(' ');
                      }

                      String orginalText = '${_model.viewCase!.status}';
                      String formattedText =
                          capitalizeEachWord(orginalText.replaceAll("_", " "));
                      String fromatedPriority = capitalizeEachWord(
                          _model.viewCase!.priority.toString());
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

                      return RefreshIndicator(
                        onRefresh: () => _refresh(context),
                        child: Skeletonizer(
                          enabled: refreshLoading,
                          child: SingleChildScrollView(
                            physics: AlwaysScrollableScrollPhysics(),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    GestureDetector(
                                        onTap: () {
                                          Get.toNamed(Routes.bottombar,
                                              arguments: {'currentIndex': 2});
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              border: Border.all(
                                                  color: Colors.black,
                                                  width: 1)),
                                          child: Padding(
                                            padding: EdgeInsets.all(10),
                                            child: Icon(Icons.arrow_back,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                size: 24),
                                          ),
                                        )),
                                   
                                    Container(
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        border: Border.all(
                                            color: Colors.black, width: 1),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.all(10),
                                        child: Icon(Icons.help_outline_rounded,
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            size: 24),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          formattedText,
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontFamily: 'DM Sans',
                                              fontWeight: FontWeight.w500),
                                        )
                                      ],
                                    ),
                                    
                                    InkWell(
                                      onTap: () {
                                        Get.toNamed(Routes.stageScreen);
                                      },
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.remove_red_eye_outlined,
                                            color: Color(0XFFEB5757),
                                          ),
                                          Text(
                                            'View Status',
                                            style: TextStyle(
                                                color: Color(0XFFEB5757),
                                                fontSize: 16,
                                                fontWeight: FontWeight.w400),
                                          )
                                        ].divide(SizedBox(width: 6)),
                                      ),
                                    )
                                  ],
                                ),
                                 Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                   children: [
                                     InkWell(
                                          onTap: () {
                                            Navigator.push<void>(
                                              context,
                                              MaterialPageRoute<void>(
                                                builder: (BuildContext context) =>
                                                    const DraftingWidget(),
                                              ),
                                            );
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                              border: Border.all(
                                                  color: Colors.black, width: 1),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsets.all(8),
                                              child: Text('Drafting and Signing'),
                                            ),
                                          ),
                                        ),
                                   ],
                                 ),
                                Container(
                                  decoration: BoxDecoration(
                                    color: Color(0xFFF0F4FA),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(12),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Icon(
                                              Icons.error_outline,
                                              color: Color(0xFFEB5757),
                                              size: 20,
                                            ),
                                            Text(
                                              'Upload your aadhar And selfie',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'DM Sans',
                                                        color:
                                                            Color(0xB3000000),
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                          ].divide(SizedBox(width: 8)),
                                        ),
                                        FFButtonWidget(
                                          onPressed: () {
                                            Navigator.push(context,
                                                MaterialPageRoute(
                                                    builder: (context) {
                                              return AadharWidget();
                                            }));
                                          },
                                          text: 'Upload',
                                          options: FFButtonOptions(
                                            height: 40,
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16, 0, 16, 0),
                                            iconPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 0, 0, 0),
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .override(
                                                      fontFamily: 'DM Sans',
                                                      color: Colors.white,
                                                      fontSize: 12,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                            elevation: 0,
                                            borderRadius:
                                                BorderRadius.circular(0),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                CaseNumberWidget(),
                                Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    borderRadius: BorderRadius.circular(1),
                                    border: Border.all(
                                      color: Color(0xFFDBDBDB),
                                    ),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(8),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                SvgPicture.asset(
                                                    'assets/images/created.svg',
                                                    height: 20,
                                                    width: 20),
                                                Text(
                                                  DateFormat('dd MMM yyyy')
                                                      .format(_model
                                                          .viewCase!.createdAt!
                                                          .toLocal()),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                          fontFamily: 'DM Sans',
                                                          color: Colors.black,
                                                          letterSpacing: 0,
                                                          fontWeight: FontWeight
                                                              .normal),
                                                ),
                                              ].divide(SizedBox(width: 8)),
                                            ).animateOnPageLoad(animationsMap[
                                                'rowOnPageLoadAnimation']!),
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Expanded(
                                                  child: _model.viewCase!
                                                              .description ==
                                                          null
                                                      ? Text(
                                                          _model.viewCase!
                                                              .caseIssue!.issue
                                                              .toString(),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontSize: 18,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                fontFamily:
                                                                    'DM Sans',
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                        )
                                                      : Text(
                                                          '${_model.viewCase!.description}',
                                                          style: TextStyle(
                                                              fontFamily:
                                                                  'DM Sans',
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              fontSize: 14,
                                                              color: Color(
                                                                      0XFF000000)
                                                                  .withOpacity(
                                                                      0.5)),
                                                        ),
                                                ),
                                              ],
                                            ),
                                          ].divide(SizedBox(height: 6)),
                                        ),
                                        Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            if (_model.viewCase!.description ==
                                                null)
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  SvgPicture.network(
                                                      '${_model.viewCase!.caseIssue!.caseTypeLogo}',
                                                      width: 24,
                                                      height: 24),
                                                  Expanded(
                                                    child: Text(
                                                      _model.viewCase!
                                                          .caseIssue!.caseType
                                                          .toString(),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'DM Sans',
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight.w300,
                                                            letterSpacing: 0,
                                                          ),
                                                    ),
                                                  ),
                                                ].divide(SizedBox(width: 8)),
                                              ),
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                SvgPicture.network(
                                                    '${_model.viewCase!.caseIssue!.categoryLogo}',
                                                    width: 24,
                                                    height: 24),
                                                Expanded(
                                                    child: Text(
                                                  _model.viewCase!.caseIssue!
                                                      .category
                                                      .toString(),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Plus Jakarta Sans',
                                                        letterSpacing: 0,
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w300,
                                                      ),
                                                )),
                                              ].divide(SizedBox(width: 10)),
                                            ),
                                          ].divide(SizedBox(height: 6)),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 8),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                  border: Border.all(
                                                      color: Color(0x33000000),
                                                      width: 1),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(24, 8, 24, 8),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Text(
                                                        formattedText,
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                                fontFamily:
                                                                    'DM Sans',
                                                                color: getStatus(
                                                                    formattedText),
                                                                letterSpacing:
                                                                    0),
                                                      ),
                                                    ].divide(
                                                        SizedBox(width: 12)),
                                                  ),
                                                ),
                                              ).animateOnPageLoad(animationsMap[
                                                  'containerOnPageLoadAnimation2']!),
                                              Container(
                                                decoration: BoxDecoration(
                                                  color: getPriorityBg(
                                                      fromatedPriority),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(24, 8, 24, 8),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Text(
                                                        fromatedPriority,
                                                        style: FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .override(
                                                                fontFamily:
                                                                    'DM Sans',
                                                                color: getPriority(
                                                                    fromatedPriority),
                                                                letterSpacing:
                                                                    0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400),
                                                      ),
                                                    ].divide(
                                                        SizedBox(width: 10)),
                                                  ),
                                                ),
                                              ).animateOnPageLoad(animationsMap[
                                                  'containerOnPageLoadAnimation1']!),
                                            ],
                                          ),
                                        ),
                                      ].divide(SizedBox(height: 12)),
                                    ),
                                  ),
                                )..animateOnPageLoad(
                                    animationsMap['rowOnPageLoadAnimation']!),
                                Container(
                                  decoration: BoxDecoration(
                                    border:
                                        Border.all(color: Color(0xFFDBDBDB)),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.all(8),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              child: SvgPicture.asset(
                                                  'assets/images/Next_hearing.svg',
                                                  width: 32,
                                                  height: 32,
                                                  fit: BoxFit.contain),
                                            ),
                                            Text(
                                              'Next Hearing',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                      fontFamily:
                                                          'Plus Jakarta Sans',
                                                      letterSpacing: 0),
                                            ),
                                          ].divide(SizedBox(width: 12)),
                                        ),
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(right: 8),
                                            child: Text(
                                              _model.viewCase!
                                                          .nextHearingDate ==
                                                      null
                                                  ? '--'
                                                  : DateFormat('dd MMM yyyy')
                                                      .format(
                                                      DateTime.parse(_model
                                                          .viewCase!
                                                          .nextHearingDate!),
                                                    ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                          fontFamily: 'DM Sans',
                                                          fontSize: 20,
                                                          letterSpacing: 0,
                                                          fontWeight: FontWeight
                                                              .normal),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ).animateOnPageLoad(animationsMap[
                                    'containerOnPageLoadAnimation4']!),
                                DetailsScreenWidget(
                                  text:
                                      '${_model.viewCase!.isAdvocateApproved == true ? _model.viewCase?.advocate?.firstName ?? '--' : '---'} ${_model.viewCase!.isAdvocateApproved == true ? _model.viewCase?.advocate?.lastName ?? '' : '---'}',
                                  text2: _model.viewCase!.isAdvocateApproved ==
                                          true
                                      ? _model.viewCase?.advocate?.phone ?? '--'
                                      : '---',
                                  text4: _model.viewCase!.isAdvocateApproved ==
                                          true
                                      ? _model.viewCase?.advocate?.email ?? '--'
                                      : '---',
                                  text3:
                                      '${_model.viewCase?.legalAdvisor?.firstName ?? '--'} ${_model.viewCase?.legalAdvisor?.lastName ?? ''}',
                                  text5: _model.viewCase?.legalAdvisor?.phone ??
                                      '--',
                                  text6: _model.viewCase?.legalAdvisor?.email ??
                                      '--',
                                  imageUrl1: _model
                                      .viewCase?.legalAdvisor?.profilePic
                                      ?.toString(),
                                  imageUrl: _model
                                              .viewCase!.isAdvocateApproved ==
                                          true
                                      ? _model.viewCase?.advocate?.profilePic
                                      : 'https://as2.ftcdn.net/v2/jpg/03/96/34/51/1000_F_396345104_H3PeZe3jsAfNnKMBXDMjyrDsIjrtG6IO.jpg',
                                ),
                                HelpLineWidget(text: '1800-XXXX-XXXX')
                                    .animateOnPageLoad(animationsMap[
                                        'columnOnPageLoadAnimation']!)
                              ].divide(SizedBox(height: 20)),
                            ),
                          ),
                        ),
                      );
                    }
                  })),
        ),
      ),
    );
  }
}
