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
    const primary = Color(0xff079669); // brand primary
    const onPrimary = Colors.white;

    const secondary = Color(0xffd8f8e9); // subtle highlight
    const onSecondary = Color(0xff004d34);

    const tertiary = Color(0xfff7b500); // accent (warning / attention grabber)
    const onTertiary = Colors.black;

    const error = Color(0xffd32f2f);
    const onError = Colors.white;

    const surface = Colors.white;
    const onSurface = Color(0xff1c1b1f);

    // Neutrals / Outlines (for borders, dividers, disabled states)
    const outline = Color(0xffd0d5dd); // light border gray
    const outlineVariant = Color(0xff9da4ae); // darker border / focus rings
    const shadow = Color(0x1F000000); // soft shadows

    // Inverse (for dark text on light background and vice versa)
    const inverseSurface = Color(0xff121212);
    const onInverseSurface = Colors.white;
    const inversePrimary = Color(0xff55c89d);

    const colorScheme = ColorScheme(
      brightness: Brightness.light,
      primary: primary,
      onPrimary: onPrimary,
      primaryContainer: Color(0xffb4e9d5),
      onPrimaryContainer: Color(0xff002116),

      secondary: secondary,
      onSecondary: onSecondary,
      secondaryContainer: Color(0xffb9eedd),
      onSecondaryContainer: Color(0xff00291b),

      tertiary: tertiary,
      onTertiary: onTertiary,
      tertiaryContainer: Color(0xffffe08a),
      onTertiaryContainer: Color(0xff281800),

      error: error,
      onError: onError,
      errorContainer: Color(0xffffdad6),
      onErrorContainer: Color(0xff410002),

      surface: surface,
      onSurface: onSurface,
      surfaceContainerHighest: Color(0xfff0f3f5), // cards, containers
      onSurfaceVariant: Color(0xff49454f),

      outline: outline,
      outlineVariant: outlineVariant,

      shadow: shadow,
      scrim: Color(0x33000000), // overlays / modal backgrounds

      inverseSurface: inverseSurface,
      onInverseSurface: onInverseSurface,
      inversePrimary: inversePrimary,
      surfaceTint: primary, // used in elevation overlays
    );

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
