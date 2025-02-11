import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nyaya_tech/checklist/checklist_widget.dart';
import 'package:nyaya_tech/checklist/view_checklist_widget.dart';
import 'package:nyaya_tech/data_components/bottom_bar.dart';
import 'package:nyaya_tech/user_profile/update_user_profile_widget.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

import '/index.dart';
import '/main.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/lat_lng.dart';
import '/flutter_flow/place.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'serialization_util.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

GlobalKey<NavigatorState> appNavigatorKey = GlobalKey<NavigatorState>();

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  bool showSplashImage = true;

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      navigatorKey: appNavigatorKey,
      errorBuilder: (context, state) => const LoginPageWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) => const LoginPageWidget(),
        ),
        FFRoute(
          name: 'bottomBar',
          path: '/bottomBar',
          builder: (context, _) => const BottomBarWidget(),
        ),
        FFRoute(
          name: 'userEdit',
          path: '/userEdit',
          builder: (context, _) => const UpdateUserProfileWidget(),
        ),
        FFRoute(
          name: 'checklist',
          path: '/checklist',
          builder: (context, _) => const ListofchecklistWidget(),
        ),
        FFRoute(
          name: 'view_checklist',
          path: '/Viewchecklist',
          builder: (context, _) => const ViewChecklistWidget(),
        ),
        FFRoute(
          name: 'login_page',
          path: '/loginPage',
          builder: (context, params) => const LoginPageWidget(),
        ),
        FFRoute(
          name: 'empty_case',
          path: '/emptyCase',
          builder: (context, params) => const EmptyCaseWidget(),
        ),
        FFRoute(
          name: 'Add_Notes',
          path: '/addNotes',
          builder: (context, params) => const AddNotesWidget(),
        ),
        FFRoute(
          name: 'Add_hearing_Summary',
          path: '/addHearingSummary',
          builder: (context, params) => const AddHearingSummaryWidget(),
        ),
        FFRoute(
          name: 'step_1_screen',
          path: '/step1Screen',
          builder: (context, params) => const Step1ScreenWidget(),
        ),
        FFRoute(
          name: 'step_2_screen',
          path: '/step2Screen',
          builder: (context, params) => const Step2ScreenWidget(),
        ),
        FFRoute(
          name: 'step_3_screen',
          path: '/step3Screen',
          builder: (context, params) => const Step3ScreenWidget(),
        ),
        FFRoute(
          name: 'Assign_Screen',
          path: '/assignScreen',
          builder: (context, params) => const AssignScreenWidget(),
        ),
        FFRoute(
          name: 'Notes_screen',
          path: '/notesScreen',
          builder: (context, params) => const NotesScreenWidget(),
        ),
        FFRoute(
          name: 'View_case',
          path: '/viewCase',
          builder: (context, params) => const ViewCaseWidget(),
        ),
        FFRoute(
          name: 'View_Notes',
          path: '/viewNotes',
          builder: (context, params) => const ViewNotesWidget(),
        ),
        FFRoute(
          name: 'Logs',
          path: '/logs',
          builder: (context, params) => const LogsWidget(),
        ),
        FFRoute(
          name: 'chat_box',
          path: '/chatBox',
          builder: (context, params) => const ChatBoxWidget(),
        ),
        FFRoute(
          name: 'hearing_summary',
          path: '/hearingSummary',
          builder: (context, params) => const HearingSummaryWidget(),
        ),
        FFRoute(
          name: 'view_hearing_summary',
          path: '/viewHearingSummary',
          builder: (context, params) => const ViewHearingSummaryWidget(),
        ),
        FFRoute(
          name: 'Files',
          path: '/files',
          builder: (context, params) => const FilesWidget(),
        ),
        FFRoute(
          name: 'cases',
          path: '/cases',
          builder: (context, params) => const CasesWidget(),
        ),
        FFRoute(
          name: 'otp_page',
          path: '/otpPage',
          builder: (context, params) => const OtpPageWidget(),
        ),
        FFRoute(
          name: 'description',
          path: '/description',
          builder: (context, params) => const DescriptionWidget(),
        ),
        FFRoute(
          name: 'user_profile',
          path: '/userProfile',
          builder: (context, params) => const UserProfileWidget(),
        ),
        FFRoute(
          name: 'login_updated_page',
          path: '/loginUpdatedPage',
          builder: (context, params) => const LoginUpdatedPageWidget(),
        ),
        FFRoute(
          name: 'add_user',
          path: '/addUser',
          builder: (context, params) => const AddUserWidget(),
        ),
        FFRoute(
          name: 'mobile_login',
          path: '/mobileLogin',
          builder: (context, params) => const MobileLoginWidget(),
        ),
        FFRoute(
          name: 'mobile_login_otp',
          path: '/mobileLoginOtp',
          builder: (context, params) => const MobileLoginOtpWidget(),
        ),
        FFRoute(
          name: 'welcome_screen',
          path: '/welcomeScreen',
          builder: (context, params) => const WelcomeScreenWidget(),
        ),
        FFRoute(
          name: 'delete_file',
          path: '/deleteFile',
          builder: (context, params) => const DeleteFileWidget(),
        )
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (canPop()) {
      pop();
    } else {
      go('/');
    }
  }
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(pathParameters)
    ..addAll(uri.queryParameters)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.allParams.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, {
    bool isList = false,
  }) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(
      param,
      type,
      isList,
    );
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        pageBuilder: (context, state) {
          fixStatusBarOniOS16AndBelow(context);
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = page;

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) =>
                          PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).buildTransitions(
                    context,
                    animation,
                    secondaryAnimation,
                    child,
                  ),
                )
              : MaterialPage(key: state.pageKey, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() =>
      const TransitionInfo(hasTransition: false);
}

class RootPageContext {
  const RootPageContext(this.isRootPage, [this.errorRoute]);
  final bool isRootPage;
  final String? errorRoute;

  static bool isInactiveRootPage(BuildContext context) {
    final rootPageContext = context.read<RootPageContext?>();
    final isRootPage = rootPageContext?.isRootPage ?? false;
    final location = GoRouterState.of(context).uri.toString();
    return isRootPage &&
        location != '/' &&
        location != rootPageContext?.errorRoute;
  }

  static Widget wrap(Widget child, {String? errorRoute}) => Provider.value(
        value: RootPageContext(true, errorRoute),
        child: child,
      );
}

extension GoRouterLocationExtension on GoRouter {
  String getCurrentLocation() {
    final RouteMatch lastMatch = routerDelegate.currentConfiguration.last;
    final RouteMatchList matchList = lastMatch is ImperativeRouteMatch
        ? lastMatch.matches
        : routerDelegate.currentConfiguration;
    return matchList.uri.toString();
  }
}
