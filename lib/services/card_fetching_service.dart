import 'package:mtg_companion/models/mtg_card.dart';
import 'package:mtg_companion/models/mtg_card_filters.dart';
import 'package:mtg_companion/models/mtg_set.dart';
import 'package:mtg_companion/services/card_api_service.dart';
import 'package:mtg_companion/services/local_database_service.dart';

class CardFetchingService {
  static bool connected = true;
  static bool fetchedSets = false;

  static Future<List<MtgCard>> fetchCards({
    int page = 1,
    required MtgCardFilters filters,
  }) async {
    if (connected) {
      try {
        List<MtgCard> cards = await CardApiService.fetchCards(
          page: page,
          filters: filters,
        );
        for (MtgCard card in cards) {
            LocalDatabaseService.addCard(card);
        }
        return cards;
      } catch (e) {
        connected = false;
      }
    }
    return LocalDatabaseService.fetchCards(page: page, filters: filters);
  }
  static Future<List<MtgSet>> fetchSets() async
  {
    if(fetchedSets || !connected)
      {return LocalDatabaseService.fetchSets();}
    try {
      List<MtgSet> sets = await CardApiService.fetchSets();
      for (MtgSet set in sets)
        {LocalDatabaseService.addSet(set);}
      fetchedSets = true;
      return sets;
    }
    catch(e)
    {
      connected = false;
    }
    return LocalDatabaseService.fetchSets();
  }
  static Future<MtgCard> fetchCardById(int id) {
    return LocalDatabaseService.fetchCardById(id);
  }
}
