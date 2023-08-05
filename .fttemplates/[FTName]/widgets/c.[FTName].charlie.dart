part of '../_index.dart';

class <FTName | pascalcase>Charlie extends StatelessWidget {
  const <FTName | pascalcase>Charlie({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(Random().nextInt(100).toString()),
        OnReactive(() => Text('${_dt.rxInt.st}')),
      ],
    );
  }
}
