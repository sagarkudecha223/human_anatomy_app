import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
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
      builder: (context, state) => _animation(const HomeScreen()),
      routes: [
        GoRoute(
          path: AppRoutes.anatomyView,
          builder: (context, state) => const AnatomyScreen(),
        ),
      ],
    ),
  ],
);

_animation(Widget child) {
  return Animate(
    child: child,
  ).moveY(begin: 40, end: 0, curve: Curves.easeOutCubic);
}
