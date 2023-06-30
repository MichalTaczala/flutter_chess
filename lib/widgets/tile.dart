import 'package:flutter/material.dart';
import 'package:flutter_chess/enums/figure_type_enum.dart';
import 'package:flutter_chess/models/figure.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';

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

  String getPathForFigure(Figure fig) {
    String basicPath = "assets/images/";
    basicPath += fig.isWhite ? "svg_white/" : "svg_black/";
    final type = fig.figureType;
    switch (type) {
      case FigureTypeEnum.bishop:
        return "${basicPath}chess-bishop-icon.svg";
      case FigureTypeEnum.king:
        return "${basicPath}chess-king-icon.svg";
      case FigureTypeEnum.queen:
        return "${basicPath}chess-queen-icon.svg";
      case FigureTypeEnum.rook:
        return "${basicPath}chess-rook-icon.svg";
      case FigureTypeEnum.pawn:
        return "${basicPath}chess-pawn-icon.svg";
      case FigureTypeEnum.knight:
        return "${basicPath}chess-knight-icon.svg";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: figure != null
            ? DecorationImage(
                image: Svg(
                  getPathForFigure(figure!),
                ),
              )
            : null,
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
    );
  }
}
