import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:nyaya_tech/data_components/get_routing.dart';
import 'package:nyaya_tech/data_components/shared_prefernce.dart';
import 'package:nyaya_tech/flutter_flow/flutter_flow_animation.dart';
import 'package:nyaya_tech/flutter_flow/flutter_flow_theme.dart';
import 'package:nyaya_tech/flutter_flow/flutter_flow_util.dart';
import 'package:nyaya_tech/flutter_flow/flutter_flow_widgets.dart';
import 'package:nyaya_tech/pages/login_page/otp_page/otp_page_model.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpPageWidget extends StatefulWidget {
  const OtpPageWidget({super.key});

  @override
  State<OtpPageWidget> createState() => _OtpPageWidgetState();
}

class _OtpPageWidgetState extends State<OtpPageWidget> {
  late OtpPageModel _model;
  int _remainingTime = 0;
  late Timer _timer;
  bool _isLoading = false;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OtpPageModel());
    animationsMap.addAll({
      'rowOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 700.0.ms,
            begin: Offset(0.0, -50.0),
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
      'columnOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 50.0.ms,
            duration: 700.0.ms,
            begin: Offset(0.0, -50.0),
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
            delay: 100.0.ms,
            duration: 700.0.ms,
            begin: Offset(0.0, 50.0),
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
      'buttonOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 100.0.ms,
            duration: 700.0.ms,
            begin: Offset(0.0, 50.0),
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

  void _startTimer() {
    setState(() {
      _remainingTime = 30;
    });

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remainingTime > 0) {
        setState(() {
          _remainingTime--;
        });
      } else {
        _timer.cancel();
      }
    });
  }

  Future<void> _resendOtp() async {
    await _model.fetchsendOtp(phone: "+91${SharedPrefernce.getemail().toString().trim()}");
    _startTimer();
  }

  @override
  void dispose() {
    _model.dispose();
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        resizeToAvoidBottomInset: false,
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage('assets/images/bulb.png'),
            ),
          ),
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 30),
                SvgPicture.asset('assets/images/Nyaya_logo.svg',
                    fit: BoxFit.cover),
                Expanded(
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(16, 230, 16, 0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Verify Your OTP',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Poppins',
                                    color: Colors.white,
                                    fontSize: 24,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.normal,
                                  ),
                            ),
                          ],
                        ).animateOnPageLoad(
                            animationsMap['rowOnPageLoadAnimation']!),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Text(
                                      'we sent an 4 digit code to',
                                      textAlign: TextAlign.center,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Poppins',
                                            color: Colors.white,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.normal,
                                          ),
                                    ),
                                  ],
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Get.toNamed(Routes.editPhone);
                                  },
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      RichText(
                                        text: TextSpan(
                                          children: [
                                            TextSpan(
                                              text:
                                                  '${SharedPrefernce.getemail()} ',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Plus Jakarta Sans',
                                                        color: Colors.white,
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                            TextSpan(
                                              text: ' Edit',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Poppins',
                                                    color: Color(0xFFEBB305),
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w400,
                                                    decoration: TextDecoration
                                                        .underline,
                                                  ),
                                            ),
                                          ],
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ).animateOnPageLoad(
                            animationsMap['columnOnPageLoadAnimation1']!),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            PinCodeTextField(
                              appContext: context,
                              length: 4,
                              textStyle: FlutterFlowTheme.of(context)
                                  .bodyLarge
                                  .override(
                                      fontFamily: 'Lato',
                                      color: Colors.black,
                                      fontSize: 24,
                                      letterSpacing: 0),
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              enableActiveFill: true,
                              autoFocus: true,
                              enablePinAutofill: false,
                              errorTextSpace: 1,
                              showCursor: true,
                              obscureText: false,
                              hintCharacter: '*',
                              hintStyle: TextStyle(
                                  color: Color(0xFF35353D),
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 24),
                              keyboardType: TextInputType.number,
                              pinTheme: PinTheme(
                                fieldHeight: 48,
                                fieldWidth: 48,
                                borderWidth: 1,
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(4),
                                  bottomRight: Radius.circular(4),
                                  topLeft: Radius.circular(4),
                                  topRight: Radius.circular(4),
                                ),
                                shape: PinCodeFieldShape.box,
                                activeColor: Color(0xFFB4C1D6),
                                inactiveColor: Color(0xFFB4C1D6),
                                selectedColor: Color(0xFFB4C1D6),
                                inactiveFillColor: Color(0xFFFFFFFF),
                                activeFillColor: Color(0xFFFFFFFF),
                                selectedFillColor: Color(0xFFFFFFFF),
                              ),
                              controller: _model.pinCodeController,
                              onChanged: (value) async {
                                if (value.length == 4) {
                                  setState(() {
                                    _isLoading = true;
                                  });
                                  await _model.fetchotp(
                                    email: SharedPrefernce.getemail().toString(),
                                    otp: _model.pinCodeController.text.trim(),
                                  );
                                  setState(() {
                                    _isLoading = false;
                                  });
                                  if (!_model.error &&
                                      _model.message.isNotEmpty) {
                                    if (SharedPrefernce.getisNewUser() ==
                                        true) {
                                      Get.offNamed(Routes.welcome);
                                    } else {
                                      Get.offNamed(Routes.bottombar,
                                          arguments: {'currentIndex': 2});
                                    }
                                  } else if (_model.error &&
                                      _model.message.isNotEmpty &&
                                      !_model.isValidation) {
                                    return;
                                  }
                                }
                              },
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                            ),
                            SizedBox(height: 3),
                            if (_model.error && _model.message.isNotEmpty)
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    _model.errorInstance,
                                    style: TextStyle(
                                        color: Colors.red, fontSize: 14),
                                  ),
                                ],
                              ),
                            GestureDetector(
                              onTap: _remainingTime == 0 ? _resendOtp : null,
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  RichText(
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: _remainingTime > 0
                                              ? 'OTP Recived WithIn  '
                                              : 'Didn’t receive the code?  ',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Poppins',
                                                color: Colors.white,
                                                letterSpacing: 0,
                                                fontWeight: FontWeight.normal,
                                              ),
                                        ),
                                        TextSpan(
                                          text: _remainingTime > 0
                                              ? '$_remainingTime'
                                              : 'Resend',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                  fontFamily: 'Poppins',
                                                  color: Color(0xFFEBB305),
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w400),
                                        )
                                      ],
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Plus Jakarta Sans',
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ].divide(SizedBox(height: 8)),
                        ).animateOnPageLoad(
                            animationsMap['columnOnPageLoadAnimation2']!),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: FFButtonWidget(
                                onPressed: () async {
                                  // await _model.fetchotp(
                                  //   email: SharedPrefernce.getemail(),
                                  //   otp: _model.pinCodeController.text.trim(),
                                  // );
                                  // await _model.fetchCasesIssue();
                                  // setState(() {});
                                  // if (!_model.error &&
                                  //     _model.message.isNotEmpty) {
                                  //   if (SharedPrefernce.getisNewUser() ==
                                  //       true) {
                                  //     Get.offAll(Routes.welcome);
                                  //   } else {
                                  //     Get.offAll(Routes.bottombar,
                                  //         arguments: {'currentIndex': 2});
                                  //   }
                                  // } else if (_model.error &&
                                  //     _model.message.isNotEmpty &&
                                  //     !_model.isValidation) {
                                  //   return;
                                  // }
                                },
                                text: _isLoading ? 'Loading...' : 'Verify',
                                options: FFButtonOptions(
                                  height: 40,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 0),
                                  color: Colors.white,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: Colors.black,
                                        fontSize: 16,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.normal,
                                      ),
                                  elevation: 0,
                                  borderSide:
                                      BorderSide(color: Colors.black, width: 1),
                                  borderRadius: BorderRadius.circular(0),
                                ),
                              ).animateOnPageLoad(
                                  animationsMap['buttonOnPageLoadAnimation']!),
                            ),
                          ],
                        ),
                      ].divide(SizedBox(height: 24)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
