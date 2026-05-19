import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';

import '/auth/base_auth_user_provider.dart';

import '/index.dart';
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
          appStateNotifier.loggedIn ? const DashboardWidget() : const SigninpageWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) => appStateNotifier.loggedIn
              ? const DashboardWidget()
              : const SigninpageWidget(),
        ),
        FFRoute(
          name: 'HomePage',
          path: '/homePage',
          builder: (context, params) => const HomePageWidget(),
        ),
        FFRoute(
          name: 'signinpage',
          path: '/signin',
          builder: (context, params) => const SigninpageWidget(),
        ),
        FFRoute(
          name: 'signuppage',
          path: '/signup',
          builder: (context, params) => const SignuppageWidget(),
        ),
        FFRoute(
          name: 'userprofile',
          path: '/userprofile',
          builder: (context, params) => const UserprofileWidget(),
        ),
        FFRoute(
          name: 'forgetpasswordpage',
          path: '/forgetpasswordpage',
          builder: (context, params) => const ForgetpasswordpageWidget(),
        ),
        FFRoute(
          name: 'Dashboard',
          path: '/dashboard',
          builder: (context, params) => const DashboardWidget(),
        ),
        FFRoute(
          name: 'Settings',
          path: '/settings',
          builder: (context, params) => const SettingsWidget(),
        ),
        FFRoute(
          name: 'editprofile',
          path: '/editprofile',
          builder: (context, params) => const EditprofileWidget(),
        ),
        FFRoute(
          name: 'ScienceQ1',
          path: '/scienceQ1',
          builder: (context, params) => ScienceQ1Widget(
            isTrue: params.getParam(
              'isTrue',
              ParamType.bool,
            ),
            isAnswered: params.getParam(
              'isAnswered',
              ParamType.bool,
            ),
          ),
        ),
        FFRoute(
          name: 'Q2',
          path: '/q2',
          builder: (context, params) => Q2Widget(
            isTrue: params.getParam(
              'isTrue',
              ParamType.bool,
            ),
            isAnswered: params.getParam(
              'isAnswered',
              ParamType.bool,
            ),
          ),
        ),
        FFRoute(
          name: 'Q3',
          path: '/q3',
          builder: (context, params) => Q3Widget(
            isTrue: params.getParam(
              'isTrue',
              ParamType.bool,
            ),
            isAnswered: params.getParam(
              'isAnswered',
              ParamType.bool,
            ),
          ),
        ),
        FFRoute(
          name: 'Q4',
          path: '/q4',
          builder: (context, params) => Q4Widget(
            isTrue: params.getParam(
              'isTrue',
              ParamType.bool,
            ),
            isAnswered: params.getParam(
              'isAnswered',
              ParamType.bool,
            ),
          ),
        ),
        FFRoute(
          name: 'Q5',
          path: '/q5',
          builder: (context, params) => Q5Widget(
            isTrue: params.getParam(
              'isTrue',
              ParamType.bool,
            ),
            isAnswered: params.getParam(
              'isAnswered',
              ParamType.bool,
            ),
          ),
        ),
        FFRoute(
          name: 'Q6',
          path: '/q6',
          builder: (context, params) => Q6Widget(
            isTrue: params.getParam(
              'isTrue',
              ParamType.bool,
            ),
            isAnswered: params.getParam(
              'isAnswered',
              ParamType.bool,
            ),
          ),
        ),
        FFRoute(
          name: 'Q7',
          path: '/q7',
          builder: (context, params) => Q7Widget(
            isTrue: params.getParam(
              'isTrue',
              ParamType.bool,
            ),
            isAnswered: params.getParam(
              'isAnswered',
              ParamType.bool,
            ),
          ),
        ),
        FFRoute(
          name: 'Q8',
          path: '/q8',
          builder: (context, params) => Q8Widget(
            isTrue: params.getParam(
              'isTrue',
              ParamType.bool,
            ),
            isAnswered: params.getParam(
              'isAnswered',
              ParamType.bool,
            ),
          ),
        ),
        FFRoute(
          name: 'Q9',
          path: '/q9',
          builder: (context, params) => Q9Widget(
            isTrue: params.getParam(
              'isTrue',
              ParamType.bool,
            ),
            isAnswered: params.getParam(
              'isAnswered',
              ParamType.bool,
            ),
          ),
        ),
        FFRoute(
          name: 'Q10',
          path: '/q10',
          builder: (context, params) => Q10Widget(
            isTrue: params.getParam(
              'isTrue',
              ParamType.bool,
            ),
            isAnswered: params.getParam(
              'isAnswered',
              ParamType.bool,
            ),
          ),
        ),
        FFRoute(
          name: 'ScorePage',
          path: '/scorePage',
          builder: (context, params) => ScorePageWidget(
            scoreAchived: params.getParam(
              'scoreAchived',
              ParamType.int,
            ),
            totalQuestions: params.getParam(
              'totalQuestions',
              ParamType.int,
            ),
          ),
        ),
        FFRoute(
          name: 'K_score',
          path: '/kScore',
          builder: (context, params) => KScoreWidget(
            scoreAchived: params.getParam(
              'scoreAchived',
              ParamType.int,
            ),
            totalQuestions: params.getParam(
              'totalQuestions',
              ParamType.int,
            ),
          ),
        ),
        FFRoute(
          name: 'E_score',
          path: '/eScore',
          builder: (context, params) => EScoreWidget(
            scoreAchived: params.getParam(
              'scoreAchived',
              ParamType.int,
            ),
            totalQuestions: params.getParam(
              'totalQuestions',
              ParamType.int,
            ),
          ),
        ),
        FFRoute(
          name: 'S_score',
          path: '/sScore',
          builder: (context, params) => SScoreWidget(
            scoreAchived: params.getParam(
              'scoreAchived',
              ParamType.int,
            ),
            totalQuestions: params.getParam(
              'totalQuestions',
              ParamType.int,
            ),
          ),
        ),
        FFRoute(
          name: 'GK_score',
          path: '/gKScore',
          builder: (context, params) => GKScoreWidget(
            scoreAchived: params.getParam(
              'scoreAchived',
              ParamType.int,
            ),
            totalQuestions: params.getParam(
              'totalQuestions',
              ParamType.int,
            ),
          ),
        ),
        FFRoute(
          name: 'M_Score',
          path: '/mScore',
          builder: (context, params) => MScoreWidget(
            scoreAchived: params.getParam(
              'scoreAchived',
              ParamType.int,
            ),
            totalQuestions: params.getParam(
              'totalQuestions',
              ParamType.int,
            ),
          ),
        ),
        FFRoute(
          name: 'MQ1',
          path: '/mq1',
          builder: (context, params) => Mq1Widget(
            isTrue: params.getParam(
              'isTrue',
              ParamType.bool,
            ),
            isAnswered: params.getParam(
              'isAnswered',
              ParamType.bool,
            ),
          ),
        ),
        FFRoute(
          name: 'GKQ1',
          path: '/gkq1',
          builder: (context, params) => Gkq1Widget(
            isTrue: params.getParam(
              'isTrue',
              ParamType.bool,
            ),
            isAnswered: params.getParam(
              'isAnswered',
              ParamType.bool,
            ),
          ),
        ),
        FFRoute(
          name: 'SQ1',
          path: '/sq1',
          builder: (context, params) => Sq1Widget(
            isTrue: params.getParam(
              'isTrue',
              ParamType.bool,
            ),
            isAnswered: params.getParam(
              'isAnswered',
              ParamType.bool,
            ),
          ),
        ),
        FFRoute(
          name: 'EQ1',
          path: '/eq1',
          builder: (context, params) => Eq1Widget(
            isTrue: params.getParam(
              'isTrue',
              ParamType.bool,
            ),
            isAnswered: params.getParam(
              'isAnswered',
              ParamType.bool,
            ),
          ),
        ),
        FFRoute(
          name: 'KQ1',
          path: '/kq1',
          builder: (context, params) => Kq1Widget(
            isTrue: params.getParam(
              'isTrue',
              ParamType.bool,
            ),
            isAnswered: params.getParam(
              'isAnswered',
              ParamType.bool,
            ),
          ),
        ),
        FFRoute(
          name: 'MQ2',
          path: '/mq2',
          builder: (context, params) => Mq2Widget(
            isTrue: params.getParam(
              'isTrue',
              ParamType.bool,
            ),
            isAnswered: params.getParam(
              'isAnswered',
              ParamType.bool,
            ),
          ),
        ),
        FFRoute(
          name: 'MQ3',
          path: '/mq3',
          builder: (context, params) => Mq3Widget(
            isTrue: params.getParam(
              'isTrue',
              ParamType.bool,
            ),
            isAnswered: params.getParam(
              'isAnswered',
              ParamType.bool,
            ),
          ),
        ),
        FFRoute(
          name: 'MQ4',
          path: '/mq4',
          builder: (context, params) => Mq4Widget(
            isTrue: params.getParam(
              'isTrue',
              ParamType.bool,
            ),
            isAnswered: params.getParam(
              'isAnswered',
              ParamType.bool,
            ),
          ),
        ),
        FFRoute(
          name: 'MQ5',
          path: '/mq5',
          builder: (context, params) => Mq5Widget(
            isTrue: params.getParam(
              'isTrue',
              ParamType.bool,
            ),
            isAnswered: params.getParam(
              'isAnswered',
              ParamType.bool,
            ),
          ),
        ),
        FFRoute(
          name: 'MQ6',
          path: '/mq6',
          builder: (context, params) => Mq6Widget(
            isTrue: params.getParam(
              'isTrue',
              ParamType.bool,
            ),
            isAnswered: params.getParam(
              'isAnswered',
              ParamType.bool,
            ),
          ),
        ),
        FFRoute(
          name: 'MQ7',
          path: '/mq7',
          builder: (context, params) => Mq7Widget(
            isTrue: params.getParam(
              'isTrue',
              ParamType.bool,
            ),
            isAnswered: params.getParam(
              'isAnswered',
              ParamType.bool,
            ),
          ),
        ),
        FFRoute(
          name: 'MQ8',
          path: '/mq8',
          builder: (context, params) => Mq8Widget(
            isTrue: params.getParam(
              'isTrue',
              ParamType.bool,
            ),
            isAnswered: params.getParam(
              'isAnswered',
              ParamType.bool,
            ),
          ),
        ),
        FFRoute(
          name: 'MQ9',
          path: '/mq9',
          builder: (context, params) => Mq9Widget(
            isTrue: params.getParam(
              'isTrue',
              ParamType.bool,
            ),
            isAnswered: params.getParam(
              'isAnswered',
              ParamType.bool,
            ),
          ),
        ),
        FFRoute(
          name: 'MQ10',
          path: '/mq10',
          builder: (context, params) => Mq10Widget(
            isTrue: params.getParam(
              'isTrue',
              ParamType.bool,
            ),
            isAnswered: params.getParam(
              'isAnswered',
              ParamType.bool,
            ),
          ),
        ),
        FFRoute(
          name: 'GKQ2',
          path: '/gkq2',
          builder: (context, params) => Gkq2Widget(
            isTrue: params.getParam(
              'isTrue',
              ParamType.bool,
            ),
            isAnswered: params.getParam(
              'isAnswered',
              ParamType.bool,
            ),
          ),
        ),
        FFRoute(
          name: 'GKQ3',
          path: '/gkq3',
          builder: (context, params) => Gkq3Widget(
            isTrue: params.getParam(
              'isTrue',
              ParamType.bool,
            ),
            isAnswered: params.getParam(
              'isAnswered',
              ParamType.bool,
            ),
          ),
        ),
        FFRoute(
          name: 'GKQ4',
          path: '/gkq4',
          builder: (context, params) => Gkq4Widget(
            isTrue: params.getParam(
              'isTrue',
              ParamType.bool,
            ),
            isAnswered: params.getParam(
              'isAnswered',
              ParamType.bool,
            ),
          ),
        ),
        FFRoute(
          name: 'GKQ5',
          path: '/gkq5',
          builder: (context, params) => Gkq5Widget(
            isTrue: params.getParam(
              'isTrue',
              ParamType.bool,
            ),
            isAnswered: params.getParam(
              'isAnswered',
              ParamType.bool,
            ),
          ),
        ),
        FFRoute(
          name: 'GKQ6',
          path: '/gkq6',
          builder: (context, params) => Gkq6Widget(
            isTrue: params.getParam(
              'isTrue',
              ParamType.bool,
            ),
            isAnswered: params.getParam(
              'isAnswered',
              ParamType.bool,
            ),
          ),
        ),
        FFRoute(
          name: 'GKQ7',
          path: '/gkq7',
          builder: (context, params) => Gkq7Widget(
            isTrue: params.getParam(
              'isTrue',
              ParamType.bool,
            ),
            isAnswered: params.getParam(
              'isAnswered',
              ParamType.bool,
            ),
          ),
        ),
        FFRoute(
          name: 'GKQ8',
          path: '/gkq8',
          builder: (context, params) => Gkq8Widget(
            isTrue: params.getParam(
              'isTrue',
              ParamType.bool,
            ),
            isAnswered: params.getParam(
              'isAnswered',
              ParamType.bool,
            ),
          ),
        ),
        FFRoute(
          name: 'GKQ9',
          path: '/gkq9',
          builder: (context, params) => Gkq9Widget(
            isTrue: params.getParam(
              'isTrue',
              ParamType.bool,
            ),
            isAnswered: params.getParam(
              'isAnswered',
              ParamType.bool,
            ),
          ),
        ),
        FFRoute(
          name: 'GKQ10',
          path: '/gkq10',
          builder: (context, params) => Gkq10Widget(
            isTrue: params.getParam(
              'isTrue',
              ParamType.bool,
            ),
            isAnswered: params.getParam(
              'isAnswered',
              ParamType.bool,
            ),
          ),
        ),
        FFRoute(
          name: 'SQ2',
          path: '/sq2',
          builder: (context, params) => Sq2Widget(
            isTrue: params.getParam(
              'isTrue',
              ParamType.bool,
            ),
            isAnswered: params.getParam(
              'isAnswered',
              ParamType.bool,
            ),
          ),
        ),
        FFRoute(
          name: 'SQ3',
          path: '/sq3',
          builder: (context, params) => Sq3Widget(
            isTrue: params.getParam(
              'isTrue',
              ParamType.bool,
            ),
            isAnswered: params.getParam(
              'isAnswered',
              ParamType.bool,
            ),
          ),
        ),
        FFRoute(
          name: 'SQ4',
          path: '/sq4',
          builder: (context, params) => Sq4Widget(
            isTrue: params.getParam(
              'isTrue',
              ParamType.bool,
            ),
            isAnswered: params.getParam(
              'isAnswered',
              ParamType.bool,
            ),
          ),
        ),
        FFRoute(
          name: 'SQ5',
          path: '/sq5',
          builder: (context, params) => Sq5Widget(
            isTrue: params.getParam(
              'isTrue',
              ParamType.bool,
            ),
            isAnswered: params.getParam(
              'isAnswered',
              ParamType.bool,
            ),
          ),
        ),
        FFRoute(
          name: 'SQ6',
          path: '/sq6',
          builder: (context, params) => Sq6Widget(
            isTrue: params.getParam(
              'isTrue',
              ParamType.bool,
            ),
            isAnswered: params.getParam(
              'isAnswered',
              ParamType.bool,
            ),
          ),
        ),
        FFRoute(
          name: 'SQ7',
          path: '/sq7',
          builder: (context, params) => Sq7Widget(
            isTrue: params.getParam(
              'isTrue',
              ParamType.bool,
            ),
            isAnswered: params.getParam(
              'isAnswered',
              ParamType.bool,
            ),
          ),
        ),
        FFRoute(
          name: 'SQ8',
          path: '/sq8',
          builder: (context, params) => Sq8Widget(
            isTrue: params.getParam(
              'isTrue',
              ParamType.bool,
            ),
            isAnswered: params.getParam(
              'isAnswered',
              ParamType.bool,
            ),
          ),
        ),
        FFRoute(
          name: 'SQ9',
          path: '/sq9',
          builder: (context, params) => Sq9Widget(
            isTrue: params.getParam(
              'isTrue',
              ParamType.bool,
            ),
            isAnswered: params.getParam(
              'isAnswered',
              ParamType.bool,
            ),
          ),
        ),
        FFRoute(
          name: 'SQ10',
          path: '/sq10',
          builder: (context, params) => Sq10Widget(
            isTrue: params.getParam(
              'isTrue',
              ParamType.bool,
            ),
            isAnswered: params.getParam(
              'isAnswered',
              ParamType.bool,
            ),
          ),
        ),
        FFRoute(
          name: 'EQ2',
          path: '/eq2',
          builder: (context, params) => Eq2Widget(
            isTrue: params.getParam(
              'isTrue',
              ParamType.bool,
            ),
            isAnswered: params.getParam(
              'isAnswered',
              ParamType.bool,
            ),
          ),
        ),
        FFRoute(
          name: 'EQ3',
          path: '/eq3',
          builder: (context, params) => Eq3Widget(
            isTrue: params.getParam(
              'isTrue',
              ParamType.bool,
            ),
            isAnswered: params.getParam(
              'isAnswered',
              ParamType.bool,
            ),
          ),
        ),
        FFRoute(
          name: 'EQ4',
          path: '/eq4',
          builder: (context, params) => Eq4Widget(
            isTrue: params.getParam(
              'isTrue',
              ParamType.bool,
            ),
            isAnswered: params.getParam(
              'isAnswered',
              ParamType.bool,
            ),
          ),
        ),
        FFRoute(
          name: 'EQ5',
          path: '/eq5',
          builder: (context, params) => Eq5Widget(
            isTrue: params.getParam(
              'isTrue',
              ParamType.bool,
            ),
            isAnswered: params.getParam(
              'isAnswered',
              ParamType.bool,
            ),
          ),
        ),
        FFRoute(
          name: 'EQ6',
          path: '/eq6',
          builder: (context, params) => Eq6Widget(
            isTrue: params.getParam(
              'isTrue',
              ParamType.bool,
            ),
            isAnswered: params.getParam(
              'isAnswered',
              ParamType.bool,
            ),
          ),
        ),
        FFRoute(
          name: 'EQ7',
          path: '/eq7',
          builder: (context, params) => Eq7Widget(
            isTrue: params.getParam(
              'isTrue',
              ParamType.bool,
            ),
            isAnswered: params.getParam(
              'isAnswered',
              ParamType.bool,
            ),
          ),
        ),
        FFRoute(
          name: 'EQ8',
          path: '/eq8',
          builder: (context, params) => Eq8Widget(
            isTrue: params.getParam(
              'isTrue',
              ParamType.bool,
            ),
            isAnswered: params.getParam(
              'isAnswered',
              ParamType.bool,
            ),
          ),
        ),
        FFRoute(
          name: 'EQ9',
          path: '/eq9',
          builder: (context, params) => Eq9Widget(
            isTrue: params.getParam(
              'isTrue',
              ParamType.bool,
            ),
            isAnswered: params.getParam(
              'isAnswered',
              ParamType.bool,
            ),
          ),
        ),
        FFRoute(
          name: 'EQ10',
          path: '/eq10',
          builder: (context, params) => Eq10Widget(
            isTrue: params.getParam(
              'isTrue',
              ParamType.bool,
            ),
            isAnswered: params.getParam(
              'isAnswered',
              ParamType.bool,
            ),
          ),
        ),
        FFRoute(
          name: 'KQ2',
          path: '/kq2',
          builder: (context, params) => Kq2Widget(
            isTrue: params.getParam(
              'isTrue',
              ParamType.bool,
            ),
            isAnswered: params.getParam(
              'isAnswered',
              ParamType.bool,
            ),
          ),
        ),
        FFRoute(
          name: 'KQ10',
          path: '/kq10',
          builder: (context, params) => Kq10Widget(
            isTrue: params.getParam(
              'isTrue',
              ParamType.bool,
            ),
            isAnswered: params.getParam(
              'isAnswered',
              ParamType.bool,
            ),
          ),
        ),
        FFRoute(
          name: 'KQ3',
          path: '/kq3',
          builder: (context, params) => Kq3Widget(
            isTrue: params.getParam(
              'isTrue',
              ParamType.bool,
            ),
            isAnswered: params.getParam(
              'isAnswered',
              ParamType.bool,
            ),
          ),
        ),
        FFRoute(
          name: 'KQ4',
          path: '/kq4',
          builder: (context, params) => Kq4Widget(
            isTrue: params.getParam(
              'isTrue',
              ParamType.bool,
            ),
            isAnswered: params.getParam(
              'isAnswered',
              ParamType.bool,
            ),
          ),
        ),
        FFRoute(
          name: 'KQ5',
          path: '/kq5',
          builder: (context, params) => Kq5Widget(
            isTrue: params.getParam(
              'isTrue',
              ParamType.bool,
            ),
            isAnswered: params.getParam(
              'isAnswered',
              ParamType.bool,
            ),
          ),
        ),
        FFRoute(
          name: 'KQ6',
          path: '/kq6',
          builder: (context, params) => Kq6Widget(
            isTrue: params.getParam(
              'isTrue',
              ParamType.bool,
            ),
            isAnswered: params.getParam(
              'isAnswered',
              ParamType.bool,
            ),
          ),
        ),
        FFRoute(
          name: 'KQ7',
          path: '/kq7',
          builder: (context, params) => Kq7Widget(
            isTrue: params.getParam(
              'isTrue',
              ParamType.bool,
            ),
            isAnswered: params.getParam(
              'isAnswered',
              ParamType.bool,
            ),
          ),
        ),
        FFRoute(
          name: 'KQ8',
          path: '/kq8',
          builder: (context, params) => Kq8Widget(
            isTrue: params.getParam(
              'isTrue',
              ParamType.bool,
            ),
            isAnswered: params.getParam(
              'isAnswered',
              ParamType.bool,
            ),
          ),
        ),
        FFRoute(
          name: 'KQ9',
          path: '/kq9',
          builder: (context, params) => Kq9Widget(
            isTrue: params.getParam(
              'isTrue',
              ParamType.bool,
            ),
            isAnswered: params.getParam(
              'isAnswered',
              ParamType.bool,
            ),
          ),
        ),
        FFRoute(
          name: 'supportpage',
          path: '/supportpage',
          builder: (context, params) => const SupportpageWidget(),
        ),
        FFRoute(
          name: 'termsandconditions',
          path: '/termsandconditions',
          builder: (context, params) => const TermsandconditionsWidget(),
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
    List<String>? collectionNamePath,
    StructBuilder<T>? structBuilder,
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
      collectionNamePath: collectionNamePath,
      structBuilder: structBuilder,
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
            appStateNotifier.setRedirectLocationIfUnset(state.uri.toString());
            return '/signin';
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
                    'assets/images/1707996055223.png',
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
