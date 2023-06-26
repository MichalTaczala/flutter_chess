part of 'chess_board_bloc.dart';

@immutable
abstract class ChessBoardState {
  const factory ChessBoardState({
    int? abc,
  }) = _ChessBoardState;
}
