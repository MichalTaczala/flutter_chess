List<int> pawnClickHandler(int tileNumber, bool isWhite) {
  List<int> potentialMoves = [];
  if (isWhite) {
    potentialMoves.add(tileNumber - 8);
    potentialMoves.add(tileNumber - 16);
  } else {
    potentialMoves.add(tileNumber + 8);
    potentialMoves.add(tileNumber + 16);
  }
  return potentialMoves
      .where(
        (element) => element >= 0 || element <= 63,
      )
      .toList();
}
