import 'package:flutter/material.dart';

class HomeScreenPageControl extends StatelessWidget {
  final int currentPage;
  final VoidCallback? onPressedBack;
  final VoidCallback? onPressedForward;

  const HomeScreenPageControl({
    super.key,
    required this.currentPage,
    required this.onPressedBack,
    required this.onPressedForward,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(onPressed: onPressedBack, icon: Icon(Icons.arrow_back)),
          Text("Page $currentPage"),
          IconButton(
            onPressed: onPressedForward,
            icon: Icon(Icons.arrow_forward),
          ),
        ],
      ),
    );
  }
}
