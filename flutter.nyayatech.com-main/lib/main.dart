// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:flutter_web_plugins/url_strategy.dart';
// import 'package:nyaya_tech/data_components/bottom_bar.dart';
// import 'package:nyaya_tech/data_components/get_routing.dart';
// import 'package:nyaya_tech/data_components/shared_prefernce.dart';
// import 'package:nyaya_tech/flutter_flow/flutter_flow_theme.dart';
// import 'package:nyaya_tech/flutter_flow/flutter_flow_util.dart';
// import 'package:nyaya_tech/index.dart';
// import 'package:permission_handler/permission_handler.dart';
// import 'package:get/get.dart';

// final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
// FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//     FlutterLocalNotificationsPlugin();

// Future<void> _firebaseMessageBackgroundHandler(RemoteMessage message) async {
//   await Firebase.initializeApp();
//   print("_firebaseMessageBackgroundHandler: ${message.messageId}");
// }

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await SharedPrefernce.init();
//   usePathUrlStrategy();
//   await FlutterFlowTheme.initialize();
//   await Firebase.initializeApp();
//   await _requestFCMPermission();
//   await _setupLocalNotifications();
//   await _requestNotificationPermission();
//   FirebaseMessaging.onBackgroundMessage(_firebaseMessageBackgroundHandler);
//   FirebaseMessaging.instance.getToken().then((value) {
//     print('FCM Token: $value');
//     SharedPrefernce.setfcmToken(value.toString());
//   });

//   runApp(MyApp());
// }

// Future<void> _requestNotificationPermission() async {
//   var status = await Permission.notification.status;
//   if (status.isDenied) {
//     final result = await Permission.notification.request();
//     if (result.isDenied) {
//       print("Notification permission denied. Retrying...");
//       await _requestNotificationPermission();
//     } else if (result.isPermanentlyDenied) {
//       print("Notification permission permanently denied.");
//       openAppSettings();
//     }
//   } else if (status.isPermanentlyDenied) {
//     print("Notification permission permanently denied.");
//     openAppSettings();
//   }
//   await flutterLocalNotificationsPlugin
//       .resolvePlatformSpecificImplementation<
//           IOSFlutterLocalNotificationsPlugin>()
//       ?.requestPermissions(alert: true, badge: true, sound: true);
// }

// Future<void> _requestFCMPermission() async {
//   FirebaseMessaging messaging = FirebaseMessaging.instance;
//   NotificationSettings settings =
//       await messaging.requestPermission(alert: true, badge: true, sound: true);

//   if (settings.authorizationStatus == AuthorizationStatus.denied) {
//     print("FCM Permission Denied");
//   } else {
//     print("FCM Permission Granted: ${settings.authorizationStatus}");
//   }
// }

// Future<void> _setupLocalNotifications() async {
//   const AndroidInitializationSettings initializationSettingsAndroid =
//       AndroidInitializationSettings('@mipmap/ic_launcher');

//   final DarwinInitializationSettings initializationSettingsIOS =
//       DarwinInitializationSettings();

//   final InitializationSettings initializationSettings = InitializationSettings(
//       android: initializationSettingsAndroid, iOS: initializationSettingsIOS);

//   await flutterLocalNotificationsPlugin.initialize(
//     initializationSettings,
//     onDidReceiveNotificationResponse: (NotificationResponse response) {
//       print("User tapped on notification: ${response.payload}");

//       if (response.payload != null && response.payload!.isNotEmpty) {
//         try {
//           Map<String, dynamic> data = json.decode(response.payload!);
//           String? id = data['id'];
//           String? title = data['title'];
//           navigatorKey.currentState?.push(
//             MaterialPageRoute(
//               builder: (context) {
//                 if (title == 'Case submitted') {
//                   return SalomonBottom();
//                 } else if (title == 'Legal Advisor Assigned') {
//                   int caseId = int.parse(id!);
//                   SharedPrefernce.setcaseId(caseId);
//                   return ViewCaseWidget();
//                 } else if (title == 'Advocate assigned') {
//                   int caseId = int.parse(id!);
//                   SharedPrefernce.setcaseId(caseId);
//                   return ViewCaseWidget();
//                 } else {
//                   return SalomonBottom();
//                 }
//               },
//             ),
//           );
//         } catch (e) {
//           print("Error parsing payload: $e");
//           navigatorKey.currentState
//               ?.pushNamed(Routes.bottombar, arguments: {'currentIndex': 3});
//         }
//       }
//     },
//   );

//   AndroidNotificationChannel channel = AndroidNotificationChannel(
//       'high_importance_channel', 'High Importance Notifications',
//       importance: Importance.high);

//   await flutterLocalNotificationsPlugin
//       .resolvePlatformSpecificImplementation<
//           AndroidFlutterLocalNotificationsPlugin>()
//       ?.createNotificationChannel(channel);
// }

// class MyApp extends StatefulWidget {
//   @override
//   State<MyApp> createState() => _MyAppState();

//   static _MyAppState of(BuildContext context) =>
//       context.findAncestorStateOfType<_MyAppState>()!;
// }

// class _MyAppState extends State<MyApp> {
//   ThemeMode _themeMode = FlutterFlowTheme.themeMode;
//   @override
//   void initState() {
//     super.initState();

//     FirebaseMessaging.onMessage.listen((RemoteMessage message) {
//       print("FCM Foreground Message: ${message.notification?.title}");
//       _showLocalNotification(message);
//       print("Foreground Notification Data: ${message.data}");
//     });

//     FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
//       print("FCM onMessageOpenedApp: ${message.data}");
//       _handleNotificationNavigation(message.data);
//     });

//     FirebaseMessaging.instance
//         .getInitialMessage()
//         .then((RemoteMessage? message) {
//       if (message != null) {
//         print("FCM getInitialMessage: ${message.data}");
//         _handleNotificationNavigation(message.data);
//       }
//     });
//   }

//   void _showLocalNotification(RemoteMessage message) {
//     RemoteNotification? notification = message.notification;
//     AndroidNotification? android = message.notification?.android;

//     if (notification != null && android != null) {
//       flutterLocalNotificationsPlugin.show(
//         notification.hashCode,
//         notification.title,
//         notification.body,
//         NotificationDetails(
//           android: AndroidNotificationDetails(
//               'high_importance_channel', 'High Importance Notifications',
//               importance: Importance.max,
//               priority: Priority.high,
//               showWhen: false,
//               icon: 'ic_notification'),
//         ),
//         payload: json.encode(message.data),
//       );
//     }
//   }

//   void _handleNotificationNavigation(Map<String, dynamic> data) {
//     if (data.isEmpty) return;

//     String? title = data['title'];
//     String? id = data['id'];

//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       if (title == 'Case submitted') {
//         navigatorKey.currentState
//             ?.push(MaterialPageRoute(builder: (_) => SalomonBottom()));
//       } else if (title == 'Legal Advisor Assigned' && id != null) {
//         SharedPrefernce.setcaseId(int.parse(id));
//         navigatorKey.currentState
//             ?.push(MaterialPageRoute(builder: (_) => ViewCaseWidget()));
//       } else {
//         navigatorKey.currentState
//             ?.push(MaterialPageRoute(builder: (_) => SalomonBottom()));
//       }
//     });
//   }

//   void setThemeMode(ThemeMode mode) => safeSetState(() {
//         _themeMode = mode;
//         FlutterFlowTheme.saveThemeMode(mode);
//       });

//   @override
//   Widget build(BuildContext context) {
//     return GetMaterialApp(
//       title: 'Nyaya Tech',
//       navigatorKey: navigatorKey,
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(brightness: Brightness.light, useMaterial3: false),
//       initialRoute: SharedPrefernce.getAccessToken().isNotEmpty
//           ? Routes.bottombar
//           : Routes.login,
//       getPages: getPages,
//     );
//   }
// }





import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:get/get.dart';
import 'package:nyaya_tech/data_components/get_routing.dart';
import 'package:nyaya_tech/data_components/shared_prefernce.dart';
import 'package:nyaya_tech/flutter_flow/flutter_flow_theme.dart';
import 'package:nyaya_tech/flutter_flow/flutter_flow_util.dart';
import 'package:nyaya_tech/providers/comments_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
//   await FlutterDownloader.initialize(
// debug: true,
// );
  await SharedPrefernce.init();
  usePathUrlStrategy();
  // FlutterError.onError = (errorDetails) {
  //   FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
  // };

  await FlutterFlowTheme.initialize();
  // await Firebase.initializeApp();
  await _requestNotificationPermission();
  runApp(MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => CommentsProvider())],
      child: MyApp()));
}

Future<void> _requestNotificationPermission() async {
  var status = await Permission.notification.status;
  if (status.isDenied) {
    final result = await Permission.notification.request();
    if (result.isDenied) {
      print("Notification permission denied. Retrying...");
      await _requestNotificationPermission();
    } else if (result.isPermanentlyDenied) {
      print("Notification permission permanently denied.");
      openAppSettings();
    }
  } else if (status.isPermanentlyDenied) {
    print("Notification permission permanently denied.");
    openAppSettings();
  }
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();

  static _MyAppState of(BuildContext context) =>
      context.findAncestorStateOfType<_MyAppState>()!;
}

class _MyAppState extends State<MyApp> {
  ThemeMode _themeMode = FlutterFlowTheme.themeMode;

  late AppStateNotifier _appStateNotifier;
  late GoRouter _router;
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  @override
  void initState() {
    super.initState();
    _appStateNotifier = AppStateNotifier.instance;
    _router = createRouter(_appStateNotifier);
  }

  void setThemeMode(ThemeMode mode) => safeSetState(() {
        _themeMode = mode;
        FlutterFlowTheme.saveThemeMode(mode);
      });

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Nyaya Tech',
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      debugShowCheckedModeBanner: false,
      supportedLocales: const [Locale('en', '')],
      theme: ThemeData(brightness: Brightness.light, useMaterial3: false),
      themeMode: _themeMode,
      initialRoute: (SharedPrefernce.getAccessToken().isNotEmpty
          ? Routes.bottombar
          : Routes.login),
      getPages: getPages,
    );
  }
}

