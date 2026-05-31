import 'package:flutter/material.dart';
import 'widgets/screens/home_screen.dart';
import 'theme/main_theme.dart';
import 'widgets/screens/details_screen.dart'; //TESTING
import 'models/card.dart';            //TESTING

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    //return MaterialApp(theme: MainTheme.theme, home: HomeScreen());
    //TEST
    final TEST_CARD = MTGCard(id:1, name:"test", image_url:"http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=409741&type=card",mana_cost: "{3}{W}{W}",type: "Legendary Creature — Angel", rarity: "Mythic Rare", set: "Shadows over Innistrad Promos", pt: "4/4", text: "Flash\nFlying, vigilance\nWhen Archangel Avacyn enters the battlefield, creatures you control gain indestructible until end of turn.\nWhen a non-Angel creature you control dies, transform Archangel Avacyn at the beginning of the next upkeep.", legalities: "LEGALITIES TO DO", artist:  "James Ryman");
    return MaterialApp(theme: MainTheme.theme, home: DetailsScreen(card: TEST_CARD));
  }
}