part of '../_index.dart';

class BattleSnakeBody extends StatelessWidget {
  const BattleSnakeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Stack(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              child: BattleSnakeBackground(),
            ),
          ],
        ),
        BattleSnakeImageLandscape(),
      ],
    );
  }
}
