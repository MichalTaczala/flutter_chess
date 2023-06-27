part of 'chess_board_bloc.dart';

@freezed
class ChessBoardState with _$ChessBoardState {
  const factory ChessBoardState({
    @Default([]) List<Figure> figuresOnBoard,
    @Default([]) List<Figure> figuresTaken,
    @Default(true) bool isWhitePlayerTurn,
    @Default([]) List<int> availableFieldsToMove,
    int? currentlyClickedField,
  }) = _ChessBoardState;
}
