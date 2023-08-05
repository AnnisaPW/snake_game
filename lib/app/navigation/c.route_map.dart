part of '_index.dart';

class RouteMap {
  RouteMap._();

  static final data = {
    // Routes.root: (RouteData data) => const HomeView(),
    //* master -- ----- ----- ----- ----- -----

    Routes.snake: (RouteData data) => const BattleSnakeView(),
  };
}
