import 'package:angular/angular.dart';
import 'package:angular_forms/angular_forms.dart';
import 'package:angular_router/angular_router.dart';

import 'package:sudoku/src/components/sudoku_board_component.dart';
import 'package:sudoku/src/game/logic/GameManager.dart';
import 'package:sudoku/src/routes/route_paths.dart';
import 'package:sudoku/src/routes/routes.dart';


@Component(
  selector: 'my-app',
  templateUrl: 'app_component.html',
  providers: [ClassProvider(GameManager)],
  styleUrls: ['app_component.css'],
  directives: [coreDirectives, formDirectives, SudokuBoardComponent, routerDirectives],
  exports: [RoutePaths, Routes],
)
class AppComponent {
  final title = 'Sudoku';
}