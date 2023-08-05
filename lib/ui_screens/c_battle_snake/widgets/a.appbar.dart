part of '../_index.dart';

class BattleSnakeAppbar extends StatelessWidget {
  const BattleSnakeAppbar({Key? key}) : super(key: key);

  BattleSnakeCtrl get ct => battleSnakeCtrl;
  BattleSnakeData get dt => battleSnakeData.st;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(dt.title),
      actions: [
        MediaQuery.of(context).size.width > 600
            ? const Row(
                children: [
                  BattleSnakeBtnPause(),
                  SizedBox(width: 5),
                  BattleSnakeBtnStart(),
                  SizedBox(width: 5),
                ],
              )
            : const SizedBox.shrink(),
      ],
    );
  }
}
