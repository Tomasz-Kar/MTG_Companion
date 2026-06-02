import 'package:flutter/material.dart';

const Color TRANSPARENT = Color(0x00000000);
const Color TEXT_COLOR = Color(0xFFBCBCBC);
const Color BG_COLOR = Color(0xFF151515);
const Color WIDGET_BG_COLOR = Color(0xFF333333);
const Color ACCENT_COLOR = Color(0xFF5357AC);
const BorderRadius BORDER_RADIUS = BorderRadius.all(Radius.circular(15));
const double SUBTITLE_FONT_SIZE = 20;
const double BODY_FONT_SIZE = 16;


class MainTheme
{
  static ButtonStyle notSelectedButton = ButtonStyle(foregroundColor: WidgetStatePropertyAll(TEXT_COLOR), backgroundColor: WidgetStatePropertyAll(WIDGET_BG_COLOR));
  static ButtonStyle selectedButton = ButtonStyle(foregroundColor: WidgetStatePropertyAll(TEXT_COLOR), backgroundColor: WidgetStatePropertyAll(ACCENT_COLOR));


  static ThemeData theme = ThemeData(
    scaffoldBackgroundColor: BG_COLOR,
    appBarTheme: const AppBarTheme(backgroundColor: TRANSPARENT, foregroundColor: TEXT_COLOR, scrolledUnderElevation: 0),
    searchBarTheme: const SearchBarThemeData(backgroundColor: WidgetStatePropertyAll(WIDGET_BG_COLOR)),
    iconButtonTheme: const IconButtonThemeData(style: ButtonStyle(foregroundColor: WidgetStatePropertyAll(TEXT_COLOR))),
    progressIndicatorTheme: const ProgressIndicatorThemeData(color: ACCENT_COLOR)
  );
}