import 'package:flutter/material.dart';
import 'package:nyaya_tech/cases/cases_model.dart';
import 'package:nyaya_tech/components/case_card_widget.dart';
import 'package:nyaya_tech/flutter_flow/flutter_flow_util.dart';

class CasesWidget extends StatefulWidget {
  const CasesWidget({super.key});

  @override
  State<CasesWidget> createState() => _CasesWidgetState();
}

class _CasesWidgetState extends State<CasesWidget> {
  late CasesModel _model;
  ScrollController scrollController = ScrollController();
  bool isLoadingMore = false;
  int page = 1;
  int pageSize = 10;
  late Future<void> _future;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CasesModel());
    scrollController.addListener(_scrollListner);
    _future = fetchCasesdata(); // Initial fetch
  }

  Future<void> fetchCasesdata() async {
    if (page > _model.totalPages) return;

    final newCases = await _model.fetchAllCasesData(page, pageSize);
    setState(() {
      _model.caseData.addAll(newCases); // Append new data
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
      await fetchCasesdata();
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
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(16, 8, 16, 0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      'assets/images/Nyaya_logo.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
              Expanded(
                child: FutureBuilder(
                    future: _future,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                            child: CircularProgressIndicator(
                          color: Colors.black,
                        ));
                      } else {
                        return _model.caseData.isNotEmpty
                            ? ListView.builder(
                                controller: scrollController,
                                itemCount: _model.caseData.length + 1,
                                itemBuilder: (context, index) {
                                  if (index < _model.caseData.length) {
                                    return Padding(
                                      padding: const EdgeInsets.only(top: 12),
                                      child: CaseCardWidget(
                                        casedata: _model.caseData[index], 
                                      ),
                                    );
                                  }
                                  return null;
                                },
                              )
                            : const Center(child: Text('No - Cases'));
                      }
                    }),
              ),
              if (isLoadingMore)
                const Padding(
                  padding: EdgeInsets.only(top: 50, bottom: 50),
                  child: CircularProgressIndicator(
                    color: Colors.black,
                  ),
                )
            ].divide(const SizedBox(height: 24)),
          ),
        ),
      ),
    );
  }
}
