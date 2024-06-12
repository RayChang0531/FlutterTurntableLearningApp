import 'package:flutter/cupertino.dart';

class GeneralRadioGrid extends StatefulWidget {
  late int count;

  GeneralRadioGrid(this.count, {super.key});

  @override
  State<GeneralRadioGrid> createState() => _GeneralRadioGridState(count);
}

class _GeneralRadioGridState extends State<GeneralRadioGrid> {
  int _count = 0;

  _GeneralRadioGridState(int count) {
    _count = count;
  }

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      children: [],
    );
  }
}
