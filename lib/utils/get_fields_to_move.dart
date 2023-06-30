import 'package:flutter_chess/bloc/chess_board_bloc.dart';

List<int> getPawnPossibleFieldsToMove(
    bool isWhite, int currentPosition, ChessBoardState state) {
  List<int> possibleFieldsWithoutBoardChessPieces = [];
  possibleFieldsWithoutBoardChessPieces =
      isWhite ? [currentPosition - 8] : [currentPosition + 8];

  final filteredPositions = possibleFieldsWithoutBoardChessPieces
      .where((element) =>
          !state.figuresOnBoard.map((e) => e.field).contains(element))
      .toList();

  if (filteredPositions.length == 1) {
    if (filteredPositions[0] <= 47 && filteredPositions[0] >= 40 && isWhite) {
      filteredPositions.add(filteredPositions[0] - 8);
    }
    if (filteredPositions[0] <= 23 && filteredPositions[0] >= 16 && !isWhite) {
      filteredPositions.add(filteredPositions[0] + 8);
    }
  }
  return filteredPositions;
}

List<int> getPawnPossibleFieldsToAttack(bool isWhite, int currentPosition) {
  final List<int> possibleMovesWithAttack = [];
  if (isWhite) {
    possibleMovesWithAttack.addAll([currentPosition - 7, currentPosition - 9]);
  } else {
    possibleMovesWithAttack.addAll([currentPosition + 7, currentPosition + 9]);
  }
  return possibleMovesWithAttack
      .where((element) => (element ~/ 8 - currentPosition ~/ 8).abs() == 1)
      .toList();
}

List<int> getKnightPossibleFields(bool isWhite, int currentPosition) {
  final List<int> possibleMoves = [];
  int rowDifference = 0;
  int collumnDifference = 0;
  for (var i = 0; i < 64; i++) {
    rowDifference = (i ~/ 8 - currentPosition ~/ 8).abs();
    collumnDifference = (i % 8 - currentPosition % 8).abs();

    if (rowDifference + collumnDifference == 3 &&
        (rowDifference == 2 || collumnDifference == 2) &&
        i != currentPosition) {
      possibleMoves.add(i);
    }
  }
  return possibleMoves;
}

Map<String, List<int>> getKingPossibleFields(
  bool isWhite,
  int currentPosition,
  ChessBoardState state,
) {
  final List<int> possibleMovesToMove = [];
  final List<int> possibleMovesToAttack = [];
  int rowDifference = 0;
  int collumnDifference = 0;
  for (var i = 0; i < 64; i++) {
    rowDifference = (i ~/ 8 - currentPosition ~/ 8).abs();
    collumnDifference = (i % 8 - currentPosition % 8).abs();

    if (rowDifference <= 1 && collumnDifference <= 1 && i != currentPosition) {
      if (state.figuresOnBoard.map((e) => e.field).contains(i)) {
        if (state.figuresOnBoard
                .where((element) => element.field == i)
                .first
                .isWhite ==
            !isWhite) {
          possibleMovesToAttack.add(i);
        }
      } else {
        possibleMovesToMove.add(i);
      }
    }
  }
  return {
    "fieldsToGo": possibleMovesToMove,
    "fieldsToAttack": possibleMovesToAttack,
  };
}

Map<String, List<int>> getAvailableTiles(
  int Function(int) goToNextItem,
  Function(int) stopRecursion,
  int currentPosition,
  bool isWhite,
  ChessBoardState state,
) {
  final actualCurrentPosition = goToNextItem(currentPosition);
  final Map<String, List<int>> fields = {
    "fieldsToGo": [],
    "fieldsToAttack": []
  };

  if (stopRecursion(actualCurrentPosition)) {
    return fields;
  }
  if (state.figuresOnBoard
      .where((element) => element.field == actualCurrentPosition)
      .isNotEmpty) {
    if (state.figuresOnBoard
            .firstWhere((element) => element.field == actualCurrentPosition)
            .isWhite !=
        isWhite) {
      fields["fieldsToAttack"]!.add(actualCurrentPosition);
    }
    return fields;
  }
  fields["fieldsToGo"]!.add(actualCurrentPosition);
  final recursiveResult = getAvailableTiles(
    goToNextItem,
    stopRecursion,
    actualCurrentPosition,
    isWhite,
    state,
  );
  fields["fieldsToGo"]!.addAll(recursiveResult["fieldsToGo"]!);
  fields["fieldsToAttack"]!.addAll(recursiveResult["fieldsToAttack"]!);
  return fields;
}

Map<String, List<int>> getAvailableTilesForKnight(
  int currentPosition,
  bool isWhite,
  ChessBoardState state,
) {
  final List<int> possiblePositions =
      getKnightPossibleFields(isWhite, currentPosition);
  final Map<String, List<int>> fields = {
    "fieldsToGo": [],
    "fieldsToAttack": []
  };
  final figsOnBoardSimplified =
      state.figuresOnBoard.map((e) => (e.field, e.isWhite)).toList();

  for (var possiblePosition in possiblePositions) {
    if (!figsOnBoardSimplified.map((e) => e.$1).contains(possiblePosition)) {
      fields["fieldsToGo"]!.add(possiblePosition);
    } else {
      final differentColorFigure = figsOnBoardSimplified
          .where((element) =>
              element.$1 == possiblePosition && element.$2 == !isWhite)
          .firstOrNull;
      if (differentColorFigure != null) {
        fields["fieldsToAttack"]!.add(differentColorFigure.$1);
      }
    }
  }
  return fields;
}
