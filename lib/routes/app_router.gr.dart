// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:flutter_attendance_application/presentation/screen/home/home_setup_screen.dart'
    as _i1;
import 'package:flutter_attendance_application/presentation/screen/login/login_setup_screen.dart'
    as _i2;
import 'package:flutter_attendance_application/presentation/screen/profile/profile_setup_screen.dart'
    as _i3;
import 'package:flutter_attendance_application/presentation/screen/shell/shell_setup_screen.dart'
    as _i4;

/// generated route for
/// [_i1.HomeSetupScreen]
class HomeSetupRoute extends _i5.PageRouteInfo<void> {
  const HomeSetupRoute({List<_i5.PageRouteInfo>? children})
      : super(HomeSetupRoute.name, initialChildren: children);

  static const String name = 'HomeSetupRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i1.HomeSetupScreen();
    },
  );
}

/// generated route for
/// [_i2.LoginSetupScreen]
class LoginSetupRoute extends _i5.PageRouteInfo<void> {
  const LoginSetupRoute({List<_i5.PageRouteInfo>? children})
      : super(LoginSetupRoute.name, initialChildren: children);

  static const String name = 'LoginSetupRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i2.LoginSetupScreen();
    },
  );
}

/// generated route for
/// [_i3.ProfileSetupScreen]
class ProfileSetupRoute extends _i5.PageRouteInfo<void> {
  const ProfileSetupRoute({List<_i5.PageRouteInfo>? children})
      : super(ProfileSetupRoute.name, initialChildren: children);

  static const String name = 'ProfileSetupRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i3.ProfileSetupScreen();
    },
  );
}

/// generated route for
/// [_i4.ShellSetupScreen]
class ShellSetupRoute extends _i5.PageRouteInfo<void> {
  const ShellSetupRoute({List<_i5.PageRouteInfo>? children})
      : super(ShellSetupRoute.name, initialChildren: children);

  static const String name = 'ShellSetupRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i4.ShellSetupScreen();
    },
  );
}
