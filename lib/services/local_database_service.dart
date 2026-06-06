import 'package:mtg_companion/models/mtg_card.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:mtg_companion/models/mtg_card_filters.dart';
import 'package:mtg_companion/models/mtg_set.dart';

class LocalDatabaseService {
  static Box get cards => Hive.box("cards");
  static Box get sets => Hive.box("sets");
  static Future<MtgCard> fetchCardById(int id) async {
    return MtgCard.fromMap(cards.get(id));
  }

  static bool addCard(MtgCard card) {
    if(!containsCard(card)) {
      cards.put(card.id, card.toMap());
      return true;
    }
    return false;
  }

  static bool containsCard(MtgCard card) {
    return cards.containsKey(card.id);
  }

  static Future<List<MtgCard>> fetchCards({
    int page = 1,
    required MtgCardFilters filters,
  }) async {
    int offset = (page - 1) * 100;
    int limit = 100;
    if (cards.values.isEmpty) {
      return [];
    }
    if (filters.empty()) {
      return cards.values.skip(offset).take(limit).map((card) {
        return MtgCard.fromMap(Map<String, dynamic>.from(card));
      }).toList();
    }
    var filtered = cards.values;
    if (filters.name.isNotEmpty) {
      filtered = filtered.where(
        (card) =>
            card["name"].toLowerCase().contains(filters.name.toLowerCase()),
      );
    }
    if (filters.type.isNotEmpty) {
      filtered = filtered.where((card) => card["type"] == filters.type);
    }
    if (filters.rarity.isNotEmpty) {
      filtered = filtered.where((card) => card["rarity"] == filters.rarity);
    }
    if (filters.set.isNotEmpty) {
      filtered = filtered.where((card) => card["setName"] == filters.set);
    }
    if (filtered.isEmpty) {
      return [];
    }
    return filtered.skip(offset).take(limit).map((card) {
      return MtgCard.fromMap(Map<String, dynamic>.from(card));
    }).toList();
  }
  static bool addSet(MtgSet set) {
    if(!containsSet(set)) {
      sets.put(set.id, set.name);
      return true;
    }
    return false;
  }
  static Future<List<MtgSet>> fetchSets() async
  {
    List<MtgSet> result = [];
    if(sets.isEmpty)
      {
        return result;
      }
    for(var setKey in sets.keys)
      {
        result.add(MtgSet(id: setKey, name: sets.get(setKey)));
      }
    return result;
  }
  static bool containsSet(MtgSet set) {
    return cards.containsKey(set.id);
  }
}
