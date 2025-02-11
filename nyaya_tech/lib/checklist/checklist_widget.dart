import 'package:nyaya_tech/chat_box/chat_box_widget.dart';
import 'package:nyaya_tech/checklist/checklist_model.dart';
import 'package:nyaya_tech/components/case_card_widget.dart';
import 'package:nyaya_tech/components/checklist_card_widget.dart';
import 'package:nyaya_tech/components/menu_item_card.dart';
import 'package:nyaya_tech/files/files_widget.dart';
import 'package:nyaya_tech/hearing_summary/hearing_summary_widget.dart';
import 'package:nyaya_tech/logs/logs_widget.dart';
import 'package:nyaya_tech/notes_screen/notes_screen_widget.dart';
import 'package:nyaya_tech/view_case/view_case_widget.dart';
import 'package:popover/popover.dart';

import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ListofchecklistWidget extends StatefulWidget {
  const ListofchecklistWidget({super.key});

  @override
  State<ListofchecklistWidget> createState() => _ListofchecklistWidgetState();
}

class _ListofchecklistWidgetState extends State<ListofchecklistWidget>
    with TickerProviderStateMixin {
  late ListofchecklistModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ListofchecklistModel());

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();
  }

  Future<void> fetchData() async {
    await _model.fetchCheckListData();
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
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
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
                                  color: Colors.white.withOpacity(0.5),
                                  ontap: () {
                                    Navigator.pushReplacement(
                                      context,
                                      PageTransition(
                                          type: PageTransitionType.fade,
                                          child: const ViewCaseWidget()),
                                    );
                                  }),
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
                                color: Colors.white.withOpacity(1.0),
                                ontap: () {
                                  Navigator.pushReplacement(
                                    context,
                                    PageTransition(
                                        type: PageTransitionType.fade,
                                        child: const ListofchecklistWidget()),
                                  );
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
              child:
                  const Icon(Icons.menu_rounded, color: Colors.white, size: 32),
            ),
          ),
        ),
        body: SafeArea(
          top: true,
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Generated code for this Container Widget...
                      InkWell(
                        onTap: () {
                          context.pushNamed('View_case');
                        },
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
                            child: Icon(
                              Icons.arrow_back,
                              color: FlutterFlowTheme.of(context).primaryText,
                              size: 20,
                            ),
                          ),
                        ),
                      ),

                      Text(
                        'Checklist',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'DM Sans',
                              color: Color(0xFF181616),
                              fontSize: 16,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(0, 0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            border: Border.all(
                              color: FlutterFlowTheme.of(context).primaryText,
                            ),
                          ),
                          alignment: AlignmentDirectional(0, 0),
                          child: Padding(
                            padding: EdgeInsets.all(8),
                            child: FaIcon(
                              FontAwesomeIcons.questionCircle,
                              color: FlutterFlowTheme.of(context).primaryText,
                              size: 20,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: FutureBuilder(
                    future: fetchData(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(
                          child: CircularProgressIndicator(
                            color: Colors.black,
                          ),
                        );
                      } else if (snapshot.hasError) {
                        return Center(
                          child: Text('no connection'),
                        );
                      } else {
                        return _model.checklistdata.isNotEmpty
                            ? ListView.builder(
                                itemCount: _model.checklistdata.length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: ChecklistCardWidget(
                                      checklist: _model.checklistdata[index],
                                    ),
                                  );
                                },
                              )
                            : const Center(
                                child: Text('no Checklist'),
                              );
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
