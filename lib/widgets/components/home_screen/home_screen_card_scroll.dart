import 'package:flutter/material.dart';
import 'package:mtg_companion/models/mtg_card_preview.dart';
import 'package:mtg_companion/widgets/components/home_screen/home_screen_card_preview.dart';

class HomeScreenCardScroll extends StatelessWidget{
  final List<MtgCardPreview> cardPreviews;
  const HomeScreenCardScroll({
    super.key,
    required this.cardPreviews
});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: GridView.builder(
            scrollDirection: Axis.vertical,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
            shrinkWrap: true,
            itemCount: cardPreviews.length,
            itemBuilder: (context, index)
            {
              return HomeScreenCardPreview(cardPreview: cardPreviews[index]);
            }
        ));
  }
}