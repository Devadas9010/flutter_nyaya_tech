import 'package:nyaya_tech/checklist/checklist_widget.dart';
import 'package:nyaya_tech/checklist/view_checklist_model.dart';
import 'package:nyaya_tech/data_components/shared_preference.dart';
import 'package:nyaya_tech/data_components/text_field_components.dart';

import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';

class ViewChecklistWidget extends StatefulWidget {
  const ViewChecklistWidget({super.key});

  @override
  State<ViewChecklistWidget> createState() => _ViewChecklistWidgetState();
}

class _ViewChecklistWidgetState extends State<ViewChecklistWidget> {
  TextEditingController controller = TextEditingController();
  TextEditingController controller1 = TextEditingController();

  late ViewChecklistModel _model;
  late Future<void> _future1;
  Future<void>? _future2;
  bool isLoading = true;
  String displayText = '';

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
    _model = createModel(context, () => ViewChecklistModel());
    _future1 = fetchData();
    _future2 = fetchChecklistData();
    controller1.text = SharedPrefernce.getResponse();
    displayText = controller1.text;
  }

  Future<void> fetchData() async {
    await _model.fetchViewChecklist();
  }

  Future<void> fetchChecklistData() async {
    await _model.fetchGetChecklistData();
  }

  @override
  void dispose() {
    _model.controller.dispose();
    _model.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 16, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Center(
                        child: Text('View Checklist'),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push<void>(
                          context,
                          MaterialPageRoute<void>(
                            builder: (BuildContext context) =>
                                const ListofchecklistWidget(),
                          ),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.close_sharp,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 24,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Divider(
                thickness: 1.5,
                color: FlutterFlowTheme.of(context).alternate,
              ),
              Expanded(
                child: FutureBuilder(
                  future: _future1,
                  builder: (context, snapshot1) {
                    if (snapshot1.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator(
                          color: Colors.black,
                        ),
                      );
                    } else if (snapshot1.hasError) {
                      return Center(
                        child: Text('no connection'),
                      );
                    } else {
                      return SingleChildScrollView(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.square_outlined,
                              color: FlutterFlowTheme.of(context).primaryText,
                              size: 15,
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    _model.checkListData?.desc ?? '--',
                                    textAlign: TextAlign.left,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'DM Sans',
                                          color: const Color(0xFF181616),
                                          fontSize: 15,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.normal,
                                        ),
                                  ),
                                  const SizedBox(height: 20),
                                  FutureBuilder(
                                    future: _future2,
                                    builder: (context, snapshot2) {
                                      if (snapshot2.connectionState ==
                                          ConnectionState.waiting) {
                                        return Center(
                                          child: CircularProgressIndicator(
                                            color: Colors.black,
                                          ),
                                        );
                                      } else if (snapshot2.hasError) {
                                        return Center(
                                          child: Text('no connection'),
                                        );
                                      } else {
                                        return Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            if (displayText.isNotEmpty) ...[
                                              Expanded(
                                                child: TextFieldComponent(
                                                  controller: controller,
                                                  hintText: 'Enter answer here',
                                                ),
                                              ),
                                              const SizedBox(width: 10),
                                              FFButtonWidget(
                                                text: isLoading
                                                    ? 'Add'
                                                    : 'Update',
                                                onPressed: () async {
                                                  if (isLoading) {
                                                    await _model
                                                        .fetchCreateChecklistResponse(
                                                      response: controller.text
                                                          .trim(),
                                                    );
                                                  } else {
                                                    await _model
                                                        .fetchUpdateChecklistResponse(
                                                      response: controller.text
                                                          .trim(),
                                                    );
                                                    await _model
                                                        .fetchGetChecklistData();

                                                    isLoading = true;
                                                  }

                                                  setState(() {
                                                    if (isLoading) {
                                                      displayText = '';
                                                      isLoading = true;
                                                    } else {
                                                      displayText =
                                                          controller1.text;
                                                      isLoading = true;
                                                    }
                                                  });
                                                },
                                                options: FFButtonOptions(
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ] else if (displayText.isEmpty) ...[
                                              Expanded(
                                                child: Text(
                                                  controller.text
                                                          .trim()
                                                          .isNotEmpty
                                                      ? controller.text.trim()
                                                      : _model.getchecklistData
                                                              ?.response ??
                                                          '',
                                                ),
                                              ),
                                              const SizedBox(width: 10),
                                              InkWell(
                                                onTap: () {
                                                  setState(() {
                                                    isLoading = false;
                                                    displayText =
                                                        controller.text.trim();
                                                  });
                                                },
                                                child: Text(
                                                  'Edit',
                                                  style: TextStyle(
                                                    decoration: TextDecoration
                                                        .underline,
                                                  ),
                                                ),
                                              ),
                                            ]
                                          ],
                                        );
                                      }
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
