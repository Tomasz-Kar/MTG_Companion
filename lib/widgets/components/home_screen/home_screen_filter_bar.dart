import 'package:flutter/material.dart';
import 'package:mtg_companion/widgets/components/select_menu.dart';

class HomeScreenFilterBar extends StatelessWidget {

  static const types = [
    "Artifact",
    "Battle",
    "Conspiracy",
    "Creature",
    "Dragon",
    "Elemental",
    "Enchantment",
    "Goblin",
    "Hero",
    "Instant",
    "Jaguar",
    "Kindred",
    "Knights",
    "Land",
    "Legend",
    "Phenomenon",
    "Plane",
    "Planeswalker",
    "Scheme",
    "Sorcery",
    "Stickers",
    "Summon",
    "Tribal",
    "Universewalker",
    "Vanguard",
    "Wolf",
  ];
  static const rarities = ["Common", "Uncommon", "Rare", "Mythic", "Bonus"];
  final List<String> sets;
  final void Function(String? value) onTypeSelected;
  final void Function(String? value) onRaritySelected;
  final void Function(String? value) onSetSelected;
  final VoidCallback onClear;
  final String selectedType;
  final String selectedRarity;
  final String selectedSet;

  const HomeScreenFilterBar({
    super.key,
    required this.sets,
    required this.onTypeSelected,
    required this.onRaritySelected,
    required this.onSetSelected,
    required this.onClear,
    this.selectedType = '',
    this.selectedRarity = '',
    this.selectedSet = '',
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 10,
      children: [
        Flexible(
          child: TextButton(
            onPressed: () async {
              final result = await SelectMenu.getDialog(context, types);
              onTypeSelected.call(result);
            },
            child: Text(
              selectedType.isEmpty ? "Type" : selectedType,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
        Flexible(
          child: TextButton(
            onPressed: () async {
              final result = await SelectMenu.getDialog(context, rarities);
              onRaritySelected.call(result);
            },
            child: Text(
              selectedRarity.isEmpty ? "Rarity" : selectedRarity,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
        Flexible(
          child: TextButton(
            onPressed: () async {
              final result = await SelectMenu.getDialog(context, sets);
              onSetSelected.call(result);
            },
            child: Text(
              selectedSet.isEmpty ? "Set" : selectedSet,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),

        IconButton(onPressed: () => onClear(), icon: Icon(Icons.delete_sharp)),
      ],
    );
  }
}
