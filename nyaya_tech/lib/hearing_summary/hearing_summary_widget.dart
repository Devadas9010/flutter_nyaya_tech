import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nyaya_tech/components/hearing_summary_card_widget.dart';
import 'package:nyaya_tech/components/menu_item_card.dart';

import 'package:nyaya_tech/flutter_flow/flutter_flow_theme.dart';
import 'package:nyaya_tech/flutter_flow/flutter_flow_util.dart';
import 'package:nyaya_tech/hearing_summary/hearing_summary_model.dart';

import 'package:nyaya_tech/index.dart';
import 'package:popover/popover.dart';

class HearingSummaryWidget extends StatefulWidget {
  const HearingSummaryWidget({super.key});

  @override
  State<HearingSummaryWidget> createState() => _HearingSummaryWidgetState();
}

class _HearingSummaryWidgetState extends State<HearingSummaryWidget> {
  late HearingSummaryModel _model;
  ScrollController scrollController = ScrollController();
  int page = 1;
  int pageSize = 10;
  bool isLoadingMore = false;
  late Future<void> _future;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HearingSummaryModel());
    scrollController.addListener(_scrollListner);
    _future = fetchSummaryData();
  }

  Future<void> fetchSummaryData() async {
    if (page > _model.totalPages) return;

    final newNotes = await _model.FetchAllCasesHearingSummary(page, pageSize);
    setState(() {
      _model.CaseSummary.addAll(newNotes); // Append new data
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
      await fetchSummaryData();
    }
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
                                color: Colors.white.withOpacity(1.0),
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
                                color: Colors.white.withOpacity(0.5),
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
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: const Icon(Icons.arrow_back)),
                        ),
                      ),
                      Text(
                        'Hearing Summary',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'DM Sans',
                              color: const Color(0xFF181616),
                              fontSize: 16.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w500,
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
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {
                          context.pushNamed('Add_hearing_Summary');
                        },
                        child: Container(
                          decoration: const BoxDecoration(
                            color: Colors.black,
                          ),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                10, 8, 10, 8),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: SvgPicture.asset(
                                    'assets/images/signature.svg',
                                    fit: BoxFit.contain,
                                  ),
                                ),
                                Text(
                                  'Add',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'DM Sans',
                                        color: Colors.white,
                                        letterSpacing: 0,
                                        fontWeight: FontWeight.normal,
                                      ),
                                ),
                              ].divide(const SizedBox(width: 10)),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: FutureBuilder(
                      future: _future,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(
                            child: CircularProgressIndicator(
                              color: Colors.black,
                            ),
                          );
                        } else {
                          return _model.CaseSummary.isNotEmpty
                              ? ListView.builder(
                                  controller: scrollController,
                                  itemCount: _model.CaseSummary.length + 1,
                                  itemBuilder: (context, index) {
                                    if (index < _model.CaseSummary.length) {
                                      return Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: HearingSummaryCardWidget(
                                          caseSummary:
                                              _model.CaseSummary[index],
                                        ),
                                      );
                                    }
                                    return null;
                                  },
                                )
                              : const Center(
                                  child: Text('no Summary'),
                                );
                        }
                      },
                    ),



                    
                  ),
                  if (isLoadingMore)
                    const Padding(
                      padding: EdgeInsets.only(bottom: 50,top: 50),
                      child: CircularProgressIndicator(
                        color: Colors.black,
                      ),
                    )
                ]
                    .divide(const SizedBox(height: 12.0))
                    .around(const SizedBox(height: 12.0)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
