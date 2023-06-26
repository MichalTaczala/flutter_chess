import 'package:flutter/material.dart';
import 'package:flutter_chess/tile.dart';

class ChessPage extends StatefulWidget {
  const ChessPage({super.key});

  @override
  State<ChessPage> createState() => _ChessPageState();
}

List<int> handlePawnClick(int tileNumber, bool isWhite) {
  List<int> potentialMoves = [];
  if (isWhite) {
    potentialMoves.add(tileNumber - 8);
    potentialMoves.add(tileNumber - 16);
  } else {
    potentialMoves.add(tileNumber + 8);
    potentialMoves.add(tileNumber + 16);
  }
  return potentialMoves
      .where(
        (element) => element >= 0 || element <= 63,
      )
      .toList();
}

class _ChessPageState extends State<ChessPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(32),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 8, childAspectRatio: 1),
          itemCount: 64,
          itemBuilder: (context, index) => InkWell(
            onTap: null,
            child: Tile(
              isBlack: (index + index ~/ 8) % 2 == 0,
              index: index,
            ),
          ),
          physics: const NeverScrollableScrollPhysics(),
        ),
      ),
    );
  }
}
