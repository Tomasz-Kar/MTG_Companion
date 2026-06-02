class MTGCard {
  final String imageUrl;
  final String rarity;
  final String set;
  final String text;
  final String legalities;
  final String artist;

  MTGCard({
    required this.imageUrl,
    required this.rarity,
    required this.set,
    required this.text,
    required this.legalities,
    required this.artist
});
}