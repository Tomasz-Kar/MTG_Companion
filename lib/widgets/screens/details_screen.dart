import 'package:flutter/material.dart';
import 'package:mtg_companion/models/mtg_card.dart';
import 'package:mtg_companion/theme/main_theme.dart';
import 'package:mtg_companion/widgets/components/text_boxed.dart';
import 'package:mtg_companion/widgets/components/throbber.dart';
import 'package:mtg_companion/widgets/components/error_popup.dart';


const EdgeInsets _PADDING = EdgeInsets.all(10);
const EdgeInsets _MARGIN = EdgeInsets.symmetric(vertical: 5);

class DetailsScreen extends StatelessWidget {
  final Future<MTGCard> cardFuture;
  const DetailsScreen({super.key, required this.cardFuture});
  @override
  Widget build(BuildContext context) {
    return Scaffold(    //TODO Errors with appbar?    //TODO Refresh the page
      appBar: AppBar(title: Text("MTG Companion App"), centerTitle: true, leading: IconButton(onPressed: () => Navigator.pop(context), icon: Icon(Icons.arrow_back))),
      body: FutureBuilder<MTGCard>
        (
        future: cardFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Throbber();
          }
          if (snapshot.hasError) {
            return ErrorPopup(errorText: "${snapshot.error}",
                buttonText: "Ok",
                buttonAction: () => {Navigator.pop});
          }
          if (!snapshot.hasData) {
            return ErrorPopup(errorText: "Nie znaleziono karty",
                buttonText: "Ok",
                buttonAction: () => {Navigator.pop});
          }


          final card = snapshot.data!;
          return ListView(
              padding: _PADDING,
              children: [Image.network(card.imageUrl),
                TextBoxed(text: "Oracle text:\n\n${card.text}",
                    font_size: BODY_FONT_SIZE,
                    padding: _PADDING,
                    margin: _MARGIN),
                TextBoxed(text: "Legalities:\n${card.legalities}",
                    font_size: BODY_FONT_SIZE,
                    padding: _PADDING,
                    margin: _MARGIN),
                TextBoxed(text: "Rarity: ${card.rarity}",
                    font_size: BODY_FONT_SIZE,
                    padding: _PADDING,
                    margin: _MARGIN),
                TextBoxed(text: "Set: ${card.set}",
                    font_size: BODY_FONT_SIZE,
                    padding: _PADDING,
                    margin: _MARGIN),
                TextBoxed(text: "Artist: ${card.artist}",
                    font_size: BODY_FONT_SIZE,
                    padding: _PADDING,
                    margin: _MARGIN),
              ]);
        }));
  }
  }