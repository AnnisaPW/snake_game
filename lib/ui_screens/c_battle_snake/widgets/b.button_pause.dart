part of '../_index.dart';

class BattleSnakeBtnPause extends StatelessWidget {
  const BattleSnakeBtnPause({Key? key}) : super(key: key);

  BattleSnakeCtrl get ct => battleSnakeCtrl;
  BattleSnakeData get dt => battleSnakeData.st;

  @override
  Widget build(BuildContext context) {
    return OnReactive(
      () => Visibility(
        visible: dt.rmIsRunning.st,
        child: OutlinedButton.icon(
          onPressed: !dt.rmIsRunning.st ? null : () => ct.isPause(),
          icon: Icon(
            Icons.pause,
            color: dt.rmIsPause.st ? Colors.green : Colors.orange,
          ),
          label: dt.rmIsPause.st ? const Text('resume') : const Text('pause'),
        ),
      ),
    );
  }
}
