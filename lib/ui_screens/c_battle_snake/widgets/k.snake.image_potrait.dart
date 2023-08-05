part of '../_index.dart';

class BattleSnakeImagePotrait extends StatelessWidget {
  const BattleSnakeImagePotrait({Key? key}) : super(key: key);

  BattleSnakeCtrl get ct => battleSnakeCtrl;
  BattleSnakeData get dt => battleSnakeData.st;

  @override
  Widget build(BuildContext context) {
    final sizeWidth = MediaQuery.of(context).size.width;
    final sizeHeight = MediaQuery.of(context).size.height;
    const double size = 100;

    return Visibility(
      visible: sizeWidth <= 520 && sizeHeight >= 642,
      child: SizedBox(
        width: double.infinity,
        height: sizeWidth <= 400
            ? size * 2
            : sizeWidth <= 450
                ? size * 1.5
                : size,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Image.asset(dt.imageSnake),
          ],
        ),
      ),
    );
  }
}
