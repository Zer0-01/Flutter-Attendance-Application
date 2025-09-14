import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_attendance_application/configuration/app_environment.dart';
import 'package:flutter_attendance_application/configuration/app_local_storage.dart';
import 'package:flutter_attendance_application/configuration/app_logger.dart';
import 'package:flutter_attendance_application/main/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  AppLogger.configure(isProduction: false);
  final logger = AppLogger.getLogger("main_dev.dart");
  ProfileConstants.setEnvironment(Environment.dev);
  logger.info("Environment set to ${Environment.dev.name}");
  final String language =
      await AppLocalStorage().read(StorageKeys.language.name) ?? "en";
  const initialTheme = AdaptiveThemeMode.light;
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((
    _,
  ) {
    runApp(App(language: language, initialTheme: initialTheme));
  });
}
