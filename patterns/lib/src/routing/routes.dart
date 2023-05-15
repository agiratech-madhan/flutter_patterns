import 'package:realm_todo/src/features/home/controller/document_data.dart';
import 'package:realm_todo/src/features/home/home.dart';

import '../../src/routing/route_constants.dart';
import 'package:flutter/material.dart';

import '../features/splash/screen/splash_screen.dart';

class RouteManager {
  MaterialPageRoute<dynamic> route(RouteSettings settings) {
    final data = settings.arguments != null ? settings.arguments ?? {} : {};
    debugPrint(settings.name);
    switch (settings.name) {
      case RouteConstants.splashScreen:
        return MaterialPageRoute(
            settings: const RouteSettings(
              name: RouteConstants.splashScreen,
            ),
            builder: (context) => const SplashScreen());
      case RouteConstants.homeScreen:
        return MaterialPageRoute(
            settings: const RouteSettings(
              name: RouteConstants.homeScreen,
            ),
            builder: (context) => HomeScreen(
                  document: Document(),
                ));
      default:
        return MaterialPageRoute(
            settings: const RouteSettings(name: RouteConstants.homeScreen),
            builder: (context) => HomeScreen(
                  document: Document(),
                ));
    }
  }
}

RouteFactory get onGenerateRoute => RouteManager().route;
