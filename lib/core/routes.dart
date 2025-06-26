import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../ui/anatomy/anatomy_screen.dart';
import '../ui/home/home_screen.dart';
import 'enum.dart';

final rootNavigatorKey = GlobalKey<NavigatorState>();

class AppRoutes {
  static const String homeToAnatomyView = '/homeScreen/anatomyView';
  static const String anatomyView = 'anatomyView';
  static const String homeScreen = '/homeScreen';
  static const String closeTreatmentOption = '/closeTreatmentOption';
}

final router = GoRouter(
  navigatorKey: rootNavigatorKey,
  initialLocation: AppRoutes.homeScreen,
  routes: [
    GoRoute(
      path: AppRoutes.homeScreen,
      builder: (context, state) => const HomeScreen(),
      routes: [
        GoRoute(
          path: AppRoutes.anatomyView,
          pageBuilder: (context, state) {
            final viewParam = state.uri.queryParameters['view'];
            final view = AnatomyViewEnum.values.firstWhere(
              (e) => e.name == viewParam,
              orElse: () => AnatomyViewEnum.teeth,
            );
            return _buildPageWithTransition(
              state,
              AnatomyScreen(anatomyViewEnum: view),
            );
          },
        ),
      ],
    ),
  ],
);

CustomTransitionPage _buildPageWithTransition(
  GoRouterState state,
  Widget child,
) {
  return CustomTransitionPage(
    key: state.pageKey,
    child: child,
    reverseTransitionDuration: const Duration(milliseconds: 500),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      final offsetAnimation = Tween<Offset>(
        begin: const Offset(1.0, 0.0),
        end: Offset.zero,
      ).animate(CurvedAnimation(parent: animation, curve: Curves.linear));
      return SlideTransition(position: offsetAnimation, child: child);
    },
    transitionDuration: const Duration(milliseconds: 500),
  );
}
