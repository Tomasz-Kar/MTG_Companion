import 'package:flutter/material.dart';

const Color TRANSPARENT = Color(0x00000000);
const Color TEXT_COLOR = Color(0xFF8D8D8D);
const Color BG_COLOR = Color(0xFF151515);
const Color WIDGET_BG_COLOR = Color(0xFF333333);
const Color SELECTED_WIDGET_BG_COLOR = Color(0xFF5357AC);

class MainTheme
{
  static ButtonStyle notSelectedButton = ButtonStyle(foregroundColor: WidgetStatePropertyAll(TEXT_COLOR), backgroundColor: WidgetStatePropertyAll(WIDGET_BG_COLOR));
  static ButtonStyle selectedButton = ButtonStyle(foregroundColor: WidgetStatePropertyAll(TEXT_COLOR), backgroundColor: WidgetStatePropertyAll(SELECTED_WIDGET_BG_COLOR));


  static ThemeData theme = ThemeData(
    scaffoldBackgroundColor: BG_COLOR,
    appBarTheme: const AppBarTheme(backgroundColor: TRANSPARENT, foregroundColor: TEXT_COLOR, scrolledUnderElevation: 0),
    searchBarTheme: const SearchBarThemeData(backgroundColor: WidgetStatePropertyAll(WIDGET_BG_COLOR)),
    iconButtonTheme: const IconButtonThemeData(style: ButtonStyle(foregroundColor: WidgetStatePropertyAll(TEXT_COLOR)))
  );
}