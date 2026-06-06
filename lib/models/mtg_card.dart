class MtgCard {
  final int id;
  final String name;
  final String cost;
  final String power;
  final String toughness;
  final String type;
  final String imageUrl;
  final String rarity;
  final String set;
  final String text;
  final String legalities;
  final String artist;

  MtgCard({
    required this.id,
    required this.name,
    required this.cost,
    required this.power,
    required this.toughness,
    required this.type,
    required this.imageUrl,
    required this.rarity,
    required this.set,
    required this.text,
    required this.legalities,
    required this.artist,
  });

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "name": name,
      "manaCost": cost,
      "power": power,
      "toughness": toughness,
      "type": type,
      "imageUrl": imageUrl,
      "rarity": rarity,
      "setName": set,
      "text": text,
      "legalities": legalities,
      "artist": artist,
    };
  }

  factory MtgCard.fromMap(Map map) {
    return MtgCard(
      id: map['id'] ?? '',
      name: map["name"] ?? '',
      cost: map["manaCost"] ?? '',
      power: map["power"] ?? '',
      toughness: map["toughness"] ?? '',
      type: map["type"] ?? '',
      imageUrl: map["imageUrl"] ?? '',
      rarity: map["rarity"] ?? '',
      set: map["setName"] ?? '',
      text: map["text"] ?? '',
      legalities: map["legalities"] ?? '',
      artist: map["artist"] ?? '',
    );
  }

  factory MtgCard.fromJson(dynamic data) {
    String legalities = '';
    bool newlineFlag = false;
    if (data['legalities'] != null) {
      for (final legality in data["legalities"]) {
        if (newlineFlag) {
          legalities += "\n";
        }
        legalities += "${legality["format"]}: ${legality["legality"]}";
        newlineFlag = true;
      }
    }
    return MtgCard(
      id: int.parse(data['multiverseid']),
      name: data["name"] ?? '',
      cost: data["manaCost"] ?? '',
      power: data["power"] ?? '',
      toughness: (data["toughness"]) ?? '',
      type: data["type"] ?? '',
      imageUrl: data["imageUrl"],
      rarity: data["rarity"] ?? '',
      set: data["setName"] ?? '',
      text: data["text"] ?? '',
      legalities: legalities,
      artist: data["artist"] ?? '',
    );
  }
}
