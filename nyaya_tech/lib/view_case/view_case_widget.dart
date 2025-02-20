import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nyaya_tech/components/details_screen_widget.dart';
import 'package:nyaya_tech/components/menu_item_card.dart';
import 'package:nyaya_tech/flutter_flow/flutter_flow_theme.dart';
import 'package:nyaya_tech/flutter_flow/flutter_flow_util.dart';
import 'package:nyaya_tech/index.dart';
import 'package:nyaya_tech/view_case/help_line.dart';
import 'package:nyaya_tech/view_case/view_case_model.dart';
import 'package:nyaya_tech/view_case/view_status_widget.dart';
import 'package:popover/popover.dart';

class ViewCaseWidget extends StatefulWidget {
  const ViewCaseWidget({super.key});

  @override
  State<ViewCaseWidget> createState() => _ViewCaseWidgetState();
}

class _ViewCaseWidgetState extends State<ViewCaseWidget> {
  late ViewCaseModel _model;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ViewCaseModel());
  }

  Future<void> fetchViewCasedata() async {
    await _model.fetchViewCase();
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
          backgroundColor: const Color(0XFFFFFFFF),
          floatingActionButton: Builder(
            builder: (context) => SizedBox(
              height: 50,
              width: 50,
              child: FloatingActionButton(
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.zero)),
                onPressed: () {
                  showPopover(
                      context: context,
                      bodyBuilder: (context) => Padding(
                            padding: const EdgeInsets.only(top: 10, bottom: 0),
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
                                    Navigator.pushReplacement(
                                      context,
                                      PageTransition(
                                          type: PageTransitionType.fade,
                                          child: const FilesWidget()),
                                    );
                                  },
                                ),
                                MenuItem(
                                  text: 'Checklist',
                                  color: Colors.white.withOpacity(0.5),
                                  ontap: () {
                                    context.pushNamed('checklist');
                                  },
                                ),
                                MenuItem(
                                  text: 'Chat Box',
                                  color: Colors.white.withOpacity(0.5),
                                  ontap: () {
                                    Navigator.pushReplacement(
                                      context,
                                      PageTransition(
                                          type: PageTransitionType.fade,
                                          child: const ChatBoxWidget()),
                                    );
                                  },
                                ),
                                MenuItem(
                                  text: 'Notes',
                                  color: Colors.white.withOpacity(0.5),
                                  ontap: () {
                                    Navigator.pushReplacement(
                                      context,
                                      PageTransition(
                                          type: PageTransitionType.fade,
                                          child: const NotesScreenWidget()),
                                    );
                                  },
                                ),
                                MenuItem(
                                  text: 'Hearing Summary',
                                  color: Colors.white.withOpacity(0.5),
                                  ontap: () {
                                    Navigator.pushReplacement(
                                      context,
                                      PageTransition(
                                          type: PageTransitionType.fade,
                                          child: const HearingSummaryWidget()),
                                    );
                                  },
                                ),
                                MenuItem(
                                  text: 'Logs',
                                  color: Colors.white.withOpacity(0.5),
                                  ontap: () {
                                    Navigator.pushReplacement(
                                      context,
                                      PageTransition(
                                          type: PageTransitionType.fade,
                                          child: const LogsWidget()),
                                    );
                                  },
                                ),
                              ].divide(const SizedBox(height: 13)),
                            ),
                          ),
                      direction: PopoverDirection.left,
                      width: 250,
                      height: 230,
                      arrowHeight: 15,
                      arrowWidth: 30,
                      backgroundColor: Colors.black);
                },
                backgroundColor: Colors.black,
                elevation: 8,
                child: const Icon(Icons.menu_rounded,
                    color: Colors.white, size: 32),
              ),
            ),
          ),
          body: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 0),
              child: FutureBuilder(
                  future: fetchViewCasedata(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                          child:
                              CircularProgressIndicator(color: Colors.black));
                    } else if (snapshot.hasError) {
                      return Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              'assets/images/no_internet.svg',
                              height: 100,
                              width: 100,
                            ),
                            const Text('No-Connection',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500))
                          ],
                        ),
                      );
                    } else {
                      String orginalText = _model.viewcase?.status ?? '--';
                      String formattedText = orginalText.replaceAll("_", " ");
                      return SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GestureDetector(
                                    onTap: () {
                                      // Get.toNamed(Routes.bottombar,
                                      //     arguments: {'currentIndex': 2});
                                    },
                                    child: // Generated code for this Container Widget...
                                        InkWell(
                                      onTap: () {
                                        context.pushNamed('bottomBar');
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          border: Border.all(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                          ),
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.all(8),
                                          child: Icon(
                                            Icons.arrow_back,
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            size: 20,
                                          ),
                                        ),
                                      ),
                                    )),
                                // Generated code for this Container Widget...
                                Container(
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    border: Border.all(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(8),
                                    child: Icon(
                                      Icons.help_outline_rounded,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      size: 20,
                                    ),
                                  ),
                                )
                              ],
                            ),
                            Flexible(
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SvgPicture.asset('assets/images/Calendar.svg',
                                      height: 20, width: 20),
                                  Text(
                                    DateFormat('dd MMM yyyy').format(
                                        _model.viewcase!.createdAt!.toLocal()),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                            fontFamily: 'DM Sans',
                                            color: Colors.black,
                                            letterSpacing: 0,
                                            fontWeight: FontWeight.normal),
                                  ),
                                ].divide(const SizedBox(width: 8)),
                              ),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Expanded(
                                        child: _model.viewcase!.description ==
                                                null
                                            ? Text(
                                                _model.viewcase!.issue!
                                                        .issueTitle ??
                                                    '--',
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                        fontFamily: 'DM Sans',
                                                        color: Colors.black,
                                                        fontSize: 18,
                                                        letterSpacing: 0,
                                                        fontWeight:
                                                            FontWeight.normal),
                                              )
                                            : Text(
                                                _model.viewcase?.description ??
                                                    '--',
                                                style: TextStyle(
                                                    fontFamily: 'DM Sans',
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 14,
                                                    color:
                                                        const Color(0XFF000000)
                                                            .withOpacity(0.5)),
                                              ),
                                      ),
                                      InkWell(
                                          onTap: () {
                                            Navigator.push<void>(
                                              context,
                                              MaterialPageRoute<void>(
                                                builder: (BuildContext
                                                        context) =>
                                                    const ViewStatusWidget(),
                                              ),
                                            );
                                          },
                                          child: Row(
                                            children: [
                                              Icon(Icons.remove_red_eye),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Text('View Status'),
                                            ],
                                          ))
                                    ],
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
                                    color: Color(0xFFFFEECC),
                                  ),
                                  child: Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            24, 8, 24, 8),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Text(
                                          _model.viewcase?.priority ?? '--',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'DM Sans',
                                                color: const Color(0xFFFF5C00),
                                                letterSpacing: 0,
                                                fontWeight: FontWeight.normal,
                                              ),
                                        ),
                                        // Icon(
                                        //   Icons.arrow_drop_down,
                                        //   color: FlutterFlowTheme.of(context)
                                        //       .primaryText,
                                        //   size: 24,
                                        // ),
                                      ].divide(const SizedBox(width: 10)),
                                    ),
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    border: Border.all(
                                        color: const Color(0x33000000),
                                        width: 1),
                                  ),
                                  child: Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            24, 8, 24, 8),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Text(
                                          formattedText,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Plus Jakarta Sans',
                                                color: const Color(0xFFFF5C00),
                                                letterSpacing: 0,
                                              ),
                                        ),
                                        // Icon(
                                        //   Icons.arrow_drop_down,
                                        //   color: FlutterFlowTheme.of(context)
                                        //       .primaryText,
                                        //   size: 24,
                                        // ),
                                      ].divide(const SizedBox(width: 12)),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                border: Border.all(
                                  color: const Color(0xFFDBDBDB),
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.all(14),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(8),
                                      child: SvgPicture.asset(
                                          'assets/images/Case_type.svg',
                                          width: 16,
                                          height: 16,
                                          fit: BoxFit.contain),
                                    ),
                                    Expanded(
                                      child: Text(
                                        _model.viewcase?.issue?.caseType ??
                                            '--',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                                fontFamily: 'DM Sans',
                                                letterSpacing: 0,
                                                fontWeight: FontWeight.normal),
                                      ),
                                    ),
                                  ].divide(const SizedBox(width: 12)),
                                ),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                border:
                                    Border.all(color: const Color(0xFFDBDBDB)),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsetsDirectional.all(8),
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
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                  fontFamily:
                                                      'Plus Jakarta Sans',
                                                  letterSpacing: 0),
                                        ),
                                      ].divide(const SizedBox(width: 12)),
                                    ),
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 8),
                                        child: Text(
                                          _model.viewcase!.nextHearingDate ==
                                                  null
                                              ? '--'
                                              : DateFormat('dd MMM yyyy')
                                                  .format(DateTime.parse(_model
                                                      .viewcase!
                                                      .nextHearingDate)),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                  fontFamily: 'DM Sans',
                                                  fontSize: 20,
                                                  letterSpacing: 0,
                                                  fontWeight:
                                                      FontWeight.normal),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            DetailsScreenWidget(
                              text:
                                  '${_model.viewcase!.lawyer?.firstName ?? '--'} ${_model.viewcase!.lawyer?.lastName ?? '--'}',
                              text1:
                                  _model.viewcase!.lawyer?.designation ?? '--',
                              text2: _model.viewcase!.lawyer?.phone ?? '--',
                              text4: _model.viewcase!.lawyer?.email ?? '--',
                              text3:
                                  '${_model.viewcase!.user?.firstName ?? '--'} ${_model.viewcase!.user?.lastName ?? '--'}',
                              text5: _model.viewcase!.user!.phone == null
                                  ? '--'
                                  : _model.viewcase!.user?.phone ?? '--',
                              text6: _model.viewcase!.user?.email ?? '--',
                              imageUrl1: _model.viewcase!.user?.profilePic ??
                                  'https://images.unsplash.com/photo-1640960543409-dbe56ccc30e2?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHw1fHx1c2VyfGVufDB8fHx8MTczNDM5MTUyMXww&ixlib=rb-4.0.3&q=80&w=1080',
                              imageUrl: _model.viewcase!.lawyer?.profilePic ??
                                  'https://static.vecteezy.com/system/resources/thumbnails/053/545/258/small/courtroom-scene-with-lawyer-presenting-argument-judge-observing-tense-and-focused-atmosphere-photo.jpg',
                            ),
                            const HelpLineWidget(text: '1800-XXXX-XXXX')
                          ].divide(const SizedBox(height: 20)),
                        ),
                      );
                    }
                  })),
        ),
      ),
    );
  }
}
