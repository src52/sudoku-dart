import 'package:collection/collection.dart';

import 'package:sudoku/src/game/board/Pair.dart';
import 'package:sudoku/src/game/board/SudokuGameboard.dart';

///The GameManager class handles the state of the Sudoku game.
class GameManager {
  /// Gets the game board.
  SudokuGameboard get board => _board;
  final _board = SudokuGameboard.generator(1);

  bool validSelection(List<int> selection) {
    if (selection.contains(null)) {
      return false;
    }
    selection.sort();
    var expectedValue = Iterable<int>.generate(10).skip(1).toList();
    return ListEquality().equals(selection, expectedValue);
  }

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