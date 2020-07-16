class SudokuSquare {
  int value;
  bool editable = false;

  SudokuSquare(this.value) {
    if(value == null) {
      editable = true;
    }
  }
}