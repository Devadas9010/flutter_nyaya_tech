import 'package:get/get.dart';
import 'package:nyaya_tech/data_components/error_snackbar.dart';
import 'package:nyaya_tech/data_components/get_routing.dart';
import 'package:nyaya_tech/data_components/lines_text_filed.dart';
import 'package:nyaya_tech/data_components/shared_prefernce.dart';
import 'package:nyaya_tech/flutter_flow/flutter_flow_theme.dart';
import 'package:nyaya_tech/flutter_flow/flutter_flow_util.dart';
import 'package:nyaya_tech/flutter_flow/flutter_flow_widgets.dart';
import 'package:nyaya_tech/pages/login_page/description/other_issue/other_issue_model.dart';
import 'package:flutter/material.dart';

class OtherIssues extends StatefulWidget {
  const OtherIssues({super.key});

  @override
  State<OtherIssues> createState() => _OtherIssuesState();
}

class _OtherIssuesState extends State<OtherIssues> {
  late OtherIssuesModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController controller1 = TextEditingController();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OtherIssuesModel());
  }

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Container(
            decoration: BoxDecoration(color: Colors.white),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 24),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                          color: Colors.black, width: 1)),
                                  child: Padding(
                                    padding: EdgeInsets.all(10),
                                    child: Icon(Icons.arrow_back,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        size: 24),
                                  ),
                                ),
                              ),
                              Flexible(
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Container(
                                      decoration:
                                          BoxDecoration(color: Colors.black),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16, 6, 16, 6),
                                        child: Text(
                                          '3',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'DM Sans',
                                                color: Colors.white,
                                                fontSize: 20,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.normal,
                                              ),
                                        ),
                                      ),
                                    ),
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Step 3/3',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'DM Sans',
                                                color: Color(0xFFCA8A03),
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.normal,
                                              ),
                                        ),
                                        Text(
                                          'Type of Service',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Plus Jakarta Sans',
                                                color: Color(0xFF444444),
                                                fontSize: 16,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.normal,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ].divide(SizedBox(width: 10)),
                                ),
                              ),
                            ].divide(SizedBox(width: 7)),
                          ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              'About',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'DM Sans',
                                    color: Color(0xFFCA8A03),
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.normal,
                                  ),
                            ),
                            Icon(
                              Icons.arrow_downward_outlined,
                              color: Color(0xFFCA8A03),
                              size: 24,
                            ),
                          ],
                        ),
                        Flexible(
                          child: Container(
                              width: double.infinity,
                              child: DescriptionTextField(
                                lable: '',
                                controller: controller1,
                                errors: _model.errorInstance,
                                hintText: 'Description',
                                errorKey: 'description',
                                fillcolor: Color(0xFFF2F2F2),
                                color: Color(0xFFE0E0E0),
                              )),
                        ),
                      ]
                          .divide(SizedBox(height: 12))
                          .around(SizedBox(height: 12)),
                    ),
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 8, 20),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          FFButtonWidget(
                            onPressed: () async {
                              await _model.fetchAddCasede(
                                  servicetitle:
                                      SharedPrefernce.getservicetitle(),
                                  caseType: SharedPrefernce.getcasetitle(),
                                  issuetitle: SharedPrefernce.getcasetitle(),
                                  description: controller1.text.trim());
                              setState(() {});
                              if (!_model.error && _model.message.isNotEmpty) {
                                Get.offAllNamed(Routes.bottombar,
                                        arguments: {'currentIndex': 2});
                                errorSnackBar(context, _model.message);
                                SharedPrefernce.setservicetitle('');
                                SharedPrefernce.setcasetitle('');
                              }
                            },
                            text: 'Submit request',
                            options: FFButtonOptions(
                              height: 40,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  27, 10, 27, 10),
                              iconPadding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                              color: Colors.black,
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: 'DM Sans',
                                    color: Colors.white,
                                    fontSize: 16,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.normal,
                                  ),
                              elevation: 0,
                              borderSide: BorderSide(
                                color: Colors.black,
                                width: 0,
                              ),
                              borderRadius: BorderRadius.circular(0),
                            ),
                          ),
                        ].divide(SizedBox(width: 16)),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
