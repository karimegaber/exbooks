import 'package:easy_localization/easy_localization.dart';
import 'package:exbooks/resources/strings_manager.dart';
import 'package:exbooks/views/layout/layout.dart';
import 'package:exbooks/views/on_boarding/on_boarding.dart';
import 'package:exbooks/views/register/register.dart';
import 'package:exbooks/views/splash/splash.dart';
import 'package:flutter/material.dart';

import '../views/login/login.dart';

class Routes {
  static const String splashScreenRoute = '/splash';
  static const String onBoardingScreenRoute = '/on_boarding';
  static const String loginScreenRoute = '/login';
  static const String registerScreenRoute = '/register';
  static const String layoutScreenRoute = '/layout';
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashScreenRoute:
        return MaterialPageRoute(
          builder: (_) => const SplashView(),
        );
      case Routes.onBoardingScreenRoute:
        return MaterialPageRoute(
          builder: (_) => const OnBoardingView(),
        );
      case Routes.loginScreenRoute:
        return MaterialPageRoute(
          builder: (_) => LoginView(),
        );
      case Routes.registerScreenRoute:
        return MaterialPageRoute(
          builder: (_) => RegisterView(),
        );
      case Routes.layoutScreenRoute:
        return MaterialPageRoute(
          builder: (_) => LayoutView(),
        );

      default:
        return undefinedRoute();
    }
  }

  // When a navigation error happens
  static Route<dynamic> undefinedRoute() => MaterialPageRoute(
        builder: (_) => Scaffold(
          appBar: AppBar(
            title: const Text(StringsManager.noRouteFound).tr(),
          ),
          body: Center(
            child: Text(StringsManager.noRouteFoundErrorMessage.tr()),
          ),
        ),
      );
}
