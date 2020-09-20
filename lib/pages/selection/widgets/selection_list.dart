import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/bloc.dart';
import 'selected_item_chips.dart';
import 'selected_item_list.dart';

class SelectionList extends StatelessWidget {
  const SelectionList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SelectionBloc, SelectionState>(
      builder: (context, state) {
        return Column(
          children: [
            SelectedItemChips(
              selectedItems: state.selected.toList(),
              onDeleted: (item) {
                context.bloc<SelectionBloc>().add(UnselectedItem(item));
              },
            ),
            SelectedItemList(
              items: state.items.toList(),
              selectedItems: state.selected.toList(),
              onSelected: (item) {
                context.bloc<SelectionBloc>().add(SelectedItem(item));
              },
              onUnselected: (item) {
                context.bloc<SelectionBloc>().add(UnselectedItem(item));
              },
            ),
          ],
        );
      },
    );
  }
}
