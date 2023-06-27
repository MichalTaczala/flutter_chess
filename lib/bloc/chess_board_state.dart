part of 'chess_board_bloc.dart';

@freezed
class ChessBoardState with _$ChessBoardState {
  const factory ChessBoardState({
    @Default(StateEnum.nothingClicked) StateEnum gameState,
    @Default([]) List<Figure> figuresOnBoard,
    @Default([]) List<Figure> figuresTaken,
    @Default(true) bool isWhitePlayerTurn,
    @Default([]) List<int> availableFieldsToMove,
    @Default([]) List<int> fieldsWithFiguresAvailableToTake,
    Figure? currentlyClickedFigure,
  }) = _ChessBoardState;
}
