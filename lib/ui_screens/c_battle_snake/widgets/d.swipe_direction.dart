part of '../_index.dart';

class BattleSnakeSwipeDirection extends StatelessWidget {
  const BattleSnakeSwipeDirection({Key? key}) : super(key: key);

  BattleSnakeCtrl get ct => battleSnakeCtrl;
  BattleSnakeData get dt => battleSnakeData.st;

  @override
  Widget build(BuildContext context) {
    return SimpleGestureDetector(
      onVerticalSwipe: (details) {
        if (details == SwipeDirection.up) {
          ct.changeDirection('up');
        }
        if (details == SwipeDirection.down) {
          ct.changeDirection('down');
        }
      },
      onHorizontalSwipe: (details) {
        if (details == SwipeDirection.right) {
          ct.changeDirection('right');
        }
        if (details == SwipeDirection.left) {
          ct.changeDirection('left');
        }
      },
      child: const BattleSnakeLayoutBuilder(),
    );
  }
}
