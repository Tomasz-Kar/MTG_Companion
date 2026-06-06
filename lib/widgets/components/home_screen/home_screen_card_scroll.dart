import 'package:flutter/material.dart';
import 'package:mtg_companion/models/mtg_card.dart';
import 'package:mtg_companion/widgets/components/home_screen/home_screen_card_preview.dart';

class HomeScreenCardScroll extends StatelessWidget {
  final List<MtgCard> cards;

  const HomeScreenCardScroll({super.key, required this.cards});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      scrollDirection: Axis.vertical,
      cacheExtent: 200,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        crossAxisSpacing: 8,
        mainAxisSpacing: 3,
        childAspectRatio: 0.714,
      ),
      itemCount: cards.length,
      itemBuilder: (context, index) {
        return HomeScreenCardPreview(card: cards[index]);
      },
    );
  }
}
