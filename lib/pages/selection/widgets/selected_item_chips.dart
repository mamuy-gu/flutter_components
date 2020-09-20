import 'package:flutter/material.dart';

typedef OnDeletedCallback = void Function(Object);

class SelectedItemChips extends StatelessWidget {
  final List<Object> selectedItems;
  final OnDeletedCallback onDeleted;

  const SelectedItemChips({
    Key key,
    @required this.selectedItems,
    @required this.onDeleted,
  })  : assert(selectedItems != null),
        assert(onDeleted != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: selectedItems
            .map(
              (item) => Chip(
                label: Text(item.toString()),
                onDeleted: () => onDeleted(item),
              ),
            )
            .toList(),
      ),
    );
  }
}
