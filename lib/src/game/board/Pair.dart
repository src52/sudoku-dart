/// A Pair is a set of x and y coordinates. Used as Map keys for storing the state
/// of the Sudoku game board.
class Pair {
  final int x;
  final int y;

  Pair(this.x, this.y);

  /// Generates a unique hashcode for Pair objects.
  @override
  int get hashCode {
    var hashOut = 17;
    hashOut = 31 * hashOut + x;
    hashOut = 31 * hashOut + y;
    return hashOut;
  }

  ///Checks the equality of Pair objects.
  @override
  bool operator ==(other) {
    // TODO: implement ==
    return other is Pair
        && x == other.x
        && y == other.y;
  }
}