
import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:nyaya_tech/data_components/shared_preference.dart';
import 'package:permission_handler/permission_handler.dart';
import 'flutter_flow/flutter_flow_theme.dart';
import 'flutter_flow/flutter_flow_util.dart';

// @pragma('vm:entry-point')
// void onStart(ServiceInstance service) async {
//   // Background service logic
//   if (service is AndroidServiceInstance) {
//     service.on('setAsForeground').listen((event) {
//       service.setAsForegroundService();
//     });

//     service.on('setAsBackground').listen((event) {
//       service.setAsBackgroundService();
//     });
//   }

//   service.on('stopService').listen((event) {
//     service.stopSelf();
//   });

//   // Example: Send a notification when the service starts
//   final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//       FlutterLocalNotificationsPlugin();
//   const AndroidNotificationDetails androidPlatformChannelSpecifics =
//       AndroidNotificationDetails(
//     'your_channel_id',
//     'your_channel_name',
//     importance: Importance.high,
//     priority: Priority.high,
//   );
//   const NotificationDetails platformChannelSpecifics =
//       NotificationDetails(android: androidPlatformChannelSpecifics);
//   await flutterLocalNotificationsPlugin.show(
//     0,
//     'Background Service',
//     'Service is running',
//     platformChannelSpecifics,
//   );
// }

// @pragma('vm:entry-point')
// Future<bool> onIosBackground(ServiceInstance service) async {
//   // iOS background service logic
//   return true;
// }

// final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//     FlutterLocalNotificationsPlugin();

// Future<void> requestPermissions() async {
//   // Request storage and notification permissions
//   final storageStatus = await Permission.storage.request();
//   final notificationStatus = await Permission.notification.request();

//   if (storageStatus.isGranted) {
//     debugPrint("Storage permission granted");
//   } else {
//     debugPrint("Storage permission denied");
//   }

//   if (notificationStatus.isGranted) {
//     debugPrint("Notification permission granted");
//   } else {
//     debugPrint("Notification permission denied");
//   }
// }


// Future<void> initializeService() async {
//   final service = FlutterBackgroundService();

//   await service.configure(
//     iosConfiguration: IosConfiguration(
//       autoStart: true,
//       onForeground: onStart,
//       onBackground: onIosBackground,
//     ),
//     androidConfiguration: AndroidConfiguration(
//       onStart: onStart,
//       isForegroundMode: true,
//       autoStart: true,
//       autoStartOnBoot: true,
//       initialNotificationContent: "Service is running",
//       initialNotificationTitle: "Background Service",
//       foregroundServiceNotificationId: 1234,
//     ),
//   );

//   await service.startService();
// }

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize shared preferences
  await SharedPrefernce.init();

  // Request permissions
  // await requestPermissions();

  // Initialize Flutter Downloader
//   await FlutterDownloader.initialize(
//     debug: true, // Set to true for debugging
//   );
//  await FlutterLocalNotificationsPlugin().initialize(
//     InitializationSettings(
//       android: AndroidInitializationSettings('@mipmap/ic_launcher'),
//       // iOS: IOSInitializationSettings(),
//     ));
  


  await FlutterFlowTheme.initialize();

  // Use path URL strategy for web
  usePathUrlStrategy();

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();

  static _MyAppState of(BuildContext context) =>
      context.findAncestorStateOfType<_MyAppState>()!;
}

class _MyAppState extends State<MyApp> {
  ThemeMode _themeMode = FlutterFlowTheme.themeMode;

  late AppStateNotifier _appStateNotifier;
  late GoRouter _router;

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
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Nyaya Tech',
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [Locale('en', '')],
      themeMode: _themeMode,
      routerConfig: _router,
    );
  }
}