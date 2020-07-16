import 'package:sudoku/src/game/logic/SudokuGenerator.dart';
import 'Pair.dart';
import 'SudokuChunk.dart';


/// This class represents a standard 3 by 3 Sudoku game board.
class SudokuGameboard {
  final _chunkMap = <Pair, SudokuChunk>{};

  SudokuGameboard.generator(var numbersToRemove) {
    var generator = SudokuGenerator(numbersToRemove);
    var unshuffledMap = <Pair, SudokuChunk>{};

    for (var y = 0; y < 3; y ++) {
      for (var x = 0; x < 3; x++) {
        unshuffledMap[Pair(x, y)] = SudokuChunk.fromSubList(
            getChunkData(generator.numbers, (x * 3), (y * 3)));
      }
    }
    _chunkMap.addAll(unshuffledMap);
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

  List<int> getChunkData(var list, var x, var y) {
    var chunkData = <int>[];
    for(var a = 0; a < 3; a++) {
      chunkData.addAll(list[y + a].sublist(x, x + 3));
    }
    return chunkData;
  }

  int getBoardChunkIndex(int index) {
    return ((index / 3) - 1).ceil();
  }

  Map<Pair, SudokuChunk> get sudokuChunks => _chunkMap;
}