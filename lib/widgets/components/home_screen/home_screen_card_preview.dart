import 'package:flutter/material.dart';
import 'package:mtg_companion/models/mtg_card.dart';
import 'package:mtg_companion/services/card_fetching_service.dart';
import 'package:mtg_companion/themes/main_theme.dart';
import 'package:mtg_companion/widgets/screens/details_screen.dart';

class HomeScreenCardPreview extends StatelessWidget {
  final MtgCard card;

  const HomeScreenCardPreview({super.key, required this.card});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DetailsScreen(
            cardFuture: CardFetchingService.fetchCardById(card.id),
          ),
        ),
      ),
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: MainTheme.WIDGET_BG_COLOR,
            ),
            margin: EdgeInsetsGeometry.all(5),
            child: Center(child: Text(card.name, textAlign: TextAlign.center)),
          ),
          Center(
            child: Image.network(
              card.imageUrl,
              cacheWidth: 150,
              errorBuilder: (context, error, stackTrace) {
                return Container();
              },
            ),
          ),
        ],
      ),
    );
  }
}
