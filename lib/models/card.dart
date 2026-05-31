class MTGCard {
  final int id;
  final String name;
  final String image_url;
  final String mana_cost;
  final String type;
  final String rarity;
  final String set;
  final String pt;
  final String text;
  final String legalities;
  final String artist;

  MTGCard({
    required this.id,
    required this.image_url,
    required this.name,
    required this.mana_cost,
    required this.type,
    required this.rarity,
    required this.set,
    required this.pt,
    required this.text,
    required this.legalities,
    required this.artist
});
}