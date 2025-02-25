import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nyaya_tech/data_components/error_snackbar.dart';
import 'package:nyaya_tech/data_components/get_routing.dart';
import 'package:nyaya_tech/data_components/lines_text_filed.dart';
import 'package:nyaya_tech/data_components/shared_prefernce.dart';
import 'package:nyaya_tech/data_components/text_field_component.dart';
import 'package:nyaya_tech/pages/login_page/add_notes/add_notes_model.dart';
import 'package:nyaya_tech/flutter_flow/flutter_flow_theme.dart';
import 'package:nyaya_tech/flutter_flow/flutter_flow_util.dart';
import 'package:nyaya_tech/flutter_flow/flutter_flow_widgets.dart';

class AddNotesWidget extends StatefulWidget {
  const AddNotesWidget({super.key});

  @override
  State<AddNotesWidget> createState() => _AddNotesWidgetState();
}

class _AddNotesWidgetState extends State<AddNotesWidget> {
  late AddNotesModel _model;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AddNotesModel());
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
        backgroundColor: Colors.white,
        body: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          border: Border.all(color: Colors.black, width: 1),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: GestureDetector(
                            onTap: () {
                              Get.back();
                              controller1.clear();
                              controller2.clear();
                            },
                            child: Icon(Icons.arrow_back,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 24),
                          ),
                        ),
                      ),
                      Text(
                        'Add Notes',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'DM Sans',
                              color: Color(0xFF181616),
                              fontSize: 16,
                              letterSpacing: 0,
                              fontWeight: FontWeight.normal,
                            ),
                      ),
                    ].divide(SizedBox(width: 12)),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
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
                ],
              ),
              TextFieldComponent(
                controller: controller1,
                maxLine: 1,
                errorKey: 'title',
                label: 'Title *',
                hintText: 'Title',
                errors: _model.errorInstance,
              ),
              Flexible(
                child: DescriptionTextField(
                  lable: 'Note*',
                  controller: controller2,
                  errors: _model.errorInstance1,
                  hintText: 'Note',
                  errorKey: 'note',
                  color: Colors.black,
                  fillcolor: Color(0XFFF3F9FF),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 10, 20),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Flexible(
                      child: FFButtonWidget(
                        onPressed: () async {
                          await _model.fetchAddNotes(
                              caseid: SharedPrefernce.getcaseId(),
                              title: controller1.text.trim(),
                              note: controller2.text.trim(),
                              type: 'NOTE');
                          setState(() {});
                          if (!_model.error && _model.message.isNotEmpty) {
                            errorSnackBar(context, _model.message);
                            Get.offNamed(Routes.notes);
                            controller1.clear();
                            controller2.clear();
                          }
                        },
                        text: 'Save',
                        options: FFButtonOptions(
                          height: 40,
                          padding:
                              EdgeInsetsDirectional.fromSTEB(46, 10, 46, 10),
                          iconPadding:
                              EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                          color: Colors.black,
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    fontFamily: 'Quicksand',
                                    color: Colors.white,
                                    fontSize: 14,
                                    letterSpacing: 0,
                                    fontWeight: FontWeight.w500,
                                  ),
                          elevation: 0,
                          borderSide: BorderSide(
                            width: 0,
                          ),
                          borderRadius: BorderRadius.circular(0),
                        ),
                      ),
                    ),
                  ].divide(SizedBox(width: 16)),
                ),
              ),
            ].divide(SizedBox(height: 24)),
          ),
        ),
      ),
    );
  }
}
