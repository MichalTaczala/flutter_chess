import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_chess/bloc/chess_board_bloc.dart';
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

  void handleFigureClick(Figure? fig) {
    if (fig == null) return;
    context
        .read<ChessBoardBloc>()
        .add(ChessBoardEvent.getAvailableFieldsToMove(fig));
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
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  Expanded(
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 8, childAspectRatio: 1),
                      itemCount: 64,
                      itemBuilder: (context, index) {
                        Figure? figNullable = state.figuresOnBoard
                            .where((element) => element.field == index)
                            .toList()
                            .firstOrNull;
                        return InkWell(
                          onTap: () => handleFigureClick(figNullable),
                          child: Tile(
                            isBlack: (index + index ~/ 8) % 2 != 0,
                            index: index,
                            figure: figNullable,
                            isFieldAvailableToMove: state.availableFieldsToMove
                                .where((element) => element == index)
                                .toList()
                                .isNotEmpty,
                            isCurrentlyClicked:
                                state.currentlyClickedField == index,
                          ),
                        );
                      },
                      physics: const NeverScrollableScrollPhysics(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
