import 'SudokuSquare.dart';
import 'Pair.dart';

/// A SudokuChunk represents 1/9th of the Sudoku game board. Each chunk contains
/// 9 Sudoku squares.
class SudokuChunk {
  final _sudokuSquares = <Pair, SudokuSquare>{};

  Map<Pair, SudokuSquare> get sudokuSquares => _sudokuSquares;

  SudokuChunk.fromSubList(List<int> sudokuValues) {
    var count = 0;
    for(var y = 0; y < 3; y++) {
      for(var x = 0; x < 3; x++) {
        _sudokuSquares[Pair(x, y)] = SudokuSquare(sudokuValues[count++]);
      }
    }
  }

  List<int> toList() {
    var chunkList = <int>[];
    sudokuSquares.values.forEach((element) => chunkList.add(element.value));
    return chunkList;
  }
}
