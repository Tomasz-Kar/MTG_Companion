import 'package:flutter/material.dart';
import 'widgets/screens/home_screen.dart';
import 'themes/main_theme.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  await Hive.openBox("cards");
  await Hive.openBox("sets");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(theme: MainTheme.theme, home: HomeScreen());
  }
}
