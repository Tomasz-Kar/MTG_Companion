import 'package:flutter/material.dart';
import 'package:mtg_companion/services/card_api_service.dart';
import 'package:mtg_companion/widgets/components/error_popup.dart';
import 'package:mtg_companion/widgets/components/home_screen/home_screen_filter_bar.dart';
import 'package:mtg_companion/widgets/components/home_screen/home_screen_card_scroll.dart';
import 'package:mtg_companion/widgets/components/throbber.dart';
import 'package:mtg_companion/models/mtg_card_preview.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _nameFilter = "";
  String _typeFilter = "";
  String _rarityFilter = "";
  String _setFilter = "";
  //TODO fetch filters
  late Future<List<MtgCardPreview>> cardFuture;

  @override
  void initState()
  {
    super.initState();                              //TODO CHANGE FETCHING TIMING
    cardFuture = CardApiService.fetchPreviews(context: context);    //TODO REMOVE CONTEXT
  }

  /*<void> _load_card_preview() async
  {

  }*/
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<MtgCardPreview>>
      (future: cardFuture,
        builder: (context, snapshot)
        {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Scaffold(appBar: AppBar(title: Text("MTG Companion App"), centerTitle: true,), body:  Throbber());
          }
          if (snapshot.hasError) {
            return Scaffold(appBar: AppBar(title: Text("MTG Companion App"), centerTitle: true,), body: ErrorPopup(errorText: "${snapshot.error}",
                buttonText: "Ok",
                buttonAction: () => {Navigator.pop}));   //TODO CHANGE ACTION
          }
          if (!snapshot.hasData) {
            return Scaffold(appBar: AppBar(title: Text("MTG Companion App"), centerTitle: true,), body: ErrorPopup(errorText: "Nie znaleziono kart",
                buttonText: "Ok",
                buttonAction: () => {Navigator.pop})); //TODO CHANGE ACTION
          }
          List<MtgCardPreview> cardPreviews = snapshot.data ?? [];
        return Scaffold(appBar: AppBar(title: Text("MTG Companion App"), centerTitle: true,),
        body: Center(
          child:  Column(children: [SearchBar(),
          HomeScreenFilterBar(),
          HomeScreenCardScroll(cardPreviews: cardPreviews)
          ])));
  });
}
}