import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:nyaya_tech/data_components/shared_prefernce.dart';
import 'package:nyaya_tech/pages/login_page/empty_case/empty_case_widget.dart';
import 'package:nyaya_tech/pages/login_page/logs/cases/cases_model.dart';
import 'package:nyaya_tech/components/case_card_widget.dart';
import 'package:nyaya_tech/data_components/get_routing.dart';
import 'package:nyaya_tech/flutter_flow/flutter_flow_util.dart';
import 'package:nyaya_tech/response/list_cases_response.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CasesWidget extends StatefulWidget {
  const CasesWidget({super.key});

  @override
  State<CasesWidget> createState() => _CasesWidgetState();
}

class _CasesWidgetState extends State<CasesWidget> {
  late CasesModel _model;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final ScrollController _scrollController = ScrollController();
  late Future<void> _future;
  int page = 1;
  int limit = 20;
  bool ishasMoreLoading = false;
  bool isFetchingData = false;
  bool refreshLoading = false;
  bool hasMore = true;
  List<CaseCardData> caseDetailsData = [];

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CasesModel());
    _future = fetchdata();
    _scrollController.addListener(_loadMoreItems);
    print('fcm -- ${SharedPrefernce.getfcmToken()}');
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
    await _model.fetchCaseData(page: page, limit: limit);
    await _model.fetchCasesIssue();
  }

  Future<void> _refreshCases(BuildContext context) async {
    setState(() {
      refreshLoading = true;
      page = 1;
      hasMore = true;
    });
    try {
      var newData = await fetchdata();
      caseDetailsData.clear();
      setState(() {
        caseDetailsData.addAll(_model.caseData);
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
    return SafeArea(
      child: Scaffold(
        key: scaffoldKey,
        floatingActionButton:
            // SharedPrefernce.getUsertype() == 'user' ||
            //         _model.caseData.isNotEmpty
            //     ?
            FloatingActionButton.extended(
          icon: Icon(Icons.add, color: Colors.white),
          label: Text('New Case',
              style: TextStyle(
                  color: Colors.white, fontFamily: 'DM Sans', fontSize: 16)),
          backgroundColor: Color(0XFF000000),
          onPressed: () {
            Get.toNamed(Routes.step1);
          },
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.zero)),
        ),
        //  : Container(),
        backgroundColor: Colors.white,
        body: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(16, 8, 16, 0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(0),
                        child: SvgPicture.asset('assets/images/Nyaya_logo.svg',
                            fit: BoxFit.cover),
                      ),
                    ],
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
                          return _model.caseData.isNotEmpty
                              ? Padding(
                                  padding: const EdgeInsets.only(bottom: 50),
                                  child: RefreshIndicator(
                                    color: Colors.black,
                                    onRefresh: () => _refreshCases(context),
                                    child: Skeletonizer(
                                      enabled: refreshLoading,
                                      child: ListView.builder(
                                          physics:
                                              AlwaysScrollableScrollPhysics(),
                                          controller: _scrollController,
                                          padding: EdgeInsets.only(bottom: 8),
                                          itemCount: _model.caseData.length,
                                          itemBuilder: (contex, index) {
                                            return Padding(
                                              padding: const EdgeInsets.only(
                                                  bottom: 10),
                                              child: CaseCardWidget(
                                                casedata:
                                                    _model.caseData[index],
                                              )
                                                  .animate()
                                                  .fade(
                                                      curve: Curves.easeInOut,
                                                      delay: 0.ms,
                                                      duration: 700.ms,
                                                      begin: 0,
                                                      end: 1)
                                                  .slideY(begin: 0.3, end: 0.0),
                                            );
                                          }),
                                    ),
                                  ),
                                )
                              : EmptyCaseWidget(text: 'New Case.');
                        }
                      })),
              if (ishasMoreLoading)
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Center(
                      child: CircularProgressIndicator(
                    color: Colors.black,
                  )),
                ),
            ].divide(SizedBox(height: 24)),
          ),
        ),
      ),
    );
  }
}
