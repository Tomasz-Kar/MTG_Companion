import 'package:flutter/material.dart';
import 'package:mtg_companion/models/mtg_card.dart';
import 'package:mtg_companion/widgets/components/text_boxed.dart';
import 'package:mtg_companion/widgets/components/throbber.dart';
import 'package:mtg_companion/widgets/components/error_popup.dart';

class DetailsScreen extends StatelessWidget {
  final Future<MtgCard> cardFuture;
  static const EdgeInsets _PADDING = EdgeInsets.all(10);

  const DetailsScreen({super.key, required this.cardFuture});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MTG Companion App"),
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: FutureBuilder<MtgCard>(
        future: cardFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Throbber();
          }
          if (snapshot.hasError) {
            return ErrorPopup(
              errorText: "${snapshot.error}",
              buttonText: "Ok",
              buttonAction: () => Navigator.pop(context),
            );
          }
          if (!snapshot.hasData) {
            return ErrorPopup(
              errorText: "Card not found",
              buttonText: "Ok",
              buttonAction: () => Navigator.pop(context),
            );
          }
          final card = snapshot.data!;
          return ListView(
            padding: _PADDING,
            children: [
              Image.network(
                card.imageUrl,
                errorBuilder: (context, error, stackTrace) {
                  return Container();
                },
              ),
              if (card.name != '') TextBoxed(text: "Name: ${card.name}"),
              if (card.cost != '') TextBoxed(text: "Mana cost: ${card.cost}"),
              if (card.power != '') TextBoxed(text: "Power: ${card.power}"),
              if (card.toughness != '')
                TextBoxed(text: "Toughness: ${card.toughness}"),
              if (card.type != '') TextBoxed(text: "Type: ${card.type}"),
              if (card.rarity != '') TextBoxed(text: "Rarity: ${card.rarity}"),
              if (card.set != '') TextBoxed(text: "Set: ${card.set}"),
              if (card.text != '')
                TextBoxed(text: "Oracle text:\n${card.text}"),
              if (card.legalities != '')
                TextBoxed(text: "Legalities:\n${card.legalities}"),
              if (card.artist != '') TextBoxed(text: "Artist: ${card.artist}"),
            ],
          );
        },
      ),
    );
  }
}
