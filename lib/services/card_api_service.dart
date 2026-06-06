import 'dart:convert';
import 'package:mtg_companion/models/mtg_card.dart';
import 'package:http/http.dart' as http;
import 'package:mtg_companion/models/mtg_card_filters.dart';
import 'package:mtg_companion/models/mtg_set.dart';

class CardApiService {
  static const String baseUrl = "https://api.magicthegathering.io/v1";

  static Future<MtgCard> fetchCardById(int id) async {
    final response = await http.get(Uri.parse("$baseUrl/cards/$id"));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return MtgCard.fromJson(data['card']);
    }
    throw Exception(
      "Error fetching data data from server. Status code: ${response
          .statusCode}",
    );
  }

  static Future<List<MtgCard>> fetchCards({
    int page = 1,
    required MtgCardFilters filters,
  }) async {
    List<MtgCard> result = [];
    try {
      var uri =
          "$baseUrl/cards?page=$page&contains=multiverseId&contains=imageUrl";
      if (filters.name != "") {
        uri += "&name=${filters.name}";
      }
      if (filters.rarity != "") {
        uri += "&rarity=${filters.rarity}";
      }
      if (filters.type != "") {
        uri += "&type=${filters.type}";
      }
      if (filters.set != "") {
        uri += "&setName=${filters.set}";
      }
      final response = await http.get(Uri.parse(uri));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final cards = data['cards'];
        for (final card in cards) {
          if (card['multiverseid'] != null && card['imageUrl'] != null) {
            result.add(MtgCard.fromJson(card));
          }
        }
      }
    } catch (e) {
      throw Exception("Error fetching data.");
    }
    return result;
  }

  static Future<List<MtgSet>> fetchSets() async {
    List<MtgSet> result = [];
    try {
      var uri = "$baseUrl/sets";
      final response = await http.get(Uri.parse(uri));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final sets = data['sets'];
        for (final set in sets) {
          if(set['code'] != null && set['name'] != null)
            {result.add(MtgSet(id: set['code'].hashCode, name: set['name']));}
          }
        }
      }
    catch (e) {
      throw Exception("Error fetching data.");
    }
    return result;
  }
}
