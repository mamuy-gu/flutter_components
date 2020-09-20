abstract class SelectionEvent {
  const SelectionEvent();
}

class SelectedItem extends SelectionEvent {
  final Object item;

  const SelectedItem(this.item);
}

class UnselectedItem extends SelectionEvent {
  final Object item;

  const UnselectedItem(this.item);
}

class LoadedItems extends SelectionEvent {
  final Set<Object> items;

  const LoadedItems(this.items);
}
