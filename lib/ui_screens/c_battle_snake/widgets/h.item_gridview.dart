part of '../_index.dart';

class BattleSnakeItemGridView extends StatelessWidget {
  const BattleSnakeItemGridView({Key? key}) : super(key: key);

  BattleSnakeCtrl get ct => battleSnakeCtrl;
  BattleSnakeData get dt => battleSnakeData.st;

  Widget? itemX(int z) {
    switch (z) {
      case 0:
        return const BattleSnakeItem(z: 0);
      case 1:
        return const BattleSnakeItem(z: 1);
      case -1:
        return const BattleSnakeItem(z: -1);
      case 2:
        return const BattleSnakeItem(z: 2);
      case -2:
        return const BattleSnakeItem(z: -2);
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return OnBuilder<List<List<int>>>.data(
      listenTo: dt.rmSnake2,
      builder: (data) => GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: dt.totalX),
        itemCount: dt.totalX * dt.totalY,
        itemBuilder: (context, index) {
          var z = 9;
          var indexX = index % dt.totalX;
          var indexY = (index / dt.totalX).floor();

          var isHeadSnake = (indexX == dt.rmSnake1.st[0][0]) &&
              (indexY == dt.rmSnake1.st[0][1]);
          var isHeadSnake2 = (indexX == dt.rmSnake2.st[0][0]) &&
              (indexY == dt.rmSnake2.st[0][1]);
          var isFood = (indexX == dt.rmFoodX.st) && (indexY == dt.rmFoodY.st);

          for (var item in dt.rmSnake1.st) {
            if (item[0] == indexX && item[1] == indexY) {
              z = -1;
            }
          }

          for (var item in dt.rmSnake2.st) {
            if (item[0] == indexX && item[1] == indexY) {
              z = -2;
            }
          }

          if (isFood) {
            z = 0;
          } else if (isHeadSnake) {
            z = 1;
          } else if (isHeadSnake2) {
            z = 2;
          }

          return InkWell(
            child: Container(
              child: itemX(z),
            ),
            onTap: () => ct.onTapCoordinat(indexX, indexY),
          );
        },
      ),
    );
  }
}
