part of '_index.dart';

final battleSnakeData = RM.inject<BattleSnakeData>(
  () => BattleSnakeData(),
  debugPrintWhenNotifiedPreMessage: 'BattleSnakeData',
  // sideEffects: SideEffects(
  //   initState: () => battleSnakeCtrl.init(),
  // ),
);

class BattleSnakeData {
  final String title = 'Snake Game Battle';
  final String imageSnake = './assets/images/snakeAladdin.png';
  final String imageApple = './assets/images/apple.png';
  final String headSnake1 = './assets/images/snake1.png';
  final String headSnake2 = './assets/images/snake2.png';

  final int totalX = 20;
  final int totalY = 20;
  final int width = 20;

  List<List<ReactiveModel<int?>>> listX = [];

  late Timer timer1;
  late Timer timer2;

// reactive models
  final rmInitDuration = 500.inj();
  final rmPoint = 0.inj();

  final rmSnake1 = [
    [0, 2],
    [0, 1],
    [0, 0]
  ].inj();

  final rmSnake2 = [
    [19, 2],
    [19, 1],
    [19, 0]
  ].inj();

  final rmArahSnake1 = 'down'.inj();
  final rmArahSnake2 = 'down'.inj();

  final rmIsRunning = false.inj();
  final rmIsPause = false.inj();

  late final rmFoodX =
      RM.inject<int>(() => battleSnakeCtrl.getRandomFood1()[0]);
  late final rmFoodY = RM.inject(() => battleSnakeCtrl.getRandomFood1()[1]);
}
