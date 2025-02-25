import 'package:docx_file_viewer/docx_file_viewer.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:nyaya_tech/data_components/error_snackbar.dart';
import 'package:nyaya_tech/data_components/get_routing.dart';
import 'package:nyaya_tech/data_components/text_field_component.dart';
import 'package:nyaya_tech/flutter_flow/flutter_flow_animation.dart';
import 'package:nyaya_tech/pages/login_page/welcome/welcome_model.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';

class WelcomeScreenWidget extends StatefulWidget {
  const WelcomeScreenWidget({super.key});

  @override
  State<WelcomeScreenWidget> createState() => _WelcomeScreenWidgetState();
}

class _WelcomeScreenWidgetState extends State<WelcomeScreenWidget> {
  late WelcomeScreenModel _model;
  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();
  String selectedGender = '';
  bool showGenderError = false;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final animationsMap = <String, AnimationInfo>{};
  final List<String> items = ["Andhra Pradesh", "Telangana"];
  String selectedValue = '';

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WelcomeScreenModel());

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();
    animationsMap.addAll({
      'columnOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 700.0.ms,
            begin: Offset(0.0, 20.0),
            end: Offset(0.0, 0.0),
          ),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 700.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'columnOnPageLoadAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 700.0.ms,
            begin: Offset(0.0, 20.0),
            end: Offset(0.0, 0.0),
          ),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 700.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
    });
  }

  bool isLoading = false;

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
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.white,
        body: SafeArea(
          top: true,
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Opacity(
                      opacity: 0,
                      child: Container(
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
                          child: Icon(Icons.arrow_back,
                              color: FlutterFlowTheme.of(context).primaryText,
                              size: 20),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () async {
                        setState(() {
                          isLoading = true;
                        });
                        await _model.fetchName(
                            firstname: controller1.text.trim(),
                            lastName: controller2.text.trim(),
                            gender: selectedGender.toString(),
                            state: selectedValue.toString());
                        setState(() {
                          isLoading = false;
                        });
                        if (_model.error &&
                            _model.message.isNotEmpty &&
                            !_model.isValidation) {
                          return;
                        } else if (!_model.error && _model.message.isNotEmpty) {
                          Get.toNamed(Routes.bottombar,
                              arguments: {'currentIndex': 2});
                          errorSnackBar(context, _model.message);
                        } else if (selectedGender.isEmpty) {
                          setState(() {
                            showGenderError = true;
                          });
                        }
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(0),
                        child: isLoading
                            ? Container(
                                height: 24,
                                width: 24,
                                child: Padding(
                                  padding: const EdgeInsets.all(2),
                                  child: CircularProgressIndicator(
                                      color: Colors.black, strokeWidth: 2),
                                ),
                              )
                            : SvgPicture.asset('assets/images/done_mark.svg',
                                width: 36, height: 36, fit: BoxFit.cover),
                      ),
                    ),
                  ],
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Welcome to NyayaTech!',
                      textAlign: TextAlign.start,
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'DM Sans',
                            fontSize: 24,
                            letterSpacing: 0.0,
                          ),
                    ),
                    Text(
                      'Let’s get started by knowing your name. This helps us personalize your experience and set up your profile.',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'DM Sans',
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.normal,
                          ),
                    ),
                  ].divide(SizedBox(height: 12)),
                ).animateOnPageLoad(
                    animationsMap['columnOnPageLoadAnimation1']!),
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                      child: Container(
                              width: double.infinity,
                              child: TextFieldComponent(
                                inputFormatters: [
                                  FilteringTextInputFormatter.allow(
                                      RegExp(r'[a-z A-Z\s]'))
                                ],
                                textInputType: TextInputType.text,
                                controller: controller1,
                                errorKey: 'first_name',
                                maxLine: 1,
                                label: 'First Name *',
                                hintText: 'First Name',
                                errors: _model.errorInstance,
                              ))
                          .animateOnPageLoad(
                              animationsMap['columnOnPageLoadAnimation2']!),
                    ),
                    TextFieldComponent(
                      controller: controller2,
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(
                            RegExp(r'[a-z A-Z\s]'))
                      ],
                      errorKey: 'last_name',
                      maxLine: 1,
                      label: 'Last Name *',
                      hintText: 'Last Name',
                      errors: _model.errorInstance1,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'State *',
                          textAlign: TextAlign.start,
                        ),
                        SizedBox(height: 8),
                        DropdownButtonHideUnderline(
                          child: DropdownButton2<String>(
                            isExpanded: true,
                            hint: Text(
                              'Please Select State',
                              style: TextStyle(
                                fontSize: 14,
                                color: Theme.of(context).hintColor,
                              ),
                            ),
                            items: items
                                .map((String item) => DropdownMenuItem<String>(
                                      value: item,
                                      child: Text(
                                        item,
                                        style: const TextStyle(
                                          fontSize: 14,
                                        ),
                                      ),
                                    ))
                                .toList(),
                            value: selectedValue.isEmpty ? null : selectedValue,
                            onChanged: (String? value) {
                              setState(() {
                                selectedValue = value ?? '';
                              });
                            },
                            buttonStyleData: ButtonStyleData(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8),
                                height: 40,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(0),
                                  border: Border.all(color: Colors.black),
                                )),
                            menuItemStyleData: const MenuItemStyleData(
                              height: 40,
                            ),
                          ),
                        ),
                        SizedBox(height: 4),
                        if (_model.error && _model.message.isNotEmpty)
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 4),
                                child: Text(
                                  _model.stateerror,
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                      color: Colors.red, fontSize: 12),
                                ),
                              ),
                            ],
                          ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          'Gender *',
                          style: TextStyle(
                              fontFamily: 'DM Sans',
                              fontSize: 14,
                              color: Color(0XFF0C0C0C)),
                        ),
                      ],
                    ),
                    Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                _genderContainer('MALE', 'Male'),
                                _genderContainer('FEMALE', 'Female'),
                                _genderContainer('OTHER', 'Other'),
                              ],
                            ),
                            if (showGenderError) ...[
                              SizedBox(height: 4),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 4),
                                    child: Text(
                                      _model.gendererror,
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                          color: Colors.red, fontSize: 12),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ].divide(SizedBox(height: 4)),
                        ))
                  ].divide(SizedBox(height: 10)),
                ),
              ].divide(SizedBox(height: 32)),
            ),
          ),
        ),
      ),
    );
  }

  Widget _genderContainer(String gender, String label) {
    bool isSelected = selectedGender == gender;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedGender = gender;
          showGenderError = false;
        });
      },
      child: Container(
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          border: Border.all(
            color: isSelected ? Color(0XFFE0E0E0) : Colors.white,
          ),
          borderRadius: BorderRadius.circular(0),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(16, 10, 16, 10),
          child: Row(
            children: [
              Container(
                width: 16,
                height: 16,
                decoration: BoxDecoration(
                  color: isSelected ? Colors.black : Colors.white,
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.black, width: 2),
                ),
              ),
              SizedBox(width: 10),
              Text(
                label,
                style: FlutterFlowTheme.of(context)
                    .bodyMedium
                    .override(fontFamily: 'DM Sans', color: Color(0XFF181616)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
