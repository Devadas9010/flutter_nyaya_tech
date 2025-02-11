import 'package:nyaya_tech/chat_box/chat_box_widget.dart';
import 'package:nyaya_tech/components/menu_item_card.dart';
import 'package:nyaya_tech/files/files_widget.dart';
import 'package:nyaya_tech/hearing_summary/hearing_summary_widget.dart';
import 'package:nyaya_tech/notes_screen/notes_screen_widget.dart';
import 'package:nyaya_tech/view_case/view_case_widget.dart';
import 'package:popover/popover.dart';

import '/components/logs_cards_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'logs_model.dart';
export 'logs_model.dart';

class LogsWidget extends StatefulWidget {
  const LogsWidget({super.key});

  @override
  State<LogsWidget> createState() => _LogsWidgetState();
}

class _LogsWidgetState extends State<LogsWidget> {
  late LogsModel _model;
  ScrollController scrollController = ScrollController();
  bool isLoadingMore = false;
  int page = 1;
  int pageSize = 1;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LogsModel());
    scrollController.addListener(_scrollListner);
    fetchLogsData();
  }

  Future<void> fetchLogsData() async {
    if (page > _model.totalPages) return;

    final newLogs = await _model.fetchAllLogsData(page, pageSize);
    setState(() {
      _model.listlogs.addAll(newLogs); // Append new data
      page = _model.currentPage; // Update current page
      pageSize = _model.pageSize;
      isLoadingMore = false;
    });
  }

  Future<void> _scrollListner() async {
    if (scrollController.position.pixels ==
            scrollController.position.maxScrollExtent &&
        !isLoadingMore &&
        page < _model.totalPages) {
      setState(() {
        isLoadingMore = true;
      });
      page += 1;
      await fetchLogsData();
    }
  }

  @override
  void dispose() {
    _model.dispose();
    scrollController.dispose();
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
        floatingActionButton: SizedBox(
          height: 50,
          width: 50,
          child: Builder(
            builder: (context) => FloatingActionButton(
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.zero)),
              onPressed: () {
                showPopover(
                    context: context,
                    bodyBuilder: (context) => Container(
                          padding: const EdgeInsets.only(top: 30, bottom: 20),
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
                                      child: const ViewCaseWidget(),
                                    ),
                                  );
                                },
                              ),
                              MenuItem(
                                  text: 'Files',
                                  color: Colors.white.withOpacity(0.5),
                                  ontap: () {
                                    Navigator.pushReplacement(
                                        context,
                                        PageTransition(
                                          type: PageTransitionType.fade,
                                          child: const FilesWidget(),
                                        ));
                                  }),
                              MenuItem(
                                text: 'Chat Box',
                                color: Colors.white.withOpacity(0.5),
                                ontap: () {
                                  Navigator.pushReplacement(
                                    context,
                                    PageTransition(
                                      type: PageTransitionType.fade,
                                      child: const ChatBoxWidget(),
                                    ),
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
                                      child: const NotesScreenWidget(),
                                    ),
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
                                      child: const HearingSummaryWidget(),
                                    ),
                                  );
                                },
                              ),
                              MenuItem(
                                text: 'Logs',
                                color: Colors.white.withOpacity(1.0),
                                ontap: () {
                                  Navigator.pushReplacement(
                                    context,
                                    PageTransition(
                                      type: PageTransitionType.fade,
                                      child: const LogsWidget(),
                                    ),
                                  );
                                },
                              ),
                            ].divide(const SizedBox(height: 16)),
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
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        body: SafeArea(
          top: true,
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: Padding(
              padding:
                  const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          border: Border.all(
                            color: Colors.black,
                            width: 1.0,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(0),
                          child: IconButton(
                            icon: const Icon(Icons.arrow_back),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ),
                      ),
                      Text(
                        'Logs',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'DM Sans',
                              color: const Color(0xFF181616),
                              fontSize: 16.0,
                              letterSpacing: 0.0,
                              lineHeight: 1.6,
                            ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          border: Border.all(
                            color: Colors.black,
                            width: 1.0,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Icon(
                            Icons.help_outline_rounded,
                            color: FlutterFlowTheme.of(context).primaryText,
                            size: 24.0,
                          ),
                        ),
                      ),
                    ],
                  ),

                  Expanded(
                    child: _model.listlogs.isEmpty
                        ? const Center(
                            child: CircularProgressIndicator(
                            color: Colors.black,
                          ))
                        : ListView.builder(
                            controller: scrollController,
                            itemCount: _model.listlogs.length + 1,
                            itemBuilder: (context, index) {
                              if (index < _model.listlogs.length) {
                                return Padding(
                                  padding: const EdgeInsets.only(top: 12),
                                  child: LogsCardsWidget(
                                    caseLogs: _model.listlogs[index],
                                  ),
                                );
                              } else if (isLoadingMore) {
                                return const Padding(
                                  padding: EdgeInsets.only(top: 50, bottom: 50),
                                  child: Center(
                                    child: CircularProgressIndicator(
                                      color: Colors.black,
                                    ),
                                  ),
                                );
                              } else {
                                return const SizedBox();
                              }
                            },
                          ),
                  ),
                ].divide(const SizedBox(height: 24.0)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
