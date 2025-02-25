import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:nyaya_tech/components/check_list_card.dart';
import 'package:nyaya_tech/components/menu_item.dart';
import 'package:nyaya_tech/data_components/get_routing.dart';
import 'package:nyaya_tech/index.dart';
import 'package:nyaya_tech/pages/login_page/check_list/check_list_model.dart';
import 'package:nyaya_tech/response/checkList_response.dart';
import 'package:popover/popover.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ListofchecklistWidget extends StatefulWidget {
  const ListofchecklistWidget({super.key});

  @override
  State<ListofchecklistWidget> createState() => _ListofchecklistWidgetState();
}

class _ListofchecklistWidgetState extends State<ListofchecklistWidget>
    with TickerProviderStateMixin {
  late ListofchecklistModel _model;
  late Future<void> _future;
  int page = 1;
  int limit = 20;
  bool ishasMoreLoading = false;
  bool isFetchingData = false;
  bool refreshLoading = false;
  bool hasMore = true;
  final ScrollController _scrollController = ScrollController();
  List<CheckList> checklist = [];

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ListofchecklistModel());
    _future = fetchdata();
    _scrollController.addListener(_loadMoreItems);
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
    await _model.fetchCheckListData(page: page, limit: limit);
  }

  Future<void> _refreshCases(BuildContext context) async {
    setState(() {
      refreshLoading = true;
      page = 1;
      hasMore = true;
    });
    try {
      var newData = await fetchdata();
      checklist.clear();
      setState(() {
        checklist.addAll(_model.checklistdata);
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
    return GestureDetector(
      child: WillPopScope(
        onWillPop: () async {
          return false;
        },
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
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
                                    color: Colors.white.withOpacity(0.5),
                                    ontap: () {
                                      Navigator.push(
                                        context,
                                        PageTransition(
                                            type: PageTransitionType.fade,
                                            child: ViewCaseWidget()),
                                      );
                                    }),
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
                                    color: Colors.white,
                                    ontap: () {}),
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
                                MenuItem(
                                  text: 'Logs',
                                  color: Colors.white.withOpacity(0.5),
                                  ontap: () {
                                    Get.back();
                                    Navigator.push(
                                      context,
                                      PageTransition(
                                          type: PageTransitionType.fade,
                                          child: LogsWidget()),
                                    );
                                  },
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
          body: SafeArea(
            top: true,
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                        'List of Documents',
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
                              return _model.checklistdata.isNotEmpty
                                  ? Padding(
                                      padding: const EdgeInsets.only(
                                          top: 20, bottom: 50),
                                      child: RefreshIndicator(
                                        color: Colors.black,
                                        onRefresh: () => _refreshCases(context),
                                        child: Skeletonizer(
                                          enabled: refreshLoading,
                                          child: ListView.builder(
                                              physics:
                                                  AlwaysScrollableScrollPhysics(),
                                              controller: _scrollController,
                                              itemCount:
                                                  _model.checklistdata.length,
                                              itemBuilder: (context, index) {
                                                return Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          bottom: 8),
                                                  child: CheckListComponent(
                                                    checkList: _model
                                                        .checklistdata[index],
                                                  ),
                                                );
                                              }),
                                        ),
                                      ),
                                    )
                                  : Center(
                                      child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SvgPicture.asset(
                                            'assets/images/check_list.svg',
                                            height: 100,
                                            width: 100),
                                        Text('No-CheckList')
                                      ],
                                    ));
                            }
                          })),
                  if (ishasMoreLoading)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: Center(
                          child:
                              CircularProgressIndicator(color: Colors.black)),
                    ),
                ].divide(SizedBox(height: 16)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
