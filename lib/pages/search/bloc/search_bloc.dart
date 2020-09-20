import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';

import '../../search_data_provider.dart';
import 'bloc.dart';

class SearchBloc<T> extends Bloc<SearchEvent, SearchState> {
  final SearchDataProvider<T> searchDataProvider;

  SearchBloc({@required this.searchDataProvider})
      : assert(searchDataProvider != null),
        super(const SearchState.initial());

  @override
  Stream<SearchState> mapEventToState(SearchEvent event) async* {
    yield state.copyWith(status: Status.loading);

    try {
      final searchResults =
          await searchDataProvider.getSearchResults(event.query);
      yield state.copyWith(
        status: Status.complete,
        searchResult: searchResults,
      );
    } on Exception {
      yield const SearchState.error();
    }
  }
}
