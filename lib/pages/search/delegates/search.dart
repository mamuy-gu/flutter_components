import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../selection/bloc/bloc.dart';
import '../../selection/widgets/selection_list.dart';
import '../bloc/bloc.dart';

class Search<T> extends SearchDelegate<Iterable<T>> {
  final SearchBloc<T> searchBloc;
  final selectionBloc = SelectionBloc();

  Search({@required this.searchBloc}) : assert(searchBloc != null);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
      IconButton(
        icon: Icon(Icons.done),
        onPressed: () => close(context, selectionBloc.state.selected),
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    searchBloc.add(SearchEvent(query));
    return BlocBuilder<SearchBloc, SearchState>(
      cubit: searchBloc,
      builder: (context, state) {
        if (state.status == Status.loading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state.status == Status.error) {
          return Container(
            child: Text('Ошибка'),
          );
        }
        return BlocProvider.value(
          value: selectionBloc..add(LoadedItems(state.searchResult.toSet())),
          child: const SelectionList(),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) => Container();

  @override
  void close(BuildContext context, Iterable result) {
    selectionBloc.close();
    super.close(context, result);
  }
}
