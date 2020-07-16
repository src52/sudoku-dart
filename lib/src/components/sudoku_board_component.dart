import 'package:angular/angular.dart';
import 'package:angular_forms/angular_forms.dart';
import 'package:angular_router/angular_router.dart';

import 'package:sudoku/src/components/sudoku_chunk_component.dart';
import 'package:sudoku/src/game/board/SudokuGameboard.dart';
import 'package:sudoku/src/game/logic/GameManager.dart';

@Component(
  selector: 'sudoku-board',
  templateUrl: 'sudoku_board_component.html',
  styleUrls: ['sudoku_board_component.css'],
  directives: [coreDirectives, formDirectives, SudokuChunkComponent, routerDirectives],
)

class SudokuBoardComponent implements OnInit {
  final GameManager _gameManager;
  SudokuGameboard board;
  String info;

  SudokuBoardComponent(this._gameManager);

  @override
  void ngOnInit() => _getBoard();

  void _getBoard() => board = _gameManager.board;

  void checkComplete() {
    if(_gameManager.checkForCompletion()) {
      info = 'Congratulations! Puzzle complete!';
    } else {
      info = "The puzzle isn't complete yet!";
    }
  }
}