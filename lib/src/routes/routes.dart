import 'package:angular_router/angular_router.dart';

import 'package:sudoku/src/components/sudoku_board_component.template.dart' as sudoku_board_template;
import 'route_paths.dart';

class Routes {
  static final sudoku = RouteDefinition(
    routePath: RoutePaths.sudoku,
    component: sudoku_board_template.SudokuBoardComponentNgFactory,
  );

  static final all = <RouteDefinition>[
    sudoku,
    RouteDefinition.redirect(
      path: '',
      redirectTo: RoutePaths.sudoku.toUrl(),
    ),
  ];
}