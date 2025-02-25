import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:nyaya_tech/data_components/get_routing.dart';
import 'package:nyaya_tech/data_components/shared_prefernce.dart';
import 'package:nyaya_tech/data_components/text_field_component.dart';
import 'package:nyaya_tech/flutter_flow/flutter_flow_animation.dart';
import 'package:nyaya_tech/pages/login/login_page_model.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginPageWidget extends StatefulWidget {
  const LoginPageWidget({super.key});

  @override
  State<LoginPageWidget> createState() => _LoginPageWidgetState();
}

class _LoginPageWidgetState extends State<LoginPageWidget>
    with TickerProviderStateMixin {
  late LoginPageModel _model;
  TextEditingController controller1 = TextEditingController();
  final animationsMap = <String, AnimationInfo>{};
  final scaffoldKey = GlobalKey<ScaffoldState>();
  String? deviceToken;
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LoginPageModel());
    // _initializeNotifications();
    // FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    //   print("📩 Foreground Notification: ${message.notification?.title}");
    //   _showNotification(message.notification);
    // });
    // FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
    //   print("🔄 App opened from notification: ${message.notification?.title}");
    // });

    animationsMap.addAll({
      'rowOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
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
      'buttonOnActionTriggerAnimation': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(0.0, 0.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
      'buttonOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        applyInitialState: true,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
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
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );
  }

  // void _initializeNotifications() {
  //   const AndroidInitializationSettings initializationSettingsAndroid =
  //       AndroidInitializationSettings('@mipmap/ic_launcher');

  //   final InitializationSettings initializationSettings =
  //       InitializationSettings(android: initializationSettingsAndroid);

  //   flutterLocalNotificationsPlugin.initialize(initializationSettings);
  //   flutterLocalNotificationsPlugin.initialize(
  //     initializationSettings,
  //     onDidReceiveNotificationResponse: (NotificationResponse response) {},
  //   );
  // }

  // Future<void> _showNotification(RemoteNotification? notification) async {
  //   if (notification == null) return;

  //   const AndroidNotificationDetails androidPlatformChannelSpecifics =
  //       AndroidNotificationDetails(
  //           'high_importance_channel', 'High Importance Notifications',
  //           importance: Importance.max,
  //           priority: Priority.high,
  //           showWhen: false,
  //           icon: 'ic_notification');

  //   const NotificationDetails platformChannelSpecifics = NotificationDetails(
  //       android: androidPlatformChannelSpecifics,
  //       iOS: DarwinNotificationDetails(
  //           presentAlert: true, presentBadge: true, presentSound: true));

  //   await flutterLocalNotificationsPlugin.show(
  //       0, notification.title, notification.body, platformChannelSpecifics,
  //       payload: notification.body);
  // }

  // Future<void> _getDeviceToken() async {
  //   try {
  //     FirebaseMessaging messaging = FirebaseMessaging.instance;

  //     NotificationSettings settings = await messaging.requestPermission(
  //       alert: true,
  //       announcement: false,
  //       badge: true,
  //       carPlay: false,
  //       criticalAlert: false,
  //       provisional: false,
  //       sound: true,
  //     );
  //     if (settings.authorizationStatus == AuthorizationStatus.authorized ||
  //         settings.authorizationStatus == AuthorizationStatus.provisional) {
  //       String? token = await messaging.getToken();
  //       setState(() {
  //         deviceToken = token;
  //         SharedPrefernce.setfcmToken(token.toString());
  //         print(token);
  //       });
  //     } else {
  //       setState(() {
  //         deviceToken = "Permission denied";
  //       });
  //     }
  //   } catch (e) {
  //     setState(() {
  //       deviceToken = "Error: ${e.toString()}";
  //     });
  //   }
  // }

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
      child: SafeArea(
        top: true,
        child: WillPopScope(
          onWillPop: () async {
            return false;
          },
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            resizeToAvoidBottomInset: false,
            body: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('assets/images/bulb.png'),
                      ),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 30),
                        SvgPicture.asset('assets/images/Nyaya_logo.svg',
                            fit: BoxFit.cover),
                        SizedBox(height: 30),
                        Expanded(
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(16, 170, 16, 0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(height: 30),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Login',
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
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    SizedBox(height: 30),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Expanded(
                                            child: TextFieldComponent(
                                          textInputType: TextInputType.number,
                                          maxLine: 1,
                                          controller: controller1,
                                          maxLength: 10,
                                          hintText: 'Enter Your Number',
                                          label: '',
                                          errorKey: 'phone',
                                          errors: _model.errorInstance,
                                        )),
                                      ],
                                    ).animateOnPageLoad(animationsMap[
                                        'rowOnPageLoadAnimation']!),
                                    SizedBox(height: 32),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Expanded(
                                          child: FFButtonWidget(
                                            onPressed: () async {
                                              // await _getDeviceToken();
                                              print(
                                                  'fcm token -- ${SharedPrefernce.getfcmToken()}');
                                              await _model.fetchMail(
                                                  mail: controller1.text.isEmpty
                                                      ? ''
                                                      : "+91${controller1.text.trim()}");
                                              setState(() {});
                                              if (_model.error &&
                                                  _model.message.isNotEmpty &&
                                                  !_model.isValidation) {
                                                return;
                                              } else if (!_model.error &&
                                                  _model.message.isNotEmpty) {
                                                Get.toNamed(Routes.otpPage);
                                                SharedPrefernce.setemail(
                                                    controller1.text);
                                                return;
                                              }
                                              if (animationsMap[
                                                      'buttonOnActionTriggerAnimation'] !=
                                                  null) {
                                                await animationsMap[
                                                        'buttonOnActionTriggerAnimation']!
                                                    .controller
                                                    .forward(from: 0.0);
                                              }
                                            },
                                            text: 'Send OTP',
                                            options: FFButtonOptions(
                                              height: 40,
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 0, 0, 0),
                                              iconPadding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 0, 0, 0),
                                              color: Colors.white,
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color: Colors.black,
                                                        fontSize: 16,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                              elevation: 0,
                                              borderSide: BorderSide(
                                                color: Colors.black,
                                                width: 1,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(0),
                                            ),
                                          )
                                              .animateOnPageLoad(animationsMap[
                                                  'buttonOnPageLoadAnimation']!)
                                              .animateOnActionTrigger(
                                                animationsMap[
                                                    'buttonOnActionTriggerAnimation']!,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
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
