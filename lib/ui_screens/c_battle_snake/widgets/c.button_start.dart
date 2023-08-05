part of '../_index.dart';

class BattleSnakeBtnStart extends StatelessWidget {
  const BattleSnakeBtnStart({Key? key}) : super(key: key);

  BattleSnakeCtrl get ct => battleSnakeCtrl;
  BattleSnakeData get dt => battleSnakeData.st;

  @override
  Widget build(BuildContext context) {
    return OnReactive(
      () => OutlinedButton.icon(
        autofocus: true,
        icon: Icon(
          !dt.rmIsRunning.st ? Icons.play_arrow : Icons.stop,
          color: !dt.rmIsRunning.st ? Colors.green : Colors.red,
        ),
        label: !dt.rmIsRunning.st
            ? const Text(
                'play',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              )
            : const Text('stop'),
        onPressed: () {
          if (!dt.rmIsRunning.st) {
            ct.getStart1();
            ct.getStart2();
          } else {
            ct.stop();
          }
        },
      ),
    );
  }
}
