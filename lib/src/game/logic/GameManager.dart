import 'package:sudoku/src/game/board/Pair.dart';
import 'package:collection/collection.dart';
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
      if(!validSelection(getRow(a).toList()) ||
          !validSelection(getColumn(a).toList()) ||
          !validSelection(board.sudokuChunks.values.elementAt(a).toList())) {
        return false;
      }
    }

    return true;
  }

  List<int> getColumn(int col) {
    var colValues = <int>[];

    var gameboardCol = getEquivalentBoardIndex(col);
    var chunkCol = getChunkIndex(col);

    var pairsOfChunks = createColumnPairList(gameboardCol);
    var pairsOfSquares = createColumnPairList(chunkCol);

    final chunkList = pairsOfChunks.map((pair) =>
    _board.sudokuChunks[pair]).toList();

    for(var chunk in chunkList) {
      colValues.addAll(
          pairsOfSquares.map((pair) =>
          chunk.sudokuSquares[pair].value));
    }
    return colValues;
  }

  List<int> getRow(int row) {
    var rowValues = <int>[];

    var gameboardRow = getEquivalentBoardIndex(row);
    var chunkRow = getChunkIndex(row);

    var pairsOfChunks = createRowPairList(gameboardRow);
    var pairsOfSquares = createRowPairList(chunkRow);

    final chunkList = pairsOfChunks.map((pair) =>
    _board.sudokuChunks[pair]).toList();

    for(var chunk in chunkList) {
      rowValues.addAll(
          pairsOfSquares.map((pair) =>
          chunk.sudokuSquares[pair].value));
    }
    return rowValues;
  }

  ///Given a particular row/column index, 1 - 9, return the equivalent index
  ///within the specific chunk.
  int getChunkIndex(int index) {
    var result = (index % 3) - 1;
    if(result == -1) {
      return 2;
    }
    return result;
  }

  ///Given a particular row/column index, 1 - 9, return the row/column index
  ///where it's contained within the game board.
  int getEquivalentBoardIndex(int index) {
    var result = ((index / 3) - 1).ceil();
    if(result == -1) {
      return 0;
    }
    return result;
  }

  List<Pair> createColumnPairList(int index) {
    var pairs = <Pair>[];
    for(var a = 0; a < 3; a++) {
      pairs.add(Pair(index, a));
    }
    return pairs;
  }

  List<Pair> createRowPairList(int index) {
    var pairs = <Pair>[];
    for(var a = 0; a < 3; a++) {
      pairs.add(Pair(a, index));
    }
    return pairs;
  }
}