import 'package:flutter/material.dart';

class TextBoxed extends StatelessWidget {
  final String text;
  final BorderRadius border_radius;
  final EdgeInsets padding;
  final EdgeInsets margin;
  final double font_size;
  final Color text_color;
  final Color bg_color;

  TextBoxed({
    required this.text,
    required this.border_radius,
    required this.padding,
    required this.margin,
    required this.font_size,
    required this.text_color,
    required this.bg_color
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
