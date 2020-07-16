import 'package:angular/angular.dart';
import 'package:angular_forms/angular_forms.dart';
import 'package:sudoku/src/components/sudoku_square_component.dart';
import 'package:sudoku/src/game/board/SudokuChunk.dart';

@Component(
  selector: 'sudoku-chunk',
  templateUrl: 'sudoku_chunk_component.html',
  styleUrls: ['sudoku_chunk_component.css'],
  directives: [coreDirectives, formDirectives, SudokuSquareComponent],
)

class SudokuChunkComponent {
  @Input()
  SudokuChunk chunk;

  SudokuChunkComponent();
}