import 'dart:async';

import 'package:bloc/bloc.dart';

import 'bloc.dart';

class SelectionBloc extends Bloc<SelectionEvent, SelectionState> {
  SelectionBloc() : super(SelectionState.initial());

  @override
  Stream<SelectionState> mapEventToState(SelectionEvent event) async* {
    if (event is SelectedItem) {
      yield state.copyWith(selected: {...state.selected, event.item});
    } else if (event is UnselectedItem) {
      yield state.copyWith(selected: state.selected.difference({event.item}));
    } else if (event is LoadedItems) {
      yield state.copyWith(items: event.items);
    }
  }
}
