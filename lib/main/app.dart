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
      debugShowFloatingThemeButton: true,
      initial: initialTheme,
      builder: (light, dark) =>
          _buildMultiBlocProvider(light, dark, language: language),
    );
  }

  ThemeData _buildDarkTheme() => ThemeData(
        useMaterial3: false,
        brightness: Brightness.dark,
        primarySwatch: Colors.blueGrey,
      );

  ThemeData _buildLightTheme() {
    ColorScheme colorScheme = ColorScheme(
        brightness: Brightness.light,
        primary: Colors.blue.shade600,
        onPrimary: Colors.white,
        secondary: Colors.pink,
        onSecondary: Colors.white,
        error: Colors.red,
        onError: Colors.white,
        surface: Colors.white,
        onSurface: Colors.black,
        outline: Colors.grey.shade300);

    return ThemeData(useMaterial3: true, colorScheme: colorScheme);
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
