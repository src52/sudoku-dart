import 'package:sudoku/src/game/logic/SudokuGenerator.dart';
import 'Pair.dart';
import 'SudokuChunk.dart';


/// This class represents a standard 3 by 3 Sudoku game board.
class SudokuGameboard {
  final _chunkMap = <Pair, SudokuChunk>{};

  SudokuGameboard(var numbersToRemove) {
    var generator = SudokuGenerator(numbersToRemove);
    var unshuffledMap = <Pair, SudokuChunk>{};

    for (var y = 0; y < 3; y ++) {
      for (var x = 0; x < 3; x++) {
        unshuffledMap[Pair(x, y)] = SudokuChunk.fromSubList(
            chunkValuesAt(generator.numbers, (x * 3), (y * 3)));
      }
    }
    _chunkMap.addAll(unshuffledMap);
  }

  /// Given a column index, return the Integer values of the column.
  List<int> column(int col) {
    var colValues = <int>[];

    var gameboardCol = getEquivalentBoardIndex(col);
    var chunkCol = getChunkIndex(col);

    var pairsOfChunks = columnPairList(gameboardCol);
    var pairsOfSquares = columnPairList(chunkCol);

    final chunkList = pairsOfChunks.map((pair) => sudokuChunks[pair]).toList();

    for(var chunk in chunkList) {
      colValues.addAll(pairsOfSquares.map((pair) =>
          chunk.sudokuSquares[pair].value));
    }
    return colValues;
  }

  /// Given a row index, return the Integer values of the row.
  List<int> row(int row) {
    var rowValues = <int>[];

    var gameboardRow = getEquivalentBoardIndex(row);
    var chunkRow = getChunkIndex(row);

    var pairsOfChunks = rowPairList(gameboardRow);
    var pairsOfSquares = rowPairList(chunkRow);

    final chunkList = pairsOfChunks.map((pair) => sudokuChunks[pair]).toList();

    for(var chunk in chunkList) {
      rowValues.addAll(pairsOfSquares.map((pair) =>
          chunk.sudokuSquares[pair].value));
    }
    return rowValues;
  }

  /// Given a column index, 1 - 9, create a List of Pairs that compose the given column.
  List<Pair> columnPairList(int index) {
    var pairs = <Pair>[];
    for(var a = 0; a < 3; a++) {
      pairs.add(Pair(index, a));
    }
    return pairs;
  }

  /// Given a row index, 1 - 9, create a List of Pairs that compose the given row.
  List<Pair> rowPairList(int index) {
    var pairs = <Pair>[];
    for(var a = 0; a < 3; a++) {
      pairs.add(Pair(a, index));
    }
    return pairs;
  }

  /// Given a List of Integers representing a game board of 9 chunks, return
  /// a specific chunk given x and y are their origin coordinates (0, 0).
  List<int> chunkValuesAt(var list, var x, var y) {
    var chunkData = <int>[];
    for(var a = 0; a < 3; a++) {
      chunkData.addAll(list[y + a].sublist(x, x + 3));
    }
    return chunkData;
  }

  /// Given a particular row/column index, 1 - 9, return the equivalent index of
  /// where it's contained within the chunk.
  int getChunkIndex(int index) {
    var result = (index % 3) - 1;
    if(result == -1) {
      return 2;
    }
    return result;
  }

  ///Given a particular row/column index, 1 - 9, return the equivalent index of
  ///where it's contained within the game board.
  int getEquivalentBoardIndex(int index) {
    var result = ((index / 3) - 1).ceil();
    if(result == -1) {
      return 0;
    }
    return result;
  }

  Map<Pair, SudokuChunk> get sudokuChunks => _chunkMap;
}