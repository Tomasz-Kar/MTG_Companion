import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:mtg_companion/models/mtg_card.dart';
import 'package:http/http.dart' as http;
import 'package:mtg_companion/models/mtg_card_preview.dart';

class CardApiService {
  static const String baseUrl = "https://api.magicthegathering.io/v1";

  static Future<MTGCard> fetchCardById(int id) async
  {
    final response = await http.get(Uri.parse("$baseUrl/cards/$id"));
    //TODO ERROR HANDLING
    if (response.statusCode == 200)
      {
        final data = jsonDecode(response.body);
        String legalities = "";
        bool newlineFlag = false;
        for (final legality in data["card"]["legalities"])
        {
          if (newlineFlag) {
            legalities += "\n";
          }
          legalities += "${legality["format"]}: ${legality["legality"]}";
          newlineFlag = true;
        }
        return MTGCard(
          imageUrl: data["card"]["imageUrl"],
          rarity: data["card"]["rarity"],
          set: data["card"]["setName"],
          text: data["card"]["text"],
          legalities: legalities,
          artist: data["card"]["artist"],
        );
      }
    throw Exception("Błąd pobierania danych");
  }

  //static Future<MtgCardPreview> fetchPreviews(nameFilter, typeFilter, rarityFilter, setFilter) async
  static Future <List<MtgCardPreview>> fetchPreviews({int page = 1, var context}) async { //TODO MAKE THIS CLEANER, REMOVE VAR CONTEXT
    final response = await http.get(Uri.parse("$baseUrl/cards?page=$page"));
    if (response.statusCode == 200)
      {
        List<MtgCardPreview> previews = [];
        final data = jsonDecode(response.body);
        final List cards = data["cards"];
        for (final card in cards)
          {
            if(card['multiverseid'] != null && card['imageUrl'] != null) {
              previews.add(MtgCardPreview(id: int.parse(card['multiverseid']), imageUrl: card['imageUrl']));
            }
          }
        for (final preview in previews)
          {
            await precacheImage(NetworkImage(preview.imageUrl), context); //TODO MAKE THIS CLEANER
          }
        return previews;
      }

      throw Exception("Błąd pobierania danych");
  }
}