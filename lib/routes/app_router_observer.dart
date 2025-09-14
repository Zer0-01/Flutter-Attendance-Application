import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_attendance_application/configuration/app_logger.dart';

class AppRouterObserver extends AutoRouterObserver {
  final _logger = AppLogger.getLogger("AutoRouter");

  /// Log when a new route is pushed
  @override
  void didPush(Route route, Route? previousRoute) {
    _logger.debug(
      'PUSHED → ${_routeName(route)} (from: ${_routeName(previousRoute)})',
    );
  }

  /// Log when a route is popped
  @override
  void didPop(Route route, Route? previousRoute) {
    _logger.debug(
      'POPPED → ${_routeName(route)} (returned to: ${_routeName(previousRoute)})',
    );
  }

  /// Log when a route is replaced
  @override
  void didReplace({Route? newRoute, Route? oldRoute}) {
    _logger.info(
      'REPLACED → ${_routeName(oldRoute)} with: ${_routeName(newRoute)}',
    );
  }

  /// Log when a route is removed from the stack
  @override
  void didRemove(Route route, Route? previousRoute) {
    _logger.warn(
      'REMOVED → ${_routeName(route)} (after: ${_routeName(previousRoute)})',
    );
  }

  /// Log when a tab is initialized
  @override
  void didInitTabRoute(TabPageRoute route, TabPageRoute? previousRoute) {
    _logger.info(
      'INIT TAB → ${route.name} (from: ${previousRoute?.name ?? 'none'})',
    );
  }

  /// Log when switching between tabs
  @override
  void didChangeTabRoute(TabPageRoute route, TabPageRoute previousRoute) {
    _logger.debug('TAB SWITCHED → ${route.name} (from: ${previousRoute.name})');
  }

  /// Helper method to get route name safely
  String _routeName(Route? route) {
    return route?.settings.name ?? 'UnnamedRoute';
  }
}
