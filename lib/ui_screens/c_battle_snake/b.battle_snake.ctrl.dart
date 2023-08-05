part of '_index.dart';

final battleSnakeCtrl = BattleSnakeCtrl();

class BattleSnakeCtrl {
  BattleSnakeData get dt => battleSnakeData.st;

  onTapCoordinat(int xCoord, int yCoord) {
    debugPrint('$xCoord , $yCoord');
    final xSnake1 = dt.rmSnake1.st[0][0];
    final ySnake1 = dt.rmSnake1.st[0][1];
    var arahSnake1 = dt.rmArahSnake1.st;

    if (arahSnake1 == 'up' || arahSnake1 == 'down') {
      if (xCoord < xSnake1) {
        dt.rmArahSnake1.st = 'left';
      } else if (xCoord > xSnake1) {
        dt.rmArahSnake1.st = 'right';
      }
    } else {
      if (yCoord < ySnake1) {
        dt.rmArahSnake1.st = 'up';
      } else if (yCoord > ySnake1) {
        dt.rmArahSnake1.st = 'down';
      }
    }
  }

  reset() {
    dt.rmSnake1.refresh();
    dt.rmPoint.refresh();
    dt.rmArahSnake1.refresh();
    dt.rmArahSnake2.refresh();
    dt.rmFoodX.refresh();
    dt.rmFoodY.refresh();
    dt.rmIsRunning.refresh();
    dt.rmIsPause.refresh();
    dt.rmSnake2.refresh();
    dt.rmInitDuration.refresh();
  }

  List<int> getRandomFood1() {
    var stringSnake = dt.rmSnake1.st.map((e) => e.toString());
    String stringFood;
    int foodX;
    int foodY;

    do {
      foodX = Random().nextInt(dt.totalX);
      foodY = Random().nextInt(dt.totalY);
      stringFood = '[$foodX, $foodY]';

      debugPrint(stringFood);
    } while (stringSnake.contains(stringFood));

    dt.rmFoodX.st = foodX;
    dt.rmFoodY.st = foodY;

    return [foodX, foodY];
  }

  isEatSnake1() {
    final snake1 = dt.rmSnake1.st;
    final xSnake1 = dt.rmSnake1.st[0][0];
    final ySnake1 = dt.rmSnake1.st[0][1];
    final foodX = dt.rmFoodX.st;
    final foodY = dt.rmFoodY.st;

    if (xSnake1 == foodX && ySnake1 == foodY) {
      dt.rmFoodX.st = getRandomFood1()[0];
      dt.rmFoodY.st = getRandomFood1()[1];

      dt.rmPoint.st = dt.rmPoint.st + 1;
      dt.timer1.cancel();

      dt.rmInitDuration.st = (dt.rmInitDuration.st * 0.9).floor();
      getStart1();
    } else {
      snake1.removeLast();
    }
  }

  changeDirection(String direction) => dt.rmArahSnake1.st = direction;

  isPause() => dt.rmIsPause.st = !dt.rmIsPause.st;

  stop() {
    dt.rmIsPause.st = false;
    dt.rmIsRunning.st = false;
  }

  play() {
    if (dt.rmIsPause.st) {
      // resume game
    } else {
      getStart1();
    }
    dt.rmIsPause.st = false;
  }

  moveSnake1() {
    final arahSnake1 = dt.rmArahSnake1.st;
    if (arahSnake1 == 'up') {
      final x = [dt.rmSnake1.st[0][0], dt.rmSnake1.st[0][1] - 1];

      dt.rmSnake1.st = [...dt.rmSnake1.st]..insert(0, x);
    }

    if (arahSnake1 == 'down') {
      final x = [dt.rmSnake1.st[0][0], dt.rmSnake1.st[0][1] + 1];
      dt.rmSnake1.st = [...dt.rmSnake1.st]..insert(0, x);
    }

    if (arahSnake1 == 'left') {
      final x = [dt.rmSnake1.st[0][0] - 1, dt.rmSnake1.st[0][1]];
      dt.rmSnake1.st = [...dt.rmSnake1.st]..insert(0, x);
    }

    if (arahSnake1 == 'right') {
      final x = [dt.rmSnake1.st[0][0] + 1, dt.rmSnake1.st[0][1]];
      dt.rmSnake1.st = [...dt.rmSnake1.st]..insert(0, x);
    }
  }

  moveSnake2() {
    logicMoveSnake2();

    if (dt.rmArahSnake2.st == 'up') {
      final x = [dt.rmSnake2.st[0][0], dt.rmSnake2.st[0][1] - 1];

      dt.rmSnake2.st = [...dt.rmSnake2.st]..insert(0, x);
    }

    if (dt.rmArahSnake2.st == 'down') {
      final x = [dt.rmSnake2.st[0][0], dt.rmSnake2.st[0][1] + 1];
      dt.rmSnake2.st = [...dt.rmSnake2.st]..insert(0, x);
    }

    if (dt.rmArahSnake2.st == 'left') {
      final x = [dt.rmSnake2.st[0][0] - 1, dt.rmSnake2.st[0][1]];
      dt.rmSnake2.st = [...dt.rmSnake2.st]..insert(0, x);
    }

    if (dt.rmArahSnake2.st == 'right') {
      final x = [dt.rmSnake2.st[0][0] + 1, dt.rmSnake2.st[0][1]];
      dt.rmSnake2.st = [...dt.rmSnake2.st]..insert(0, x);
    }
  }

  String moveSnake(List<List<int>> snake, String arah) {
    if (snake == dt.rmSnake2.st) {
      logicMoveSnake2();
    }

    if (arah == 'up') {
      final x = [snake[0][0], snake[0][1] - 1];

      snake = [...snake]..insert(0, x);
    }

    if (arah == 'down') {
      final x = [snake[0][0], snake[0][1] + 1];
      snake = [...snake]..insert(0, x);
    }

    if (arah == 'left') {
      final x = [snake[0][0] - 1, snake[0][1]];
      snake = [...snake]..insert(0, x);
    }

    if (arah == 'right') {
      final x = [snake[0][0] + 1, snake[0][1]];
      snake = [...snake]..insert(0, x);
    }

    debugPrint(arah.toString());
    return arah;
  }

  String logicMoveSnake2() {
    final snakeX = dt.rmSnake2.st[0][0];
    final snakeY = dt.rmSnake2.st[0][1];
    final foodX = dt.rmFoodX.st;
    final foodY = dt.rmFoodY.st;
    if (snakeX == foodX) {
      if (snakeY > foodY) {
        dt.rmArahSnake2.st = 'up';
      }
      if (snakeY < foodY) {
        dt.rmArahSnake2.st = 'down';
      }
    } else {
      if (snakeX > foodX) {
        dt.rmArahSnake2.st = 'left';
      }
      if (snakeX < foodX) {
        dt.rmArahSnake2.st = 'right';
      }
    }
    return dt.rmArahSnake2.st;
  }

  getStart1() {
    dt.rmIsRunning.st = true;
    Timer.periodic(
      Duration(milliseconds: dt.rmInitDuration.st),
      (timer) {
        if (dt.rmIsPause.st == false) {
          dt.timer1 = timer;
          moveSnake1();
          // moveSnake(dt.rmSnake1.st, dt.rmArahSnake1.st);
          isThroughSnake1();
          updateIsFinish();
          checkIsFinish();
          isEatSnake1();
        }
      },
    );
  }

  getStart2() {
    dt.rmIsRunning.st = true;
    Timer.periodic(
      const Duration(milliseconds: 500),
      (timer2) {
        if (dt.rmIsPause.st == false) {
          dt.timer2 = timer2;
          moveSnake2();
          // moveSnake(dt.rmSnake2.st, dt.rmArahSnake2.st);
          isThroughSnake2();
          gameOverSnake2();
          getRandomFood2();
        }
      },
    );
  }

  isThroughSnake1() {
    final xSnake1 = dt.rmSnake1.st[0][0];
    final ySnake1 = dt.rmSnake1.st[0][1];

    if (xSnake1 < 0) {
      final snake = dt.rmSnake1.st;
      snake[0][0] = dt.totalX - 1;
    }
    if (xSnake1 > dt.totalX - 1) {
      final snake = dt.rmSnake1.st;
      snake[0][0] = 0;
    }
    if (ySnake1 < 0) {
      final snake = dt.rmSnake1.st;
      snake[0][1] = dt.totalY - 1;
    }
    if (ySnake1 > dt.totalY - 1) {
      final snake = dt.rmSnake1.st;
      snake[0][1] = 0;
    }
  }

  updateIsFinish() => isTouchBody1() || isCollision() || isTouchBody2()
      ? dt.rmIsRunning.st = false
      : null;

  checkIsFinish() {
    if (dt.rmIsRunning.st == false) {
      dt.rmIsPause.st = true;
      Dialogs.gameOver('Game Over', 'Your point is ${dt.rmPoint.st}');
    }
  }

  bool isTouchBody1() {
    var z = false;
    final headX = dt.rmSnake1.st[0][0];
    final headY = dt.rmSnake1.st[0][1];
    final snake1 = dt.rmSnake1.st;

    for (var i = 1; i < snake1.length; i++) {
      if (headX == snake1[i][0] && headY == snake1[i][1]) {
        z = true;
      }
    }
    return z;
  }

  bool isCollision() {
    final condition1 = dt.rmSnake1.st[0][0] == dt.rmSnake2.st[0][0];
    final condition2 = dt.rmSnake1.st[0][1] == dt.rmSnake2.st[0][1];
    return condition1 && condition2;
  }

  //* ----- ----- ----- ----- ----- ----- ----- ----- -----

  getRandomFood2() {
    final xSnake2 = dt.rmSnake2.st[0][0];
    final ySnake2 = dt.rmSnake2.st[0][1];
    var foodX = dt.rmFoodX.st;
    var foodY = dt.rmFoodY.st;

    if (xSnake2 == foodX && ySnake2 == foodY) {
      dt.rmFoodX.st = Random().nextInt(dt.totalX);
      dt.rmFoodY.st = Random().nextInt(dt.totalY);
    } else {
      dt.rmSnake2.st.removeLast();
    }
  }

  gameOverSnake2() =>
      isTouchBody1() || isCollision() || isTouchBody2() || !dt.rmIsRunning.st
          ? dt.timer2.cancel()
          : null;

  isThroughSnake2() {
    final xSnake2 = dt.rmSnake2.st[0][0];
    final ySnake2 = dt.rmSnake2.st[0][1];

    if (xSnake2 < 0) {
      final snake = dt.rmSnake2.st;
      snake[0][0] = dt.totalX - 1;
    }
    if (xSnake2 > dt.totalX - 1) {
      final snake = dt.rmSnake2.st;
      snake[0][0] = 0;
    }
    if (ySnake2 < 0) {
      final snake = dt.rmSnake2.st;
      snake[0][1] = dt.totalY - 1;
    }
    if (ySnake2 > dt.totalY - 1) {
      final snake = dt.rmSnake2.st;
      snake[0][1] = 0;
    }
  }

  bool isTouchBody2() {
    var z = false;
    final xSnake1 = dt.rmSnake1.st[0][0];
    final ySnake1 = dt.rmSnake1.st[0][1];
    final xSnake2 = dt.rmSnake2.st[0][0];
    final ySnake2 = dt.rmSnake2.st[0][1];
    final snake2 = dt.rmSnake2.st;
    final snake1 = dt.rmSnake1.st;

    for (var i = 1; i < snake2.length; i++) {
      if (xSnake1 == snake2[i][0] && ySnake1 == snake2[i][1]) {
        z = true;
      }
    }
    for (var i = 1; i < dt.rmSnake1.st.length; i++) {
      if (xSnake2 == snake1[i][0] && ySnake2 == snake1[i][1]) {
        z = true;
      }
    }
    return z;
  }
}
