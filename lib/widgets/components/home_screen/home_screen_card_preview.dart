import 'package:flutter/material.dart';
import 'package:mtg_companion/models/mtg_card_preview.dart';
import 'package:mtg_companion/services/card_api_service.dart';
import 'package:mtg_companion/widgets/screens/details_screen.dart';

class HomeScreenCardPreview extends StatelessWidget{
  final MtgCardPreview cardPreview;
  const HomeScreenCardPreview({
    super.key,
    required this.cardPreview
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(onTap: () =>
        Navigator.push(context, MaterialPageRoute(
            builder: (context) => DetailsScreen(cardFuture: CardApiService.fetchCardById(cardPreview.id)))),
        child: Image.network(cardPreview.imageUrl, cacheWidth: 200,));
  }

}