import 'package:nyaya_tech/data_components/shared_preference.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'otp_page_model.dart';
export 'otp_page_model.dart';

class OtpPageWidget extends StatefulWidget {
  const OtpPageWidget({super.key});

  @override
  State<OtpPageWidget> createState() => _OtpPageWidgetState();
}

class _OtpPageWidgetState extends State<OtpPageWidget> {
  late OtpPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OtpPageModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Colors.black,
                  ),
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(
                        24.0, 150.0, 24.0, 180.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  8.0, 0.0, 8.0, 0.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(0.0),
                                        child: Image.asset(
                                          'assets/images/Nyaya_logo.png',
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    'Verify Your Phone',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Poppins',
                                          color: Colors.black,
                                          fontSize: 24.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.normal,
                                        ),
                                  ),
                                  Flexible(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          'we sent an 4 digit code to',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Poppins',
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.normal,
                                              ),
                                        ),
                                        InkWell(
                                          onTap: () {
                                            Navigator.pop(context);
                                          },
                                          child: RichText(
                                            textScaler:
                                                MediaQuery.of(context).textScaler,
                                            text: TextSpan(
                                              children: [
                                                TextSpan(
                                                  text: SharedPrefernce.getPhone(),
                                                  style:
                                                      FlutterFlowTheme.of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily: 'Poppins',
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.normal,
                                                          ),
                                                ),
                                                TextSpan(
                                                  text: '  Edit',
                                                  style: GoogleFonts.getFont(
                                                    'Poppins',
                                                    color:
                                                        const Color(0xFFEBB305),
                                                  ),
                                                )
                                              ],
                                              style: FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily:
                                                        'Plus Jakarta Sans',
                                                    letterSpacing: 0.0,
                                                  ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsetsDirectional
                                              .fromSTEB(0.0, 8.0, 0.0, 0.0),
                                          child: PinCodeTextField(
                                            autoDisposeControllers: false,
                                            appContext: context,
                                            length: 4,
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyLarge
                                                    .override(
                                                      fontFamily:
                                                          'Plus Jakarta Sans',
                                                      letterSpacing: 0,
                                                      lineHeight: 1,
                                                    ),
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            enableActiveFill: false,
                                            autoFocus: false,
                                            enablePinAutofill: false,
                                            errorTextSpace: 16,
                                            showCursor: true,
                                            cursorColor: Colors.black,
                                            obscureText: false,
                                            hintCharacter: '-',
                                            keyboardType: TextInputType.number,
                                            pinTheme: PinTheme(
                                              fieldHeight: 44,
                                              fieldWidth: 44,
                                              borderWidth: 2,
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              shape: PinCodeFieldShape.box,
                                              activeColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              inactiveColor:
                                                  FlutterFlowTheme.of(context)
                                                      .alternate,
                                              selectedColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                            ),
                                            errorTextMargin: EdgeInsets.only(
                                                left: 70, top: 10),
                                            controller: _model.OTPController,
                                            onChanged: (_) {
                                              setState(() {
                                                //_model.errorInstance = null;
                                              });
                                            },
                                            autovalidateMode: AutovalidateMode
                                                .onUserInteraction,
                                            //validator: _model.errorInstance,
                                          ),
                                        ),
                                        RichText(
                                          textScaler:
                                              MediaQuery.of(context).textScaler,
                                          text: TextSpan(
                                            children: [
                                              TextSpan(
                                                text:
                                                    'Didn’t receive the code?',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color: const Color(
                                                              0xFF212121),
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                              ),
                                              TextSpan(
                                                text: ' Resend Code',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color: const Color(
                                                              0xFFEBB305),
                                                          fontSize: 16.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                              )
                                            ],
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily:
                                                      'Plus Jakarta Sans',
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ),
                                      ].divide(const SizedBox(height: 8.0)),
                                    ),
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Expanded(
                                        child: FFButtonWidget(
                                          onPressed: () async {
                                            await _model.fetchOTP(
                                                phone:
                                                    SharedPrefernce.getPhone(),
                                                otp: _model.OTPController.text
                                                    .trim());

                                            print(
                                                'phone -- ${SharedPrefernce.getPhone()}');
                                            print(
                                                'otp -- ${_model.OTPController.text.trim()}');
                                            setState(() {});

                                            if (_model.error && // It has Error
                                                _model.message.isNotEmpty &&
                                                !_model.isValidation) {
                                              return;
                                            } else if (!_model
                                                    .error && // It has not Error
                                                _model.message.isNotEmpty) {
                                              context.pushNamed('cases');
                                              context.pushNamed('bottomBar');
                                            }
                                            context.pushNamed('bottomBar');
                                          },
                                          text: 'Verify',
                                          options: FFButtonOptions(
                                            height: 40.0,
                                            padding: const EdgeInsetsDirectional
                                                .fromSTEB(9.0, 0.0, 9.0, 0.0),
                                            iconPadding:
                                                const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: Colors.black,
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .override(
                                                      fontFamily: 'Poppins',
                                                      color: Colors.white,
                                                      fontSize: 16.0,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                    ),
                                            elevation: 0.0,
                                            borderSide: const BorderSide(
                                              color: Colors.transparent,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(0.0),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ].divide(const SizedBox(height: 24.0)),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
