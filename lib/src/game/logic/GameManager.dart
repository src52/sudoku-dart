import 'package:collection/collection.dart';

import 'package:sudoku/src/game/board/SudokuGameboard.dart';

///The GameManager class handles the state of the Sudoku game.
class GameManager {
  /// Gets the game board.
  SudokuGameboard get board => _board;
  final _board = SudokuGameboard(59);

  /// Given a selection of 9 Integers that represents a Sudoku row, column, or
  /// chunk, determine whether or not it's valid. The array must contain the
  /// numbers 1 through 9 with no duplicates.
  bool validSelection(List<int> selection) {
    if (selection.contains(null)) {
      return false;
    }
    selection.sort();
    var expectedValue = Iterable<int>.generate(10).skip(1).toList();
    return ListEquality().equals(selection, expectedValue);
  }

  /// Check whether or not the user has completed the Sudoku puzzle.
  bool checkForCompletion() {
    for(var a = 0; a < board.sudokuChunks.values.length; a++) {
      if(!validSelection(board.row(a).toList())
          || !validSelection(board.column(a).toList())
          || !validSelection(board.sudokuChunks.values.elementAt(a).toList())) {
        return false;
      }
    }
    return true;
  }
}