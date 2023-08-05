part of '../_index.dart';

class <FTName | pascalcase>Appbar extends StatelessWidget {
  const <FTName | pascalcase>Appbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: OnReactive(() => Text(_dt.rxTitle.st)),
    );
  }
}
