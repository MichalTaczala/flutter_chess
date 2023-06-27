part of 'chess_board_bloc.dart';

@freezed
class ChessBoardEvent with _$ChessBoardEvent {
  const factory ChessBoardEvent.initialize() = _Initialize;
  const factory ChessBoardEvent.getAvailableFieldsToMove(Figure? figure) =
      _GetAvailableFieldsToMove;
  const factory ChessBoardEvent.moveFigure(Figure figure, int newPosition) =
      _MoveFigure;
}
