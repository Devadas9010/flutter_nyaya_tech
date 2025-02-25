import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:nyaya_tech/components/logs_cards_widget.dart';
import 'package:nyaya_tech/components/menu_item.dart';
import 'package:nyaya_tech/data_components/get_routing.dart';
import 'package:nyaya_tech/flutter_flow/flutter_flow_theme.dart';
import 'package:nyaya_tech/flutter_flow/flutter_flow_util.dart';
import 'package:nyaya_tech/index.dart';
import 'package:nyaya_tech/pages/login_page/check_list/check_list_widget.dart';
import 'package:nyaya_tech/pages/login_page/logs/logs_model.dart';
import 'package:nyaya_tech/response/case_logs_response.dart';
import 'package:popover/popover.dart';
import 'package:skeletonizer/skeletonizer.dart';

class LogsWidget extends StatefulWidget {
  const LogsWidget({super.key});

  @override
  State<LogsWidget> createState() => _LogsWidgetState();
}

class _LogsWidgetState extends State<LogsWidget> {
  late LogsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  int page = 1;
  int limit = 20;
  bool ishasMoreLoading = false;
  bool isFetchingData = false;
  final ScrollController _scrollController = ScrollController();
  late Future<void> _future;
  bool refreshLoading = false;
  bool hasMore = true;
  List<CaseLogs> caselog = [];

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LogsModel());
    _scrollController.addListener(_loadMoreItems);
    _future = fetchdata();
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

      fetchdata().then((_) {
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

  Future<void> fetchdata() async {
    await _model.fetchLogs(page: page, limit: limit);
  }

  Future<void> _refreshLog(BuildContext context) async {
    setState(() {
      refreshLoading = true;
      page = 1;
      hasMore = true;
    });
    try {
      var newData = await fetchdata();
      caselog.clear();
      setState(() {
        caselog.addAll(_model.caselogs);
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
                            padding: EdgeInsets.only(top: 30, bottom: 20),
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
                                          child: ViewCaseWidget()),
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
                                  color: Colors.white.withOpacity(0.5),
                                  ontap: () {
                                    Get.back();
                                    Navigator.push(
                                      context,
                                      PageTransition(
                                        type: PageTransitionType.fade,
                                        child: HearingSummaryWidget(),
                                      ),
                                    );
                                  },
                                ),
                                MenuItem(
                                  text: 'Logs',
                                  color: Colors.white,
                                  ontap: () {},
                                ),
                              ].divide(SizedBox(height: 16)),
                            ),
                          ),
                      direction: PopoverDirection.right,
                      width: 250,
                      height: 270,
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
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          body: Container(
            decoration: BoxDecoration(color: Colors.white),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 0),
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
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
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
                        'Logs',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'DM Sans',
                              color: Color(0xFF181616),
                              fontSize: 16,
                              letterSpacing: 0,
                              lineHeight: 1.6,
                            ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          border: Border.all(
                            color: Colors.black,
                            width: 1,
                          ),
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
                              return RefreshIndicator(
                                onRefresh: () => _refreshLog(context),
                                child: Skeletonizer(
                                  enabled: refreshLoading,
                                  child: Padding(
                                    padding: const EdgeInsets.only(bottom: 60),
                                    child: ListView.builder(
                                            physics:
                                                AlwaysScrollableScrollPhysics(),
                                            controller: _scrollController,
                                            itemCount: _model.caselogs.length,
                                            itemBuilder: (context, index) {
                                              return Padding(
                                                padding:
                                                    const EdgeInsets.all(10),
                                                child: LogsCardsWidget(
                                                    caseLogs:
                                                        _model.caselogs[index]),
                                              );
                                            })
                                        .animate()
                                        .fade(
                                            curve: Curves.easeInOut,
                                            delay: 0.ms,
                                            duration: 700.ms,
                                            begin: 0,
                                            end: 1)
                                        .slideY(begin: 0.3, end: 0.0),
                                  ),
                                ),
                              );
                            }
                          })),
                  if (ishasMoreLoading)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: CircularProgressIndicator(color: Colors.black),
                    )
                ].divide(SizedBox(height: 24)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
