import 'package:flutter/material.dart';
import 'package:mtg_companion/theme/main_theme.dart';

class HomeScreenFilterBar extends StatelessWidget {
  const HomeScreenFilterBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(style: MainTheme.notSelectedButton, onPressed: null, child: Text("Type")),
        TextButton(style: MainTheme.notSelectedButton, onPressed: null, child: Text("Rarity")),
        TextButton(style: MainTheme.notSelectedButton,onPressed: null, child: Text("Set")),
        IconButton(onPressed: null, icon: Icon(Icons.delete_sharp))],
    );
  }
}
