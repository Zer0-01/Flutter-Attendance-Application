import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_attendance_application/l10n/app_localizations.dart';
import 'package:flutter_attendance_application/presentation/common_blocs/language_bloc/language_bloc.dart';
import 'package:flutter_attendance_application/routes/app_router.dart';
import 'package:flutter_attendance_application/routes/app_router_observer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatelessWidget {
  final String language;
  final AdaptiveThemeMode initialTheme;
  final _appRouter = AppRouter();

  App({super.key, required this.language, required this.initialTheme});

  @override
  Widget build(BuildContext context) {
    return buildHomeApp(language: language);
  }

  AdaptiveTheme buildHomeApp({required String language}) {
    return AdaptiveTheme(
      light: _buildLightTheme(),
      dark: _buildDarkTheme(),
      initial: AdaptiveThemeMode.light,
      builder: (light, dark) =>
          _buildMultiBlocProvider(light, dark, language: language),
    );
  }

  ThemeData _buildLightTheme() {
    final colorScheme = ColorScheme(
      brightness: Brightness.light,
      primary: Colors.indigo,
      onPrimary: Colors.white,
      secondary: Colors.teal,
      onSecondary: Colors.white,
      error: Colors.red,
      onError: Colors.white,
      surface: Colors.white,
      surfaceDim: Colors.grey.shade200,
      onSurface: Colors.black,
      onSurfaceVariant: Colors.grey.shade600,
      outline: Colors.grey.shade600,
    );

    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: colorScheme.surface,
      appBarTheme: AppBarTheme(
        backgroundColor: colorScheme.surface,
        foregroundColor: colorScheme.onSurface,
        elevation: 0,
      ),
    );
  }

  ThemeData _buildDarkTheme() {
    const colorScheme = ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xFF6B7BFF), // Soft indigo
      onPrimary: Colors.white,
      secondary: Color(0xFF4FD1C5), // Teal accent
      onSecondary: Colors.black,
      error: Color(0xFFEF5350),
      onError: Colors.black,
      surface: Color(0xFF121212), // Dark background
      onSurface: Color(0xFFEDEDED), // Light text
      outline: Color(0xFF2C2C2C), // Subtle border
    );

    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: colorScheme.surface,
      appBarTheme: AppBarTheme(
        backgroundColor: colorScheme.surface,
        foregroundColor: colorScheme.onSurface,
        elevation: 0,
      ),
    );
  }

  MultiBlocProvider _buildMultiBlocProvider(
    ThemeData light,
    ThemeData dark, {
    required String language,
  }) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LanguageBloc(language: language)),
      ],
      child: BlocBuilder<LanguageBloc, LanguageState>(
        builder: (context, state) {
          return MaterialApp.router(
            routerConfig: _appRouter.config(
              navigatorObservers: () => [AppRouterObserver()],
            ),
            theme: light,
            darkTheme: dark,
            debugShowCheckedModeBanner: false,
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            locale: Locale(state.language),
          );
        },
      ),
    );
  }
}
