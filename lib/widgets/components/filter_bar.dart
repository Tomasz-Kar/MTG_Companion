import 'package:flutter/material.dart';
import 'package:mtg_companion/theme/main_theme.dart';

class FilterBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(style: MainTheme.selectedButton, onPressed: null, child: Text("To Implement")),
        TextButton(style: MainTheme.notSelectedButton, onPressed: null, child: Text("To Implement")),
        TextButton(style: MainTheme.notSelectedButton,onPressed: null, child: Text("To Implement")),
        IconButton(onPressed: null, icon: Icon(Icons.delete_sharp))],
    );
  }
}
