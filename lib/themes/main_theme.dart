import 'package:flutter/material.dart';

class MainTheme {
  ///Styling throughout the app is a mess, I despise how Flutter handles themes
  static const Color TRANSPARENT = Color(0x00000000);
  static const Color ENABLED_COLOR = Color(0xFFBCBCBC);
  static const Color DISABLED_COLOR = Color(0xFF333333);
  static const Color BG_COLOR = Color(0xFF151515);
  static const Color WIDGET_BG_COLOR = Color(0xFF333333);
  static const Color ACCENT_COLOR = Color(0xFF5357AC);
  static const BorderRadius BORDER_RADIUS = BorderRadius.all(Radius.circular(15));
  static const double TITLE_FONT_SIZE = 20;
  static const double BODY_FONT_SIZE = 16;

  static ThemeData theme = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      brightness: Brightness.dark,
      seedColor: ACCENT_COLOR,
      surface: WIDGET_BG_COLOR,
    ),
    scaffoldBackgroundColor: BG_COLOR,
    appBarTheme: const AppBarTheme(
      backgroundColor: TRANSPARENT,
      foregroundColor: ENABLED_COLOR,
      scrolledUnderElevation: 0,
    ),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        foregroundColor: WidgetStatePropertyAll(ENABLED_COLOR),
        backgroundColor: WidgetStatePropertyAll(WIDGET_BG_COLOR),
      ),
    ),
    iconButtonTheme: IconButtonThemeData(
      style: ButtonStyle(
        iconColor: WidgetStateProperty.resolveWith<Color?>((states) {
          if (states.contains(WidgetState.disabled)) {
            return DISABLED_COLOR;
          }
          return ENABLED_COLOR;
        }),
      ),
    ),
    searchBarTheme: const SearchBarThemeData(
      backgroundColor: WidgetStatePropertyAll(WIDGET_BG_COLOR),
    ),
    textTheme: TextTheme(
      titleMedium: TextStyle(fontSize: TITLE_FONT_SIZE, color: ENABLED_COLOR),
      bodyMedium: TextStyle(fontSize: BODY_FONT_SIZE, color: ENABLED_COLOR),
    ),
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: ACCENT_COLOR,
    ),
  );
}
