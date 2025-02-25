import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:nyaya_tech/components/hearing_summary_card_widget.dart';
import 'package:nyaya_tech/components/menu_item.dart';
import 'package:nyaya_tech/data_components/get_routing.dart';
import 'package:nyaya_tech/data_components/shared_prefernce.dart';
import 'package:nyaya_tech/flutter_flow/flutter_flow_theme.dart';
import 'package:nyaya_tech/flutter_flow/flutter_flow_util.dart';
import 'package:nyaya_tech/pages/login_page/check_list/check_list_widget.dart';
import 'package:nyaya_tech/pages/login_page/hearing_summary/hearing_summary_model.dart';
import 'package:nyaya_tech/index.dart';
import 'package:nyaya_tech/response/case_summary_response.dart';
import 'package:popover/popover.dart';
import 'package:skeletonizer/skeletonizer.dart';

class HearingSummaryWidget extends StatefulWidget {
  const HearingSummaryWidget({super.key});

  @override
  State<HearingSummaryWidget> createState() => _HearingSummaryWidgetState();
}

class _HearingSummaryWidgetState extends State<HearingSummaryWidget> {
  late HearingSummaryModel _model;
  late Future<void> _future;
  int page = 1;
  int limit = 20;
  bool ishasMoreLoading = false;
  bool isFetchingData = false;
  bool refreshLoading = false;
  bool hasMore = true;
  final ScrollController _scrollController = ScrollController();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  List<CaseSummary> casesumm = [];

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HearingSummaryModel());
    _scrollController.addListener(_loadMoreItems);
    _future = fetechdata();
  }

  void _loadMoreItems() {
    if (isFetchingData || _model.current_page >= _model.total_pages) {
      return;
    }

    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      setState(() {
        isFetchingData = true;
        ishasMoreLoading = true;
      });

      page += 1;

      fetechdata().then((_) {
        setState(() {
          isFetchingData = false;
          ishasMoreLoading = false;
        });
      }).catchError((error) {
        setState(() {
          isFetchingData = false;
          ishasMoreLoading = false;
        });
      });
    }
  }

  Future<void> fetechdata() async {
    await _model.fetchHearingSummary(page: page, limit: limit);
  }

  Future<void> _refreshSummary(BuildContext context) async {
    setState(() {
      refreshLoading = true;
      page = 1;
      hasMore = true;
    });
    try {
      var newData = await fetechdata();
      casesumm.clear();
      setState(() {
        casesumm.addAll(_model.caseSummary);
        refreshLoading = false;
      });
      return newData;
    } catch (e) {}
    setState(() {
      refreshLoading = false;
    });
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
          floatingActionButton: Container(
            height: 50,
            width: 50,
            child: Builder(
              builder: (context) => FloatingActionButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.zero)),
                onPressed: () {
                  showPopover(
                      context: context,
                      bodyBuilder: (context) => Container(
                            padding: EdgeInsets.only(top: 30, left: 20),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                MenuItem(
                                  text: 'Case Details',
                                  color: Colors.white.withOpacity(0.5),
                                  ontap: () {
                                    Get.back();
                                    Navigator.push(
                                      context,
                                      PageTransition(
                                        type: PageTransitionType.fade,
                                        child: ViewCaseWidget(),
                                      ),
                                    );
                                  },
                                ),
                                MenuItem(
                                  text: 'Files',
                                  color: Colors.white.withOpacity(0.5),
                                  ontap: () {
                                    Get.back();
                                    Navigator.push(
                                      context,
                                      PageTransition(
                                        type: PageTransitionType.fade,
                                        child: FilesWidget(),
                                      ),
                                    );
                                  },
                                ),
                                // MenuItem(
                                //     text: 'List of Documents',
                                //     color: Colors.white.withOpacity(0.5),
                                //     ontap: () {
                                //       Get.back();
                                //       Navigator.push(
                                //         context,
                                //         PageTransition(
                                //             type: PageTransitionType.fade,
                                //             child: ListofchecklistWidget()),
                                //       );
                                //     }),
                                MenuItem(
                                  text: 'Chat Box',
                                  color: Colors.white.withOpacity(0.5),
                                  ontap: () {
                                    Get.back();
                                    Navigator.push(
                                      context,
                                      PageTransition(
                                        type: PageTransitionType.fade,
                                        child: ChatBoxWidget(),
                                      ),
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
                                        child: NotesScreenWidget(),
                                      ),
                                    );
                                  },
                                ),
                                MenuItem(
                                  text: 'Hearing Summary',
                                  color: Colors.white,
                                  ontap: () {},
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
          key: scaffoldKey,
          backgroundColor: Colors.white,
          body: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(Routes.bottombar,
                            arguments: {'currentIndex': 2});
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          border: Border.all(color: Colors.black, width: 1),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Icon(Icons.arrow_back,
                              color: FlutterFlowTheme.of(context).primaryText,
                              size: 24),
                        ),
                      ),
                    ),
                    Text(
                      'Hearing Summary',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'DM Sans',
                            color: Color(0xFF181616),
                            fontSize: 16,
                            letterSpacing: 0,
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        border: Border.all(color: Colors.black, width: 1),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Icon(Icons.help_outline_rounded,
                            color: FlutterFlowTheme.of(context).primaryText,
                            size: 24),
                      ),
                    ),
                  ],
                ),
                SharedPrefernce.getUsertype() == 'lawyer'
                    ? Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Get.toNamed(Routes.addHearingNotes);
                            },
                            child: Container(
                              decoration: BoxDecoration(color: Colors.black),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10, 8, 10, 8),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(8),
                                      child: SvgPicture.asset(
                                        'assets/images/letter.svg',
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
                                  ].divide(SizedBox(width: 10)),
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    : Container(height: 0),
                Expanded(
                    child: FutureBuilder(
                        future: _future,
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
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
                            return _model.caseSummary.isNotEmpty
                                ? RefreshIndicator(
                                    onRefresh: () => _refreshSummary(context),
                                    child: Skeletonizer(
                                      enabled: refreshLoading,
                                      child: ListView.builder(
                                          physics:
                                              AlwaysScrollableScrollPhysics(),
                                          controller: _scrollController,
                                          itemCount: _model.caseSummary.length,
                                          itemBuilder: (context, index) {
                                            return Padding(
                                              padding: const EdgeInsets.only(
                                                  bottom: 10),
                                              child: HearingSummaryCardWidget(
                                                      caseSummary: _model
                                                          .caseSummary[index])
                                                  .animate()
                                                  .fade(
                                                      curve: Curves.easeInOut,
                                                      delay: 0.ms,
                                                      duration: 700.ms,
                                                      begin: 0,
                                                      end: 1)
                                                  .slideY(begin: 0.5, end: 0.0),
                                            );
                                          }),
                                    ),
                                  )
                                : Center(
                                    child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SvgPicture.asset(
                                        'assets/images/No_Summary1.svg',
                                        height: 100,
                                        width: 100,
                                      ),
                                      Text('No-Summary')
                                    ],
                                  ));
                          }
                        })),
                if (ishasMoreLoading)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: CircularProgressIndicator(color: Colors.black),
                  )
              ].divide(SizedBox(height: 12)).around(SizedBox(height: 12)),
            ),
          ),
        ),
      ),
    );
  }
}
