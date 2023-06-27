import 'package:flutter/material.dart';
import 'package:flutter_chess/models/figure.dart';

class Tile extends StatelessWidget {
  final bool isBlack;
  final int index;
  final Figure? figure;
  final bool? isFieldAvailableToMove;
  final bool isCurrentlyClicked;
  final bool isUnderAttack;
  const Tile({
    super.key,
    required this.isBlack,
    required this.index,
    this.figure,
    this.isFieldAvailableToMove,
    this.isCurrentlyClicked = false,
    this.isUnderAttack = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: isCurrentlyClicked
            ? Colors.amber
            : isUnderAttack
                ? Colors.red
                : isFieldAvailableToMove == true
                    ? Colors.green
                    : isBlack
                        ? const Color.fromARGB(255, 82, 82, 82)
                        : const Color.fromARGB(255, 227, 227, 227),
      ),
      // color: Colors.red),
      child: Text(
          figure != null ? figure!.figureType.toString() : index.toString()),
    );
  }
}
