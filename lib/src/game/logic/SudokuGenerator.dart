import 'dart:math';

class SudokuGenerator {

  var _numbers;
  var _shuffledList;

  /// The SudokuGenerator class generates a valid Sudoku puzzle, represented as
  /// a 9 by 9 List of integer Lists.
  SudokuGenerator(var numbersToRemove) {
    _numbers = <List<int>>[];
    var rand = Random();

    _shuffledList = (Iterable<int>.generate(10).skip(1)).toList();
    _shuffledList.shuffle();

    _numbers = List.generate(9, (i) => rotate(_shuffledList, i), growable: false);

    while(numbersToRemove != 0) {
      var randRow = rand.nextInt(_numbers[0].length);
      var randCol = rand.nextInt(_numbers.length);

      _numbers[randRow][randCol] = null;
      numbersToRemove--;
    }

    print('numbers: $_numbers');
  }

  /// The rotate method takes a row of Sudoku numbers and shifts them to be used
  /// for the remaining rows of the puzzle.
  ///
  /// Given an initial row of 9 values, we fill each remaining row by left-shifting
  /// the preceding row's values by 3. Except on rows 2 and 5, where they're only
  /// left-shifted by 1.
  ///
  /// The list returned is the list provided, shifted by a certain amount depending
  /// on the current index/row value.
  List rotate(List list, int index) {
    var totalShift = 0;
    for(var a = 0; a < index; a++) {
      if(a == 2 || a == 5) {
        totalShift++;
      } else {
        totalShift += 3;
      }
    }
    var i = totalShift % list.length;
    return list.sublist(i)..addAll(list.sublist(0, i));
  }

  get numbers => _numbers;
}