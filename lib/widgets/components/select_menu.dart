import 'package:flutter/material.dart';

class SelectMenu {
  static Future<String?> getDialog(BuildContext context, List<String> values) {
    return showDialog(
      context: context,
      builder: (context) {
        return SimpleDialog(
          children: values.map((value) {
            return SimpleDialogOption(
              onPressed: () {
                Navigator.pop(context, value);
              },
              child: Text(value),
            );
          }).toList(),
        );
      },
    );
  }
}
