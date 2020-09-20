import 'package:flutter/material.dart';

class ChipsRow extends StatelessWidget {
  final List<String> items;
  final GestureTapCallback onTap;

  const ChipsRow({Key key, this.items, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: items.map((item) => Chip(label: Text(item))).toList(),
        ),
      ),
    );
  }
}
