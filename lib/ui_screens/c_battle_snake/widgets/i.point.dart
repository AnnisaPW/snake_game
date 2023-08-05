part of '../_index.dart';

class BattleSnakePoint extends StatelessWidget {
  const BattleSnakePoint({Key? key}) : super(key: key);

  BattleSnakeCtrl get ct => battleSnakeCtrl;
  BattleSnakeData get dt => battleSnakeData.st;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 0.6,
      child: OnReactive(
        () => Text(
          '${dt.rmPoint.st}',
          textScaleFactor: 3,
        ),
      ),
    );
  }
}
