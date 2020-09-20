class SelectionState {
  final Set<Object> items;
  final Set<Object> selected;

  const SelectionState({Set<Object> items, Set<Object> selected})
      : items = items ?? const <Object>{},
        selected = selected ?? const <Object>{};

  const SelectionState.initial()
      : items = const <Object>{},
        selected = const <Object>{};

  SelectionState copyWith({Set<Object> items, Set<Object> selected}) {
    return SelectionState(
      items: items ?? this.items,
      selected: selected ?? this.selected,
    );
  }
}
