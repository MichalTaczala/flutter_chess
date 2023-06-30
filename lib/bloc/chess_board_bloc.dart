import 'package:bloc/bloc.dart';
import 'package:flutter_chess/enums/figure_type_enum.dart';
import 'package:flutter_chess/enums/state_enum.dart';
import 'package:flutter_chess/models/figure.dart';
import 'package:flutter_chess/utils/get_fields_to_move.dart';
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
              getPawnPossibleFieldsToMove(figure.isWhite, figure.field, state));
          availableFieldsToAttack.addAll(
              getPawnPossibleFieldsToAttack(figure.isWhite, figure.field));
          break;
        case FigureTypeEnum.rook:
          final Map<String, List<int>> map = mergeStringListMaps<int>([
            getAvailableTiles((newPosition) => newPosition + 8, (x) => x >= 64,
                figure.field, figure.isWhite, state),
            getAvailableTiles((newPosition) => newPosition - 8, (x) => x < 0,
                figure.field, figure.isWhite, state),
            getAvailableTiles(
                (newPosition) => newPosition + 1,
                (x) => x ~/ 8 != figure.field ~/ 8,
                figure.field,
                figure.isWhite,
                state),
            getAvailableTiles(
                (newPosition) => newPosition - 1,
                (x) => x ~/ 8 != figure.field ~/ 8,
                figure.field,
                figure.isWhite,
                state),
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
            }, figure.field, figure.isWhite, state),
            getAvailableTiles((newPosition) => newPosition - 7, (int x) {
              int rowDifference = 0;
              int collumnDifference = 0;
              rowDifference = (x ~/ 8 - figure.field ~/ 8).abs();
              collumnDifference = (x % 8 - figure.field % 8).abs();
              if (rowDifference != collumnDifference) return true;
              return false;
            }, figure.field, figure.isWhite, state),
            getAvailableTiles((newPosition) => newPosition + 7, (int x) {
              int rowDifference = 0;
              int collumnDifference = 0;
              rowDifference = (x ~/ 8 - figure.field ~/ 8).abs();
              collumnDifference = (x % 8 - figure.field % 8).abs();
              if (rowDifference != collumnDifference) return true;
              return false;
            }, figure.field, figure.isWhite, state),
            getAvailableTiles((newPosition) => newPosition - 9, (int x) {
              int rowDifference = 0;
              int collumnDifference = 0;
              rowDifference = (x ~/ 8 - figure.field ~/ 8).abs();
              collumnDifference = (x % 8 - figure.field % 8).abs();
              if (rowDifference != collumnDifference) return true;
              return false;
            }, figure.field, figure.isWhite, state),
          ], [
            "fieldsToGo",
            "fieldsToAttack",
          ]);
          availableFieldsToMove = map["fieldsToGo"]!;
          availableFieldsToAttack = map["fieldsToAttack"]!;
          break;
        case FigureTypeEnum.knight:
          final Map<String, List<int>> map =
              getAvailableTilesForKnight(figure.field, figure.isWhite, state);
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
            }, figure.field, figure.isWhite, state),
            getAvailableTiles((newPosition) => newPosition - 7, (int x) {
              int rowDifference = 0;
              int collumnDifference = 0;
              rowDifference = (x ~/ 8 - figure.field ~/ 8).abs();
              collumnDifference = (x % 8 - figure.field % 8).abs();
              if (rowDifference != collumnDifference) return true;
              return false;
            }, figure.field, figure.isWhite, state),
            getAvailableTiles((newPosition) => newPosition + 7, (int x) {
              int rowDifference = 0;
              int collumnDifference = 0;
              rowDifference = (x ~/ 8 - figure.field ~/ 8).abs();
              collumnDifference = (x % 8 - figure.field % 8).abs();
              if (rowDifference != collumnDifference) return true;
              return false;
            }, figure.field, figure.isWhite, state),
            getAvailableTiles((newPosition) => newPosition - 9, (int x) {
              int rowDifference = 0;
              int collumnDifference = 0;
              rowDifference = (x ~/ 8 - figure.field ~/ 8).abs();
              collumnDifference = (x % 8 - figure.field % 8).abs();
              if (rowDifference != collumnDifference) return true;
              return false;
            }, figure.field, figure.isWhite, state),
          ], [
            "fieldsToGo",
            "fieldsToAttack",
          ]);
          final Map<String, List<int>> mapWithRookFields =
              mergeStringListMaps<int>([
            getAvailableTiles((newPosition) => newPosition + 8, (x) => x >= 64,
                figure.field, figure.isWhite, state),
            getAvailableTiles((newPosition) => newPosition - 8, (x) => x < 0,
                figure.field, figure.isWhite, state),
            getAvailableTiles(
                (newPosition) => newPosition + 1,
                (x) => x ~/ 8 != figure.field ~/ 8,
                figure.field,
                figure.isWhite,
                state),
            getAvailableTiles(
                (newPosition) => newPosition - 1,
                (x) => x ~/ 8 != figure.field ~/ 8,
                figure.field,
                figure.isWhite,
                state),
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
          final map =
              getKingPossibleFields(figure.isWhite, figure.field, state);
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
}
