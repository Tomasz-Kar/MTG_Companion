import 'package:flutter/material.dart';
import 'widgets/screens/home_screen.dart';
import 'theme/main_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(theme: MainTheme.theme, home: HomeScreen());
  }
}
