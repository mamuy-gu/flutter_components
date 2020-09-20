enum Status { loading, error, complete, initial }

class SearchState {
  final List<Object> searchResult;
  final List<Object> selected;
  final Status status;

  const SearchState({this.searchResult, this.selected, this.status});

  const SearchState.initial()
      : searchResult = const <Object>[],
        selected = const <Object>[],
        status = Status.initial;

  const SearchState.error()
      : searchResult = const <Object>[],
        selected = const <Object>[],
        status = Status.error;

  SearchState copyWith({
    List<Object> searchResult,
    List<Object> selected,
    Status status,
  }) {
    return SearchState(
      searchResult: searchResult ?? this.searchResult,
      selected: selected ?? this.selected,
      status: status ?? this.status,
    );
  }
}
