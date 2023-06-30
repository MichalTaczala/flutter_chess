import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_chess/bloc/chess_board_bloc.dart';
import 'package:flutter_chess/enums/state_enum.dart';
import 'package:flutter_chess/models/figure.dart';
import 'package:flutter_chess/widgets/tile.dart';

class ChessPage extends StatelessWidget {
  const ChessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChessBoardBloc(),
      child: const ChessView(),
    );
  }
}

class ChessView extends StatefulWidget {
  const ChessView({super.key});

  @override
  State<ChessView> createState() => _ChessViewState();
}

class _ChessViewState extends State<ChessView> {
  @override
  void initState() {
    super.initState();
    context.read<ChessBoardBloc>().add(const ChessBoardEvent.initialize());
  }

  void handleFigureClick(Figure? fig, int index) {
    final bloc = context.read<ChessBoardBloc>();
    if (fig?.isWhite != bloc.state.isWhitePlayerTurn &&
        bloc.state.gameState == StateEnum.nothingClicked) {
      return;
    }
    if (fig?.isWhite == !bloc.state.isWhitePlayerTurn &&
        bloc.state.gameState == StateEnum.possibleMovesShowed) {
      return;
    }

    if (fig == null && bloc.state.currentlyClickedFigure == null) return;
    if (bloc.state.currentlyClickedFigure?.field == index &&
        bloc.state.gameState == StateEnum.possibleMovesShowed) {
      bloc.add(const ChessBoardEvent.uncheckFigure());
      return;
    }

    if (bloc.state.gameState == StateEnum.possibleMovesShowed &&
        (bloc.state.availableFieldsToMove.contains(index) ||
            bloc.state.fieldsWithFiguresAvailableToTake.contains(index))) {
      bloc.add(ChessBoardEvent.moveFigure(
          bloc.state.currentlyClickedFigure!, index));
      return;
    }

    context
        .read<ChessBoardBloc>()
        .add(ChessBoardEvent.getAvailableFieldsToMove(fig));
  }

  Widget _buildBoardSection() {
    return BlocBuilder<ChessBoardBloc, ChessBoardState>(
      builder: (context, state) {
        return GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 8, childAspectRatio: 1),
          itemCount: 64,
          itemBuilder: (context, index) {
            Figure? figNullable = state.figuresOnBoard
                .where((element) => element.field == index)
                .toList()
                .firstOrNull;
            return InkWell(
              onTap: () => handleFigureClick(figNullable, index),
              child: Tile(
                isBlack: (index + index ~/ 8) % 2 != 0,
                index: index,
                figure: figNullable,
                isFieldAvailableToMove: state.availableFieldsToMove
                    .where((element) => element == index)
                    .toList()
                    .isNotEmpty,
                isCurrentlyClicked:
                    state.currentlyClickedFigure?.field == index,
                isUnderAttack: state.fieldsWithFiguresAvailableToTake
                    .where((element) => element == index)
                    .toList()
                    .isNotEmpty,
              ),
            );
          },
          physics: const NeverScrollableScrollPhysics(),
        );
      },
    );
  }

  Widget _buildPlayerTurnIndicatorSection() {
    return BlocBuilder<ChessBoardBloc, ChessBoardState>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("Time to move for"),
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                border: Border.all(width: 1, color: Colors.black),
                color: state.isWhitePlayerTurn ? Colors.white : Colors.black,
              ),
            )
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChessBoardBloc, ChessBoardState>(
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(32),
              child: Column(
                children: [
                  const Center(
                    child: Text(
                      "The Chess Game",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                    ),
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  Expanded(child: _buildBoardSection()),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: _buildPlayerTurnIndicatorSection(),
                  ),
                  Text("Figures taken:${state.figuresTaken}")
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
