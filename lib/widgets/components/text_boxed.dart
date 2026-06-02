import 'package:flutter/material.dart';
import 'package:mtg_companion/theme/main_theme.dart';

class TextBoxed extends StatelessWidget {
  final String text;
  final BorderRadius border_radius;
  final EdgeInsets padding;
  final EdgeInsets margin;
  final double font_size;
  final Color text_color;
  final Color bg_color;

  const TextBoxed({super.key,
    required this.text,
    this.border_radius = BORDER_RADIUS,
    this.padding = EdgeInsets.zero,
    this.margin = EdgeInsets.zero,
    required this.font_size,
    this.text_color = TEXT_COLOR,
    this.bg_color = WIDGET_BG_COLOR
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      decoration: BoxDecoration(
        color: bg_color,
        borderRadius: border_radius
      ),
      child: Padding(padding: padding, child: Text(text, style: TextStyle(fontSize: font_size, color: text_color)),
    ));
  }
}
