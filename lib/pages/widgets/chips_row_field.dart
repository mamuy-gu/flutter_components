import 'package:flutter/material.dart';

import 'chips_row.dart';

class ChipsRowFiled extends StatelessWidget {
  final InputDecoration decoration;

  const ChipsRowFiled({Key key, InputDecoration decoration})
      : decoration = decoration ?? const InputDecoration(),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return InputDecorator(
      decoration: decoration,
      isEmpty: true,
      child: ChipsRow(
        items: [],
        onTap: () => {},
      ),
    );
  }
}
