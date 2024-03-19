import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/auth/base_auth_user_provider.dart';

import '/index.dart';
import '/main.dart';
import '/flutter_flow/flutter_flow_util.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  BaseAuthUser? initialUser;
  BaseAuthUser? user;
  bool showSplashImage = true;
  String? _redirectLocation;

  /// Determines whether the app will refresh and build again when a sign
  /// in or sign out happens. This is useful when the app is launched or
  /// on an unexpected logout. However, this must be turned off when we
  /// intend to sign in/out and then navigate or perform any actions after.
  /// Otherwise, this will trigger a refresh and interrupt the action(s).
  bool notifyOnAuthChange = true;

  bool get loading => user == null || showSplashImage;
  bool get loggedIn => user?.loggedIn ?? false;
  bool get initiallyLoggedIn => initialUser?.loggedIn ?? false;
  bool get shouldRedirect => loggedIn && _redirectLocation != null;

  String getRedirectLocation() => _redirectLocation!;
  bool hasRedirect() => _redirectLocation != null;
  void setRedirectLocationIfUnset(String loc) => _redirectLocation ??= loc;
  void clearRedirectLocation() => _redirectLocation = null;

  /// Mark as not needing to notify on a sign in / out when we intend
  /// to perform subsequent actions (such as navigation) afterwards.
  void updateNotifyOnAuthChange(bool notify) => notifyOnAuthChange = notify;

  void update(BaseAuthUser newUser) {
    final shouldUpdate =
        user?.uid == null || newUser.uid == null || user?.uid != newUser.uid;
    initialUser ??= newUser;
    user = newUser;
    // Refresh the app on auth change unless explicitly marked otherwise.
    // No need to update unless the user has changed.
    if (notifyOnAuthChange && shouldUpdate) {
      notifyListeners();
    }
    // Once again mark the notifier as needing to update on auth change
    // (in order to catch sign in / out events).
    updateNotifyOnAuthChange(true);
  }

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      errorBuilder: (context, state) =>
          appStateNotifier.loggedIn ? const NavBarPage() : const GettingStartedWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) =>
              appStateNotifier.loggedIn ? const NavBarPage() : const GettingStartedWidget(),
        ),
        FFRoute(
          name: 'GettingStarted',
          path: '/gettingStarted',
          builder: (context, params) => const GettingStartedWidget(),
        ),
        FFRoute(
          name: 'homepage',
          path: '/homepage',
          builder: (context, params) => params.isEmpty
              ? const NavBarPage(initialPage: 'homepage')
              : const HomepageWidget(),
        ),
        FFRoute(
          name: 'scriptures',
          path: '/scriptures',
          builder: (context, params) => params.isEmpty
              ? const NavBarPage(initialPage: 'scriptures')
              : const ScripturesWidget(),
        ),
        FFRoute(
          name: 'scriptures7',
          path: '/scriptures7',
          builder: (context, params) => params.isEmpty
              ? const NavBarPage(initialPage: 'scriptures7')
              : const Scriptures7Widget(),
        ),
        FFRoute(
          name: 'scriptures5',
          path: '/scriptures5',
          builder: (context, params) => params.isEmpty
              ? const NavBarPage(initialPage: 'scriptures5')
              : const Scriptures5Widget(),
        ),
        FFRoute(
          name: 'scriptures3',
          path: '/scriptures3',
          builder: (context, params) => params.isEmpty
              ? const NavBarPage(initialPage: 'scriptures3')
              : const Scriptures3Widget(),
        ),
        FFRoute(
          name: 'scriptures4',
          path: '/scriptures4',
          builder: (context, params) => params.isEmpty
              ? const NavBarPage(initialPage: 'scriptures4')
              : const Scriptures4Widget(),
        ),
        FFRoute(
          name: 'scriptures8',
          path: '/scriptures8',
          builder: (context, params) => params.isEmpty
              ? const NavBarPage(initialPage: 'scriptures8')
              : const Scriptures8Widget(),
        ),
        FFRoute(
          name: 'scriptures2',
          path: '/scriptures2',
          builder: (context, params) => params.isEmpty
              ? const NavBarPage(initialPage: 'scriptures2')
              : const Scriptures2Widget(),
        ),
        FFRoute(
          name: 'scriptures6',
          path: '/scriptures6',
          builder: (context, params) => params.isEmpty
              ? const NavBarPage(initialPage: 'scriptures6')
              : const Scriptures6Widget(),
        ),
        FFRoute(
          name: 'Day1',
          path: '/day1',
          builder: (context, params) => const Day1Widget(),
        ),
        FFRoute(
          name: 'Day2',
          path: '/day2',
          builder: (context, params) => const Day2Widget(),
        ),
        FFRoute(
          name: 'Day3',
          path: '/day3',
          builder: (context, params) => const Day3Widget(),
        ),
        FFRoute(
          name: 'Day4',
          path: '/day4',
          builder: (context, params) => const Day4Widget(),
        ),
        FFRoute(
          name: 'Day5',
          path: '/day5',
          builder: (context, params) => const Day5Widget(),
        ),
        FFRoute(
          name: 'Day6',
          path: '/day6',
          builder: (context, params) => const Day6Widget(),
        ),
        FFRoute(
          name: 'Day7',
          path: '/day7',
          builder: (context, params) => const Day7Widget(),
        ),
        FFRoute(
          name: 'Day8',
          path: '/day8',
          builder: (context, params) => const Day8Widget(),
        ),
        FFRoute(
          name: 'Day9',
          path: '/day9',
          builder: (context, params) => const Day9Widget(),
        ),
        FFRoute(
          name: 'Day10',
          path: '/day10',
          builder: (context, params) => const Day10Widget(),
        ),
        FFRoute(
          name: 'Day11',
          path: '/day11',
          builder: (context, params) => const Day11Widget(),
        ),
        FFRoute(
          name: 'Day12',
          path: '/day12',
          builder: (context, params) => const Day12Widget(),
        ),
        FFRoute(
          name: 'Day13',
          path: '/day13',
          builder: (context, params) => const Day13Widget(),
        ),
        FFRoute(
          name: 'Day14',
          path: '/day14',
          builder: (context, params) => const Day14Widget(),
        ),
        FFRoute(
          name: 'Day15',
          path: '/day15',
          builder: (context, params) => const Day15Widget(),
        ),
        FFRoute(
          name: 'Day16',
          path: '/day16',
          builder: (context, params) => const Day16Widget(),
        ),
        FFRoute(
          name: 'Day17',
          path: '/day17',
          builder: (context, params) => const Day17Widget(),
        ),
        FFRoute(
          name: 'Day18',
          path: '/day18',
          builder: (context, params) => const Day18Widget(),
        ),
        FFRoute(
          name: 'Day19',
          path: '/day19',
          builder: (context, params) => const Day19Widget(),
        ),
        FFRoute(
          name: 'Day20',
          path: '/day20',
          builder: (context, params) => const Day20Widget(),
        ),
        FFRoute(
          name: 'Day21',
          path: '/day21',
          builder: (context, params) => const Day21Widget(),
        ),
        FFRoute(
          name: 'Day22',
          path: '/day22',
          builder: (context, params) => const Day22Widget(),
        ),
        FFRoute(
          name: 'Day23',
          path: '/day23',
          builder: (context, params) => const Day23Widget(),
        ),
        FFRoute(
          name: 'Day24',
          path: '/day24',
          builder: (context, params) => const Day24Widget(),
        ),
        FFRoute(
          name: 'Day25',
          path: '/day25',
          builder: (context, params) => const Day25Widget(),
        ),
        FFRoute(
          name: 'Day26',
          path: '/day26',
          builder: (context, params) => const Day26Widget(),
        ),
        FFRoute(
          name: 'Day27',
          path: '/day27',
          builder: (context, params) => const Day27Widget(),
        ),
        FFRoute(
          name: 'Day28',
          path: '/day28',
          builder: (context, params) => const Day28Widget(),
        ),
        FFRoute(
          name: 'Day29',
          path: '/day29',
          builder: (context, params) => const Day29Widget(),
        ),
        FFRoute(
          name: 'Day30',
          path: '/day30',
          builder: (context, params) => const Day30Widget(),
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
  void goNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : goNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void pushNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : pushNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

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

extension GoRouterExtensions on GoRouter {
  AppStateNotifier get appState => AppStateNotifier.instance;
  void prepareAuthEvent([bool ignoreRedirect = false]) =>
      appState.hasRedirect() && !ignoreRedirect
          ? null
          : appState.updateNotifyOnAuthChange(false);
  bool shouldRedirect(bool ignoreRedirect) =>
      !ignoreRedirect && appState.hasRedirect();
  void clearRedirectLocation() => appState.clearRedirectLocation();
  void setRedirectLocationIfUnset(String location) =>
      appState.updateNotifyOnAuthChange(false);
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(pathParameters)
    ..addAll(queryParameters)
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
      (state.extraMap.length == 1 &&
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
    ParamType type, [
    bool isList = false,
  ]) {
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
        redirect: (context, state) {
          if (appStateNotifier.shouldRedirect) {
            final redirectLocation = appStateNotifier.getRedirectLocation();
            appStateNotifier.clearRedirectLocation();
            return redirectLocation;
          }

          if (requireAuth && !appStateNotifier.loggedIn) {
            appStateNotifier.setRedirectLocationIfUnset(state.location);
            return '/gettingStarted';
          }
          return null;
        },
        pageBuilder: (context, state) {
          fixStatusBarOniOS16AndBelow(context);
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = appStateNotifier.loading
              ? Container(
                  color: Colors.transparent,
                  child: Image.asset(
                    'assets/images/IMG_5007.PNG',
                    fit: BoxFit.cover,
                  ),
                )
              : page;

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

  static TransitionInfo appDefault() => const TransitionInfo(hasTransition: false);
}

class RootPageContext {
  const RootPageContext(this.isRootPage, [this.errorRoute]);
  final bool isRootPage;
  final String? errorRoute;

  static bool isInactiveRootPage(BuildContext context) {
    final rootPageContext = context.read<RootPageContext?>();
    final isRootPage = rootPageContext?.isRootPage ?? false;
    final location = GoRouter.of(context).location;
    return isRootPage &&
        location != '/' &&
        location != rootPageContext?.errorRoute;
  }

  static Widget wrap(Widget child, {String? errorRoute}) => Provider.value(
        value: RootPageContext(true, errorRoute),
        child: child,
      );
}
