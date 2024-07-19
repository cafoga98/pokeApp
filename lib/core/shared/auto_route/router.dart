import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '/core/shared/auto_route/pages.dart';

part 'router.gr.dart';

/// AppRouter
///
/// Manages the routing configuration for the Flutter application using the
/// `auto_route` package. It defines the routes and their initial configuration.
///
/// Example usage:
///
/// ```dart
/// final appRouter = AppRouter();
/// ```
@AutoRouterConfig(
  replaceInRouteName: 'Page,Route',
)
class AppRouter extends _$AppRouter {
  AppRouter() : super();

  @override
  RouteType get defaultRouteType => const RouteType.material();
  @override
  final List<AutoRoute> routes = [
    AutoRoute(page: SplashRoute.page, path: '/', initial: true),

  ];
}