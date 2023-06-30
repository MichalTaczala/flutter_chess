import 'package:bloc/bloc.dart';
import 'package:flutter_chess/enums/figure_type_enum.dart';
import 'package:flutter_chess/enums/state_enum.dart';
import 'package:flutter_chess/models/figure.dart';
import 'package:flutter_chess/utils/merge_collections.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'chess_board_bloc.freezed.dart';
part 'chess_board_event.dart';
part 'chess_board_state.dart';

class ChessBoardBloc extends Bloc<ChessBoardEvent, ChessBoardState> {
  ChessBoardBloc() : super(const ChessBoardState()) {
    on<_Initialize>((event, emit) {
      final List<Figure> allFigures = [];
      //kings
      allFigures.add(
        const Figure(
          isWhite: true,
          figureType: FigureTypeEnum.king,
          field: 60,
        ),
      );
      allFigures.add(
        const Figure(
          isWhite: false,
          figureType: FigureTypeEnum.king,
          field: 4,
        ),
      );
      //queens
      allFigures.add(
        const Figure(
          isWhite: true,
          figureType: FigureTypeEnum.queen,
          field: 59,
        ),
      );
      allFigures.add(
        const Figure(
          isWhite: false,
          figureType: FigureTypeEnum.queen,
          field: 3,
        ),
      );
      //rocks
      allFigures.add(
        const Figure(
          isWhite: true,
          figureType: FigureTypeEnum.rook,
          field: 56,
        ),
      );
      allFigures.add(
        const Figure(
          isWhite: true,
          figureType: FigureTypeEnum.rook,
          field: 63,
        ),
      );
      allFigures.add(
        const Figure(
          isWhite: false,
          figureType: FigureTypeEnum.rook,
          field: 0,
        ),
      );
      allFigures.add(
        const Figure(
          isWhite: false,
          figureType: FigureTypeEnum.bishop,
          field: 2,
        ),
      );
      //bishops
      allFigures.add(
        const Figure(
          isWhite: true,
          figureType: FigureTypeEnum.bishop,
          field: 58,
        ),
      );
      allFigures.add(
        const Figure(
          isWhite: true,
          figureType: FigureTypeEnum.bishop,
          field: 61,
        ),
      );
      allFigures.add(
        const Figure(
          isWhite: false,
          figureType: FigureTypeEnum.bishop,
          field: 5,
        ),
      );
      allFigures.add(
        const Figure(
          isWhite: false,
          figureType: FigureTypeEnum.rook,
          field: 7,
        ),
      );
      //knights
      allFigures.add(
        const Figure(
          isWhite: true,
          figureType: FigureTypeEnum.knight,
          field: 57,
        ),
      );
      allFigures.add(
        const Figure(
          isWhite: true,
          figureType: FigureTypeEnum.knight,
          field: 62,
        ),
      );
      allFigures.add(
        const Figure(
          isWhite: false,
          figureType: FigureTypeEnum.knight,
          field: 1,
        ),
      );
      allFigures.add(
        const Figure(
          isWhite: false,
          figureType: FigureTypeEnum.knight,
          field: 6,
        ),
      );
      //pawns
      for (int i = 0; i < 8; i++) {
        allFigures.add(
          Figure(
            isWhite: false,
            figureType: FigureTypeEnum.pawn,
            field: 8 + i,
          ),
        );
      }
      for (int i = 0; i < 8; i++) {
        allFigures.add(
          Figure(
            isWhite: true,
            figureType: FigureTypeEnum.pawn,
            field: 48 + i,
          ),
        );
      }
      emit(
        state.copyWith(
          figuresOnBoard: allFigures,
        ),
      );
    });
    on<_GetAvailableFieldsToMove>((event, emit) {
      List<int> availableFieldsToMove = [];
      List<int> availableFieldsToAttack = [];
      List<int> availableFieldsToAttackWithFigures = [];
      if (event.figure == null) return;
      final Figure figure = event.figure!;
      switch (figure.figureType) {
        case FigureTypeEnum.pawn:
          availableFieldsToMove.addAll(
              getPawnPossibleFieldsToMove(figure.isWhite, figure.field));
          availableFieldsToAttack.addAll(
              getPawnPossibleFieldsToAttack(figure.isWhite, figure.field));

          break;
        case FigureTypeEnum.rook:
          final Map<String, List<int>> map = mergeStringListMaps<int>([
            getAvailableTiles((newPosition) => newPosition + 8, (x) => x >= 64,
                figure.field, figure.isWhite),
            getAvailableTiles((newPosition) => newPosition - 8, (x) => x < 0,
                figure.field, figure.isWhite),
            getAvailableTiles(
                (newPosition) => newPosition + 1,
                (x) => x ~/ 8 != figure.field ~/ 8,
                figure.field,
                figure.isWhite),
            getAvailableTiles(
                (newPosition) => newPosition - 1,
                (x) => x ~/ 8 != figure.field ~/ 8,
                figure.field,
                figure.isWhite),
          ], [
            "fieldsToGo",
            "fieldsToAttack",
          ]);
          availableFieldsToMove = map["fieldsToGo"]!;
          availableFieldsToAttack = map["fieldsToAttack"]!;
          break;
        case FigureTypeEnum.bishop:
          final Map<String, List<int>> map = mergeStringListMaps<int>([
            getAvailableTiles((newPosition) => newPosition + 9, (int x) {
              int rowDifference = 0;
              int collumnDifference = 0;
              rowDifference = (x ~/ 8 - figure.field ~/ 8).abs();
              collumnDifference = (x % 8 - figure.field % 8).abs();
              if (rowDifference != collumnDifference) return true;
              return false;
            }, figure.field, figure.isWhite),
            getAvailableTiles((newPosition) => newPosition - 7, (int x) {
              int rowDifference = 0;
              int collumnDifference = 0;
              rowDifference = (x ~/ 8 - figure.field ~/ 8).abs();
              collumnDifference = (x % 8 - figure.field % 8).abs();
              if (rowDifference != collumnDifference) return true;
              return false;
            }, figure.field, figure.isWhite),
            getAvailableTiles((newPosition) => newPosition + 7, (int x) {
              int rowDifference = 0;
              int collumnDifference = 0;
              rowDifference = (x ~/ 8 - figure.field ~/ 8).abs();
              collumnDifference = (x % 8 - figure.field % 8).abs();
              if (rowDifference != collumnDifference) return true;
              return false;
            }, figure.field, figure.isWhite),
            getAvailableTiles((newPosition) => newPosition - 9, (int x) {
              int rowDifference = 0;
              int collumnDifference = 0;
              rowDifference = (x ~/ 8 - figure.field ~/ 8).abs();
              collumnDifference = (x % 8 - figure.field % 8).abs();
              if (rowDifference != collumnDifference) return true;
              return false;
            }, figure.field, figure.isWhite),
          ], [
            "fieldsToGo",
            "fieldsToAttack",
          ]);
          availableFieldsToMove = map["fieldsToGo"]!;
          availableFieldsToAttack = map["fieldsToAttack"]!;
          break;
        case FigureTypeEnum.knight:
          final Map<String, List<int>> map =
              getAvailableTilesForKnight(figure.field, figure.isWhite);
          availableFieldsToMove = map["fieldsToGo"]!;
          availableFieldsToAttack = map["fieldsToAttack"]!;
          break;
        case FigureTypeEnum.queen:
          final Map<String, List<int>> mapWithBishopFields =
              mergeStringListMaps<int>([
            getAvailableTiles((newPosition) => newPosition + 9, (int x) {
              int rowDifference = 0;
              int collumnDifference = 0;
              rowDifference = (x ~/ 8 - figure.field ~/ 8).abs();
              collumnDifference = (x % 8 - figure.field % 8).abs();
              if (rowDifference != collumnDifference) return true;
              return false;
            }, figure.field, figure.isWhite),
            getAvailableTiles((newPosition) => newPosition - 7, (int x) {
              int rowDifference = 0;
              int collumnDifference = 0;
              rowDifference = (x ~/ 8 - figure.field ~/ 8).abs();
              collumnDifference = (x % 8 - figure.field % 8).abs();
              if (rowDifference != collumnDifference) return true;
              return false;
            }, figure.field, figure.isWhite),
            getAvailableTiles((newPosition) => newPosition + 7, (int x) {
              int rowDifference = 0;
              int collumnDifference = 0;
              rowDifference = (x ~/ 8 - figure.field ~/ 8).abs();
              collumnDifference = (x % 8 - figure.field % 8).abs();
              if (rowDifference != collumnDifference) return true;
              return false;
            }, figure.field, figure.isWhite),
            getAvailableTiles((newPosition) => newPosition - 9, (int x) {
              int rowDifference = 0;
              int collumnDifference = 0;
              rowDifference = (x ~/ 8 - figure.field ~/ 8).abs();
              collumnDifference = (x % 8 - figure.field % 8).abs();
              if (rowDifference != collumnDifference) return true;
              return false;
            }, figure.field, figure.isWhite),
          ], [
            "fieldsToGo",
            "fieldsToAttack",
          ]);
          final Map<String, List<int>> mapWithRookFields =
              mergeStringListMaps<int>([
            getAvailableTiles((newPosition) => newPosition + 8, (x) => x >= 64,
                figure.field, figure.isWhite),
            getAvailableTiles((newPosition) => newPosition - 8, (x) => x < 0,
                figure.field, figure.isWhite),
            getAvailableTiles(
                (newPosition) => newPosition + 1,
                (x) => x ~/ 8 != figure.field ~/ 8,
                figure.field,
                figure.isWhite),
            getAvailableTiles(
                (newPosition) => newPosition - 1,
                (x) => x ~/ 8 != figure.field ~/ 8,
                figure.field,
                figure.isWhite),
          ], [
            "fieldsToGo",
            "fieldsToAttack",
          ]);
          availableFieldsToMove = mapWithBishopFields["fieldsToGo"]!;
          availableFieldsToAttack = mapWithBishopFields["fieldsToAttack"]!;
          availableFieldsToMove.addAll(mapWithRookFields["fieldsToGo"]!);
          availableFieldsToAttack.addAll(mapWithRookFields["fieldsToAttack"]!);
          break;
        case FigureTypeEnum.king:
          final map = getKingPossibleFields(figure.isWhite, figure.field);
          availableFieldsToMove = map["fieldsToGo"]!;
          availableFieldsToAttack = map["fieldsToAttack"]!;
          break;
      }
      if (availableFieldsToAttack.isEmpty) {
        availableFieldsToAttack = availableFieldsToMove;
      }
      final figuresWithOpositeColor = state.figuresOnBoard
          .where((element) => element.isWhite != figure.isWhite)
          .toList();
      final fieldsWithFiguresWithOpositeColor =
          figuresWithOpositeColor.map((e) => e.field).toList();
      availableFieldsToAttackWithFigures = availableFieldsToAttack
          .where(
              (element) => fieldsWithFiguresWithOpositeColor.contains(element))
          .toList();

      final availableFieldsToMoveWithoutFiguresToAttack = availableFieldsToMove
          .where(
              (element) => !fieldsWithFiguresWithOpositeColor.contains(element))
          .toList();
      emit(
        state.copyWith(
          availableFieldsToMove: availableFieldsToMoveWithoutFiguresToAttack
              .where((element) => element >= 0 || element <= 63)
              .toList(),
          fieldsWithFiguresAvailableToTake: availableFieldsToAttackWithFigures,
          currentlyClickedFigure: figure,
          gameState: StateEnum.possibleMovesShowed,
        ),
      );
    });
    on<_MoveFigure>((event, emit) {
      final Figure fig = event.figure;
      final int newPosition = event.newPosition;
      Figure? figureTaken;
      final takenFigures = [...state.figuresTaken];

      final figuresWithoutCurrentFig = [...state.figuresOnBoard]..remove(fig);
      if (state.figuresOnBoard
          .where((element) => element.isWhite != fig.isWhite)
          .map((e) => e.field)
          .contains(newPosition)) {
        figureTaken = state.figuresOnBoard
            .where((element) =>
                element.isWhite != fig.isWhite && element.field == newPosition)
            .first;
        figuresWithoutCurrentFig.remove(figureTaken);

        takenFigures.add(figureTaken);
      }
      final updatedFiguresPositions = figuresWithoutCurrentFig
        ..add(fig.copyWith(field: newPosition));
      emit(
        state.copyWith(
          figuresOnBoard: updatedFiguresPositions,
          gameState: StateEnum.nothingClicked,
          availableFieldsToMove: [],
          currentlyClickedFigure: null,
          fieldsWithFiguresAvailableToTake: [],
          figuresTaken: takenFigures,
          isWhitePlayerTurn: !state.isWhitePlayerTurn,
        ),
      );
    });
    on<_UncheckFigure>((event, emit) {
      emit(
        state.copyWith(
          gameState: StateEnum.nothingClicked,
          availableFieldsToMove: [],
          fieldsWithFiguresAvailableToTake: [],
          currentlyClickedFigure: null,
        ),
      );
    });
  }

  List<int> getRookPossibleFields(bool isWhite, int currentPosition) {
    final List<int> possibleMoves = [];
    for (var i = 0; i < 64; i++) {
      if (i % 8 == currentPosition % 8 &&
          i != currentPosition &&
          state.figuresOnBoard
              .where(
                  (element) => element.field == i && element.isWhite == isWhite)
              .isEmpty) {
        possibleMoves.add(i);
      }
      if (i ~/ 8 == currentPosition ~/ 8 &&
          i != currentPosition &&
          state.figuresOnBoard
              .where(
                  (element) => element.field == i && element.isWhite == isWhite)
              .isEmpty) {
        possibleMoves.add(i);
      }
    }
    return possibleMoves;
  }

  List<int> getPawnPossibleFieldsToMove(bool isWhite, int currentPosition) {
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
      if (filteredPositions[0] <= 23 &&
          filteredPositions[0] >= 16 &&
          !isWhite) {
        filteredPositions.add(filteredPositions[0] + 8);
      }
    }
    return filteredPositions;
  }

  List<int> getPawnPossibleFieldsToAttack(bool isWhite, int currentPosition) {
    final List<int> possibleMovesWithAttack = [];
    if (isWhite) {
      possibleMovesWithAttack
          .addAll([currentPosition - 7, currentPosition - 9]);
    } else {
      possibleMovesWithAttack
          .addAll([currentPosition + 7, currentPosition + 9]);
    }
    return possibleMovesWithAttack
        .where((element) => (element ~/ 8 - currentPosition ~/ 8).abs() == 1)
        .toList();
  }

  List<int> getBishopPossibleFields(bool isWhite, int currentPosition) {
    final List<int> possibleMoves = [];
    int rowDifference = 0;
    int collumnDifference = 0;
    for (var i = 0; i < 64; i++) {
      rowDifference = (i ~/ 8 - currentPosition ~/ 8).abs();
      collumnDifference = (i % 8 - currentPosition % 8).abs();

      if (rowDifference == collumnDifference && i != currentPosition) {
        possibleMoves.add(i);
      }
    }
    return possibleMoves;
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

  // List<int> getQueenPossibleFields(bool isWhite, int currentPosition) {
  //   return [
  //     ...getBishopPossibleFields(isWhite, currentPosition),
  //     ...getRookPossibleFields(isWhite, currentPosition)
  //   ];
  // }

  Map<String, List<int>> getKingPossibleFields(
      bool isWhite, int currentPosition) {
    final List<int> possibleMovesToMove = [];
    final List<int> possibleMovesToAttack = [];
    int rowDifference = 0;
    int collumnDifference = 0;
    for (var i = 0; i < 64; i++) {
      rowDifference = (i ~/ 8 - currentPosition ~/ 8).abs();
      collumnDifference = (i % 8 - currentPosition % 8).abs();

      if (rowDifference <= 1 &&
          collumnDifference <= 1 &&
          i != currentPosition) {
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

  Map<String, List<int>> getAvailableTiles(int Function(int) goToNextItem,
      Function(int) stopRecursion, int currentPosition, bool isWhite) {
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
        goToNextItem, stopRecursion, actualCurrentPosition, isWhite);
    fields["fieldsToGo"]!.addAll(recursiveResult["fieldsToGo"]!);
    fields["fieldsToAttack"]!.addAll(recursiveResult["fieldsToAttack"]!);
    return fields;
  }

  Map<String, List<int>> getAvailableTilesForKnight(
      int currentPosition, bool isWhite) {
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
}
