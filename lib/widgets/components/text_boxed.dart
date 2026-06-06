import 'package:flutter/material.dart';
import 'package:mtg_companion/themes/main_theme.dart';

class TextBoxed extends StatelessWidget {
  static const EdgeInsets _PADDING = EdgeInsets.all(10);
  static const EdgeInsets _MARGIN = EdgeInsets.symmetric(vertical: 5);
  final String text;
  final BorderRadius borderRadius;

  const TextBoxed({
    super.key,
    required this.text,
    this.borderRadius = MainTheme.BORDER_RADIUS,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: _MARGIN,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: borderRadius,
      ),
      child: Padding(
        padding: _PADDING,
        child: Text(text, style: Theme.of(context).textTheme.bodyMedium),
      ),
    );
  }
}
