part of '../_index.dart';

class BattleSnakeLayoutBuilder extends StatelessWidget {
  const BattleSnakeLayoutBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraint) {
        if (constraint.maxWidth <= 520) {
          return const SingleChildScrollView(
            child: Column(
              children: [
                BattleSnakeBody(),
                BattleSnakeImagePotrait(),
              ],
            ),
          );
        }
        return const BattleSnakeBody();
      },
    );
  }
}
