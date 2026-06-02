import 'package:flutter/material.dart';
import 'package:mtg_companion/theme/main_theme.dart';

const _MARGIN = EdgeInsetsGeometry.all(10);
const _PADDING = EdgeInsetsGeometry.all(10);
const _SPACING = 10.0;

class ErrorPopup extends StatelessWidget{
  final String errorText;
  final String buttonText;
  final VoidCallback buttonAction;

  const ErrorPopup({super.key,
    required this.errorText,
    required this.buttonText,
    required this.buttonAction

  });
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(margin: _MARGIN, padding: _PADDING, decoration: BoxDecoration(color: WIDGET_BG_COLOR, borderRadius: BORDER_RADIUS),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, mainAxisSize: MainAxisSize.min, spacing: _SPACING,
          children: [Text(errorText, style: TextStyle(fontSize: SUBTITLE_FONT_SIZE, color: TEXT_COLOR)),
            ElevatedButton(onPressed: buttonAction, style: ButtonStyle(backgroundColor: WidgetStatePropertyAll(ACCENT_COLOR)), child: Text(buttonText, style: TextStyle(fontSize: BODY_FONT_SIZE, color: TEXT_COLOR)))],
        )));
  }
}