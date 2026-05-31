import 'package:flutter/material.dart';
import 'package:mtg_companion/models/card.dart';
import 'package:mtg_companion/widgets/components/text_boxed.dart';
import 'package:mtg_companion/theme/main_theme.dart';


const BorderRadius _BORDER_RADIUS = BorderRadius.all(Radius.circular(15));
const double _FONT_SIZE = 20;
const EdgeInsets _PADDING = EdgeInsets.all(10);
const EdgeInsets _MARGIN = EdgeInsets.symmetric(vertical: 5);

class DetailsScreen extends StatelessWidget {
  final MTGCard card;
  const DetailsScreen({super.key, required this.card});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("MTG Companion App"), centerTitle: true, leading: IconButton(onPressed: () => Navigator.pop(context), icon: Icon(Icons.arrow_back))),
      body: ListView(
          padding: _PADDING,
          children: [Image.network(card.image_url),
            TextBoxed(text: "Oracle text:\n\n${card.text}" , border_radius: _BORDER_RADIUS, font_size: _FONT_SIZE, padding: _PADDING, margin: _MARGIN, text_color: TEXT_COLOR, bg_color: WIDGET_BG_COLOR),
            TextBoxed(text: "Legalities:\n${card.legalities}" , border_radius: _BORDER_RADIUS, font_size: _FONT_SIZE, padding: _PADDING, margin: _MARGIN, text_color: TEXT_COLOR, bg_color: WIDGET_BG_COLOR),
            TextBoxed(text: "Rarity: ${card.rarity}" , border_radius: _BORDER_RADIUS, font_size: _FONT_SIZE, padding: _PADDING, margin: _MARGIN, text_color: TEXT_COLOR, bg_color: WIDGET_BG_COLOR),
            TextBoxed(text: "Set: ${card.set}" , border_radius: _BORDER_RADIUS, font_size: _FONT_SIZE, padding: _PADDING, margin: _MARGIN, text_color: TEXT_COLOR, bg_color: WIDGET_BG_COLOR),
            TextBoxed(text: "Artist: ${card.artist}" , border_radius: _BORDER_RADIUS, font_size: _FONT_SIZE, padding: _PADDING, margin: _MARGIN, text_color: TEXT_COLOR, bg_color: WIDGET_BG_COLOR),
          ]),
    );
  }
  }