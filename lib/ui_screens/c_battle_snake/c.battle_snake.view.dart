part of '_index.dart';

class BattleSnakeView extends StatelessWidget {
  const BattleSnakeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(56),
        child: BattleSnakeAppbar(),
      ),
      body: BattleSnakeSwipeDirection(),
    );
  }
}
