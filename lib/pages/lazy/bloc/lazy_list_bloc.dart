import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';

import '../../../data_providers/lazy_list_data_provider.dart';
import 'bloc.dart';

class LazyListBloc<T> extends Bloc<LazyListEvent, LazyListState> {
  final LazyListDataProvider<T> searchDataProvider;

  LazyListBloc({@required this.searchDataProvider})
      : assert(searchDataProvider != null),
        super(const LazyListState.initial());

  @override
  Stream<LazyListState> mapEventToState(LazyListEvent event) async* {
    if (event is LazyListFetched) {
      final isOldQuery = (event.query == state.query);
      final startIndex = isOldQuery ? state.items?.length ?? 0 : 0;
      final items = isOldQuery ? state.items : const [];

      yield* _loadItems(event.query, startIndex, items);
    }
  }

  Stream<LazyListState> _loadItems(
    String query,
    int startIndex,
    List<Object> currentItems,
  ) async* {
    yield state.copyWith(status: LazyListStatus.loading, query: query);
    try {
      final result = await searchDataProvider.fetched(query, startIndex);
      yield state.copyWith(
        status: LazyListStatus.completed,
        items: currentItems + result,
      );
    } on Exception catch (e) {
      yield state.copyWith(
        status: LazyListStatus.error,
        message: e.toString(),
      );
    }
  }
}
