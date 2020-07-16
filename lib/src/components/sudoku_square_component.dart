import 'package:angular/angular.dart';
import 'package:angular_forms/angular_forms.dart';
import 'package:sudoku/src/game/board/SudokuSquare.dart';

@Component(
  selector: 'sudoku-square',
  templateUrl: 'sudoku_square_component.html',
  styleUrls: ['sudoku_square_component.css'],
  directives: [coreDirectives, formDirectives],

)
class SudokuSquareComponent {
  @Input()
  SudokuSquare square;

  SudokuSquareComponent();
}

