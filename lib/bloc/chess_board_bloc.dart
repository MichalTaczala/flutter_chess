import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'chess_board_event.dart';
part 'chess_board_state.dart';

class ChessBoardBloc extends Bloc<ChessBoardEvent, ChessBoardState> {
  ChessBoardBloc() : super(const ChessBoardState()) {
    on<ChessBoardEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
