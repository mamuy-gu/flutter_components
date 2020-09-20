import 'package:flutter/material.dart';

typedef OnSelectCallback = void Function(Object);
typedef OnUnSelectCallback = void Function(Object);

class SelectedItemList extends StatelessWidget {
  final List<Object> items;
  final List<Object> selectedItems;
  final OnSelectCallback onSelected;
  final OnUnSelectCallback onUnselected;

  const SelectedItemList({
    Key key,
    @required this.items,
    @required this.selectedItems,
    @required this.onSelected,
    @required this.onUnselected,
  })  : assert(items != null),
        assert(selectedItems != null),
        assert(onSelected != null),
        assert(onUnselected != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: ListView.builder(
        itemBuilder: (context, index) {
          final item = items[index];
          return CheckboxListTile(
            title: Text(item.toString()),
            value: selectedItems.contains(item),
            onChanged: (value) =>
                (value) ? onSelected(item) : onUnselected(item),
          );
        },
        itemCount: items.length,
      ),
    );
  }
}
