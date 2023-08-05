part of '_index.dart';

class <FTName | pascalcase>View extends StatelessWidget {
  const <FTName | pascalcase>View({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(56),
        child: <FTName | pascalcase>Appbar(),
      ),
      floatingActionButton: <FTName | pascalcase>Fab(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            <FTName | pascalcase>Charlie(),
            <FTName | pascalcase>Delta(),
            <FTName | pascalcase>Echo(),
          ],
        ),
      ),
    );
  }
}
