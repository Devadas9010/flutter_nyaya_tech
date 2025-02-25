import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nyaya_tech/data_components/date_component.dart';
import 'package:nyaya_tech/data_components/error_snackbar.dart';
import 'package:nyaya_tech/data_components/get_routing.dart';
import 'package:nyaya_tech/data_components/lines_text_filed.dart';
import 'package:nyaya_tech/data_components/shared_prefernce.dart';
import 'package:nyaya_tech/pages/login_page/add_hearing_summary/add_hearing_summary_model.dart';
import 'package:nyaya_tech/flutter_flow/flutter_flow_theme.dart';
import 'package:nyaya_tech/flutter_flow/flutter_flow_util.dart';
import 'package:nyaya_tech/flutter_flow/flutter_flow_widgets.dart';

class UpdateSummaryWidget extends StatefulWidget {
  const UpdateSummaryWidget({super.key});

  @override
  State<UpdateSummaryWidget> createState() => _UpdateSummaryWidgetState();
}

class _UpdateSummaryWidgetState extends State<UpdateSummaryWidget> {
  late AddHearingSummaryModel _model;
  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AddHearingSummaryModel());
    String initialDate = SharedPrefernce.getSummaryUp();
    if (initialDate.isNotEmpty) {
      DateTime parsedDate = DateTime.parse(initialDate);
      controller1.text = DateFormat('dd-MM-yyyy').format(parsedDate);
    }
    controller2.text = SharedPrefernce.getsummaryText();
  }

  String date = '';

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: SafeArea(
        top: true,
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      border: Border.all(color: Colors.black, width: 1),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: Icon(Icons.arrow_back,
                            color: FlutterFlowTheme.of(context).primaryText,
                            size: 24),
                      ),
                    ),
                  ),
                  Text(
                    'Add Hearing Summary',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'DM Sans',
                        color: Color(0xFF181616),
                        fontSize: 16,
                        letterSpacing: 0,
                        fontWeight: FontWeight.w500),
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
              Container(
                width: double.infinity,
                child: TextFeild_DatePicker(
                    firstDate: DateTime(2000),
                    lastDate: DateTime.now(),
                    dateCallback: (value) {
                      SharedPrefernce.setSummary(date = value);
                    },
                    dateController: controller1,
                    lable: 'Date *',
                    errorKey: 'date',
                    errors: _model.errorInstance),
              ),
              Flexible(
                child: Container(
                    width: double.infinity,
                    child: DescriptionTextField(
                      lable: 'Summary *',
                      controller: controller2,
                      errors: _model.errorInstance1,
                      hintText: 'Write Summary',
                      errorKey: 'note',
                      color: Colors.black,
                      fillcolor: Color(0XFFF3F9FF),
                    )),
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
                          String dated = controller1.text.trim();

                          try {
                            // Check and validate the date string format
                            if (dated.isEmpty ||
                                !RegExp(r'^\d{2}-\d{2}-\d{4}$')
                                    .hasMatch(dated)) {
                              throw FormatException(
                                  "Invalid date format. Use 'dd-MM-yyyy'.");
                            }

                            // Convert the date to a valid DateTime object
                            DateTime parsedDate =
                                DateFormat('dd-MM-yyyy').parse(dated);

                            // Format the parsed date to 'yyyy-MM-dd' for the backend
                            String goingBack =
                                DateFormat('yyyy-MM-dd').format(parsedDate);

                            // Call the API
                            await _model.fetchUpdateSummary(
                              caseid: SharedPrefernce.getcaseId(),
                              date: goingBack,
                              note: controller2.text.trim(),
                            );

                            setState(() {});

                            // Handle success
                            if (!_model.error && _model.message.isNotEmpty) {
                              Get.offNamed(Routes.summary);
                              errorSnackBar(context, _model.message);
                              controller1.clear();
                              controller2.clear();
                            }
                          } catch (e) {
                            // Handle invalid date format or parsing errors
                            errorSnackBar(context,
                                "Invalid date format. Please use 'dd-MM-yyyy'.");
                          }
                        },
                        text: 'Update',
                        options: FFButtonOptions(
                          height: 40,
                          padding:
                              EdgeInsetsDirectional.fromSTEB(46, 10, 46, 10),
                          iconPadding:
                              EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                          color: Colors.black,
                          textStyle: FlutterFlowTheme.of(context)
                              .titleSmall
                              .override(
                                  fontFamily: 'Quicksand',
                                  color: Colors.white,
                                  fontSize: 16,
                                  letterSpacing: 0,
                                  fontWeight: FontWeight.w500),
                          elevation: 0,
                          borderSide: BorderSide(width: 0),
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
