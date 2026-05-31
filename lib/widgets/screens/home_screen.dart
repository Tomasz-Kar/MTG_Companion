import 'package:flutter/material.dart';
import '../components/filter_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("MTG Companion App"), centerTitle: true,),
        body: Center(
          child:  Column(children: [SearchBar(),
          FilterBar(),
          //Expanded(child: ListView.builder(itemBuilder:,)
          ])
    ));
  }
}