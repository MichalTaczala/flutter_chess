import 'package:flutter/material.dart';

class Tile extends StatelessWidget {
  final bool isBlack;
  final int index;
  const Tile({super.key, required this.isBlack, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: isBlack
          ? const Color.fromARGB(255, 82, 82, 82)
          : const Color.fromARGB(255, 227, 227, 227),
      child: Text(index.toString()),
    );
  }
}
