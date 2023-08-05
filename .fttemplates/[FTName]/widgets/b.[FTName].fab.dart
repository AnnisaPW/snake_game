part of '../_index.dart';

class <FTName | pascalcase>Fab extends StatelessWidget {
  const <FTName | pascalcase>Fab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: const Icon(Icons.add),
      onPressed: () => _ct.action(),
    );
  }
}
