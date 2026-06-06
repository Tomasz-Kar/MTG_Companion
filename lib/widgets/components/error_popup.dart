import 'package:flutter/material.dart';
import 'package:mtg_companion/themes/main_theme.dart';

const _MARGIN = EdgeInsetsGeometry.all(10);
const _PADDING = EdgeInsetsGeometry.all(10);
const _SPACING = 10.0;

class ErrorPopup extends StatelessWidget {
  final String errorText;
  final String buttonText;
  final VoidCallback buttonAction;

  const ErrorPopup({
    super.key,
    required this.errorText,
    required this.buttonText,
    required this.buttonAction,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: _MARGIN,
        padding: _PADDING,
        decoration: BoxDecoration(
          color: MainTheme.WIDGET_BG_COLOR,
          borderRadius: MainTheme.BORDER_RADIUS,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          spacing: _SPACING,
          children: [
            Flexible(
              child: SingleChildScrollView(
                child: Text(
                  errorText,
                  style: TextStyle(
                    fontSize: MainTheme.TITLE_FONT_SIZE,
                    color: MainTheme.ENABLED_COLOR,
                  ),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: buttonAction,
              style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(MainTheme.ACCENT_COLOR),
              ),
              child: Text(
                buttonText,
                style: TextStyle(
                  fontSize: MainTheme.BODY_FONT_SIZE,
                  color: MainTheme.ENABLED_COLOR,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
