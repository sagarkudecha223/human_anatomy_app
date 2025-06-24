import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../ui/anatomy/anatomy_screen.dart';
import '../ui/home/home_screen.dart';

final rootNavigatorKey = GlobalKey<NavigatorState>();

class AppRoutes {
  static const String homeToAnatomyView = '/homeScreen/anatomyView';
  static const String anatomyView = 'anatomyView';
  static const String homeScreen = '/homeScreen';
}

final router = GoRouter(
  navigatorKey: rootNavigatorKey,
  debugLogDiagnostics: true,
  initialLocation: AppRoutes.homeScreen,

  routes: [
    GoRoute(
      path: AppRoutes.homeScreen,
      builder: (context, state) => const HomeScreen(),
      routes: [
        GoRoute(
          path: AppRoutes.anatomyView,
          builder: (context, state) => const AnatomyScreen(),
        ),
      ],
    ),
  ],
);
