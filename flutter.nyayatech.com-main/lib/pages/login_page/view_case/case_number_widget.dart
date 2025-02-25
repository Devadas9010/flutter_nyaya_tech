import 'package:flutter/material.dart';
import 'package:nyaya_tech/flutter_flow/flutter_flow_theme.dart';
import 'package:nyaya_tech/flutter_flow/flutter_flow_util.dart';

class CaseNumberWidget extends StatefulWidget {
  const CaseNumberWidget({super.key});

  @override
  State<CaseNumberWidget> createState() => _CaseNumberWidgetState();
}

class _CaseNumberWidgetState extends State<CaseNumberWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
  }

  int selectedIndex = 0;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
            borderRadius: BorderRadius.circular(1),
            border: Border.all(color: Color(0xFFDBDBDB)),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 8),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        SizedBox(
                          height: 20,
                          child: VerticalDivider(
                              thickness: 2,
                              color: selectedIndex == 0
                                  ? Colors.black
                                  : Colors.white),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              selectedIndex = 0;
                            });
                          },
                          child: Text(
                            'CASE Number',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                    fontFamily: 'Plus Jakarta Sans',
                                    letterSpacing: 0.0,
                                    color: selectedIndex == 0
                                        ? Colors.black
                                        : Color(0XFF000000).withOpacity(0.5)),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        SizedBox(
                          height: 20,
                          child: VerticalDivider(
                              thickness: 2,
                              color: selectedIndex == 1
                                  ? Colors.black
                                  : Colors.white),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              selectedIndex = 1;
                            });
                          },
                          child: Text(
                            'CNR Number',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                    fontFamily: 'Plus Jakarta Sans',
                                    letterSpacing: 0.0,
                                    color: selectedIndex == 1
                                        ? Colors.black
                                        : Color(0XFF000000).withOpacity(0.5)),
                          ),
                        ),
                      ],
                    ),
                  ].divide(SizedBox(height: 8)),
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Color(0xFFF2F2F2),
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(20, 8, 20, 8),
                      child: Text(
                        '#2165496231656',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Plus Jakarta Sans',
                              letterSpacing: 0.0,
                            ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ].divide(SizedBox(height: 8)),
    );
  }
}
