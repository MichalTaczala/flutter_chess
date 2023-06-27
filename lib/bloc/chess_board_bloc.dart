import 'package:bloc/bloc.dart';
import 'package:flutter_chess/enums/figure_type_enum.dart';
import 'package:flutter_chess/enums/state_enum.dart';
import 'package:flutter_chess/models/figure.dart';
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
      final figure = event.figure!;
      switch (figure.figureType) {
        case FigureTypeEnum.pawn:
          availableFieldsToMove.addAll(
              getPawnPossibleFieldsToMove(figure.isWhite, figure.field));
          availableFieldsToAttack.addAll(
              getPawnPossibleFieldsToAttack(figure.isWhite, figure.field));

          break;
        case FigureTypeEnum.rook:
          availableFieldsToMove.addAll(getRookPossibleFields(
            figure.isWhite,
            figure.field,
          ));
          break;
        case FigureTypeEnum.bishop:
          availableFieldsToMove
              .addAll(getBishopPossibleFields(figure.isWhite, figure.field));
          break;
        case FigureTypeEnum.knight:
          availableFieldsToMove
              .addAll(getKnightPossibleFields(figure.isWhite, figure.field));
          break;
        case FigureTypeEnum.queen:
          availableFieldsToMove
              .addAll(getQueenPossibleFields(figure.isWhite, figure.field));
          break;
        case FigureTypeEnum.king:
          availableFieldsToMove
              .addAll(getKingPossibleFields(figure.isWhite, figure.field));
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

      final figuresWithoutCurrentFig = [...state.figuresOnBoard]..remove(fig);
      final updatedFiguresPositions = figuresWithoutCurrentFig
        ..add(fig.copyWith(field: newPosition));
      emit(
        state.copyWith(
          figuresOnBoard: updatedFiguresPositions,
          gameState: StateEnum.nothingClicked,
          availableFieldsToMove: [],
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
    if (currentPosition <= 55 && currentPosition >= 48 && isWhite) {
      return [currentPosition - 8, currentPosition - 16];
    } else if (currentPosition <= 15 && currentPosition >= 8 && !isWhite) {
      return [currentPosition + 8, currentPosition + 16];
    }
    return isWhite ? [currentPosition - 8] : [currentPosition + 8];
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

  List<int> getQueenPossibleFields(bool isWhite, int currentPosition) {
    return [
      ...getBishopPossibleFields(isWhite, currentPosition),
      ...getRookPossibleFields(isWhite, currentPosition)
    ];
  }

  List<int> getKingPossibleFields(bool isWhite, int currentPosition) {
    final List<int> possibleMoves = [];
    int rowDifference = 0;
    int collumnDifference = 0;
    for (var i = 0; i < 64; i++) {
      rowDifference = (i ~/ 8 - currentPosition ~/ 8).abs();
      collumnDifference = (i % 8 - currentPosition % 8).abs();

      if (rowDifference <= 1 &&
          collumnDifference <= 1 &&
          i != currentPosition) {
        possibleMoves.add(i);
      }
    }
    return possibleMoves;
  }
}
