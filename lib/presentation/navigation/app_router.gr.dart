// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i2;
import 'package:flutter/cupertino.dart' as _i5;
import 'package:flutter/material.dart' as _i3;

import '../pages/pages.dart' as _i1;
import 'auth_guard.dart' as _i4;

class AppRouter extends _i2.RootStackRouter {
  AppRouter({
    _i3.GlobalKey<_i3.NavigatorState>? navigatorKey,
    required this.authGuard,
  }) : super(navigatorKey);

  final _i4.AuthGuard authGuard;

  @override
  final Map<String, _i2.PageFactory> pagesMap = {
    InitPageRoute.name: (routeData) {
      return _i2.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i1.InitPage(),
        transitionsBuilder: _i2.TransitionsBuilders.slideLeft,
        durationInMilliseconds: 400,
        opaque: true,
        barrierDismissible: false,
      );
    },
    LoginPageRoute.name: (routeData) {
      return _i2.CustomPage<dynamic>(
        routeData: routeData,
        child: _i1.LoginPage(),
        transitionsBuilder: _i2.TransitionsBuilders.slideLeft,
        durationInMilliseconds: 400,
        opaque: true,
        barrierDismissible: false,
      );
    },
    WelcomePageRoute.name: (routeData) {
      return _i2.CustomPage<dynamic>(
        routeData: routeData,
        child: _i1.WelcomePage(),
        transitionsBuilder: _i2.TransitionsBuilders.slideLeft,
        durationInMilliseconds: 400,
        opaque: true,
        barrierDismissible: false,
      );
    },
    HomePageRoute.name: (routeData) {
      return _i2.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i1.HomePage(),
        transitionsBuilder: _i2.TransitionsBuilders.slideLeft,
        durationInMilliseconds: 400,
        opaque: true,
        barrierDismissible: false,
      );
    },
    EditTripPageRoute.name: (routeData) {
      final args = routeData.argsAs<EditTripPageRouteArgs>();
      return _i2.CustomPage<dynamic>(
        routeData: routeData,
        child: _i1.EditTripPage(
          key: args.key,
          tripId: args.tripId,
        ),
        transitionsBuilder: _i2.TransitionsBuilders.slideLeft,
        durationInMilliseconds: 400,
        opaque: true,
        barrierDismissible: false,
      );
    },
  };

  @override
  List<_i2.RouteConfig> get routes => [
        _i2.RouteConfig(
          InitPageRoute.name,
          path: '/init-page',
          guards: [authGuard],
        ),
        _i2.RouteConfig(
          LoginPageRoute.name,
          path: '/',
        ),
        _i2.RouteConfig(
          WelcomePageRoute.name,
          path: '/welcome-page',
        ),
        _i2.RouteConfig(
          HomePageRoute.name,
          path: '/home-page',
        ),
        _i2.RouteConfig(
          EditTripPageRoute.name,
          path: '/edit-trip-page',
        ),
      ];
}

/// generated route for
/// [_i1.InitPage]
class InitPageRoute extends _i2.PageRouteInfo<void> {
  const InitPageRoute()
      : super(
          InitPageRoute.name,
          path: '/init-page',
        );

  static const String name = 'InitPageRoute';
}

/// generated route for
/// [_i1.LoginPage]
class LoginPageRoute extends _i2.PageRouteInfo<void> {
  const LoginPageRoute()
      : super(
          LoginPageRoute.name,
          path: '/',
        );

  static const String name = 'LoginPageRoute';
}

/// generated route for
/// [_i1.WelcomePage]
class WelcomePageRoute extends _i2.PageRouteInfo<void> {
  const WelcomePageRoute()
      : super(
          WelcomePageRoute.name,
          path: '/welcome-page',
        );

  static const String name = 'WelcomePageRoute';
}

/// generated route for
/// [_i1.HomePage]
class HomePageRoute extends _i2.PageRouteInfo<void> {
  const HomePageRoute()
      : super(
          HomePageRoute.name,
          path: '/home-page',
        );

  static const String name = 'HomePageRoute';
}

/// generated route for
/// [_i1.EditTripPage]
class EditTripPageRoute extends _i2.PageRouteInfo<EditTripPageRouteArgs> {
  EditTripPageRoute({
    _i5.Key? key,
    required int tripId,
  }) : super(
          EditTripPageRoute.name,
          path: '/edit-trip-page',
          args: EditTripPageRouteArgs(
            key: key,
            tripId: tripId,
          ),
        );

  static const String name = 'EditTripPageRoute';
}

class EditTripPageRouteArgs {
  const EditTripPageRouteArgs({
    this.key,
    required this.tripId,
  });

  final _i5.Key? key;

  final int tripId;

  @override
  String toString() {
    return 'EditTripPageRouteArgs{key: $key, tripId: $tripId}';
  }
}
