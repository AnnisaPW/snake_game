part of '../_index.dart';

class BattleSnakeImageLandscape extends StatelessWidget {
  const BattleSnakeImageLandscape({Key? key}) : super(key: key);

  BattleSnakeCtrl get ct => battleSnakeCtrl;
  BattleSnakeData get dt => battleSnakeData.st;

  @override
  Widget build(BuildContext context) {
    final sizeWidth = MediaQuery.of(context).size.width;
    const double size = 100;

    return Visibility(
      visible: sizeWidth > 520,
      child: Positioned(
        right: 0,
        bottom: 0,
        child: SizedBox(
          width: sizeWidth <= 930
              ? size
              : sizeWidth <= 1000
                  ? size * 1.5
                  : sizeWidth <= 1300
                      ? size * 2
                      : size * 3,
          height: sizeWidth <= 930
              ? size
              : sizeWidth <= 1000
                  ? size * 1.5
                  : sizeWidth <= 1300
                      ? size * 2
                      : size * 3,
          child: Image.asset(dt.imageSnake),
        ),
      ),
    );
  }
}
