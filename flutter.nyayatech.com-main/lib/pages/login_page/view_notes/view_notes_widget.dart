import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:nyaya_tech/data_components/delete_component.dart';
import 'package:nyaya_tech/data_components/error_snackbar.dart';
import 'package:nyaya_tech/data_components/get_routing.dart';
import 'package:nyaya_tech/data_components/shared_prefernce.dart';
import 'package:nyaya_tech/flutter_flow/flutter_flow_animation.dart';
import 'package:nyaya_tech/flutter_flow/flutter_flow_theme.dart';
import 'package:nyaya_tech/flutter_flow/flutter_flow_util.dart';
import 'package:nyaya_tech/pages/login_page/view_notes/view_notes_model.dart';

class ViewNotesWidget extends StatefulWidget {
  const ViewNotesWidget({super.key});

  @override
  State<ViewNotesWidget> createState() => _ViewNotesWidgetState();
}

class _ViewNotesWidgetState extends State<ViewNotesWidget> {
  late ViewNotesModel _model;
  final animationsMap = <String, AnimationInfo>{};
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ViewNotesModel());
    animationsMap.addAll({
      'rowOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 700.0.ms,
            begin: Offset(0.0, 5.0),
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
      'textOnPageLoadAnimation1': AnimationInfo(
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
    await _model.fetchviewNotes();
  }

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Color(0XFFFFFFFF),
        body: Stack(
          children: [
            Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16, 8, 16, 10),
                child: FutureBuilder(
                    future: fetchdata(),
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
                      } else if (snapshot.hasData) {
                        return Center(child: Text('Somthing Went Wrong'));
                      } else {
                        return SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Get.back();
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        border: Border.all(
                                            color: Colors.black, width: 1),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.all(10),
                                        child: Icon(
                                          Icons.arrow_back,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          size: 24,
                                        ),
                                      ),
                                    ),
                                  ),
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
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Row(
                                          children: [
                                            Container(
                                              width: 40,
                                              height: 40,
                                              clipBehavior: Clip.antiAlias,
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle),
                                              child: Image.asset(
                                                  'assets/images/note_tite_pic.png',
                                                  fit: BoxFit.cover),
                                            ),
                                            Expanded(
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Text(
                                                    '${_model.viewNotes!.title}',
                                                    textAlign: TextAlign.start,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                            fontFamily:
                                                                'DM Sans',
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            fontSize: 14),
                                                  ),
                                                  Text(
                                                    DateFormat('dd MMM yyyy')
                                                        .format(_model
                                                            .viewNotes!
                                                            .createdAt!
                                                            .toLocal()),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                            fontFamily:
                                                                'DM Sans',
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            fontSize: 12,
                                                            color: Color(
                                                                0XFFEB5757)),
                                                  )
                                                ].divide(SizedBox(height: 6)),
                                              ),
                                            )
                                          ].divide(SizedBox(width: 6)),
                                        ),
                                      ),
                                    ],
                                  ).animateOnPageLoad(animationsMap[
                                      'rowOnPageLoadAnimation1']!),
                                  SizedBox(height: 12),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 80),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Text(
                                            '${_model.viewNotes!.note}',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                    fontFamily: 'DM Sans',
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.w400),
                                          ).animateOnPageLoad(animationsMap[
                                              'textOnPageLoadAnimation1']!),
                                        )
                                      ],
                                    ),
                                  )
                                ].divide(SizedBox(height: 10)),
                              ),
                            ].divide(SizedBox(height: 24)),
                          ),
                        );
                      }
                    })),
            SharedPrefernce.getcasesStatus() != 'CLOSURE'
                ? Align(
                    alignment: Alignment.bottomCenter,
                    child: SafeArea(
                      child: Container(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        padding: EdgeInsets.symmetric(vertical: 8),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Divider(
                              thickness: 2,
                              color: FlutterFlowTheme.of(context).alternate,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    SharedPrefernce.setnoteTitle(
                                        _model.viewNotes!.title.toString());
                                    SharedPrefernce.setnoteText(
                                        _model.viewNotes!.note.toString());
                                    Get.offNamed(Routes.editNote);
                                  },
                                  child: Row(
                                    children: [
                                      SvgPicture.asset('assets/images/edit.svg',
                                          fit: BoxFit.cover),
                                      SizedBox(width: 8),
                                      Text(
                                        'Edit',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                                fontFamily: 'DM Sans',
                                                color: Colors.black,
                                                fontSize: 16),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 42,
                                  child: VerticalDivider(
                                      thickness: 2, color: Color(0XFFBEBEBE)),
                                ),
                                InkWell(
                                  onTap: () async {
                                    await showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return DeletepopupWidget(
                                              delat: () async {
                                            await _model.fetchDeletenote();
                                            if (!_model.error &&
                                                _model.message.isNotEmpty) {
                                              Get.offNamed(Routes.notes);
                                              errorSnackBar(
                                                  context, _model.message);
                                            }
                                          });
                                        });
                                  },
                                  child: Row(
                                    children: [
                                      SvgPicture.asset(
                                        'assets/images/delete.svg',
                                        fit: BoxFit.cover,
                                      ),
                                      SizedBox(width: 8),
                                      Text(
                                        'Delete',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                                fontFamily: 'DM Sans',
                                                fontSize: 16,
                                                fontWeight: FontWeight.w400),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
