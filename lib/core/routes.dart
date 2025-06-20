import 'package:flutter/material.dart';
import 'package:flutter_base_architecture_plugin/imports/dart_package_imports.dart';
import 'package:go_router/go_router.dart';

import '../services/theme_service/theme_service.dart';
import 'dimens.dart';

class AppRoutes {
  static const String anatomyView = '/anatomyView';
  static const String homeScreen = '/homeScreen';
}

class AppRouteConfig {
  static final GlobalKey<NavigatorState> rootNavigatorKey =
      GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> shellNavigatorKey =
      GlobalKey<NavigatorState>();

  static final GoRouter router = GoRouter(
    navigatorKey: rootNavigatorKey,
    initialLocation: AppRoutes.homeScreen,
    routes: [
      GoRoute(
        path: AppRoutes.homeScreen,
        builder: (BuildContext context, GoRouterState state) {
          return Scaffold(
            body: Center(
              child: ElevatedButton(
                onPressed:
                    () =>
                        KiwiContainer()
                            .resolve<ThemeService>()
                            .changeThemeMode(),
                child: Text(
                  'Home Screen, ${Dimens.fontSizeFourteen}',
                  style: TextStyle(fontSize: Dimens.fontSizeFourteen),
                ),
              ),
            ),
          );
        },
      ),
    ],
  );
}
