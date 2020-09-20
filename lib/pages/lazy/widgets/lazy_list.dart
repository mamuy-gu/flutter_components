import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/bloc.dart';
import '../bloc/lazy_list_bloc.dart';
import 'bottom_loader.dart';

typedef ListItemDelegate<T> = Widget Function(T);

Widget _defaultListItemDelegate<T>(T value) => Text(value.toString());

class LazyList<T> extends StatefulWidget {
  final ListItemDelegate<T> listItemDelegate;

  const LazyList({
    Key key,
    ListItemDelegate<T> listItemDelegate,
  })  : listItemDelegate = listItemDelegate ?? _defaultListItemDelegate,
        super(key: key);

  @override
  _LazyListState<T> createState() => _LazyListState();
}

class _LazyListState<T> extends State<LazyList<T>> {
  final _scrollController = ScrollController();
  final _queryController = TextEditingController();

  LazyListBloc<T> _bloc;

  ListItemDelegate<T> get listItemDelegate => widget.listItemDelegate;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    _bloc = context.bloc<LazyListBloc<T>>();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          decoration: InputDecoration(
            labelText: 'Поиск',
            hintText: 'Введите текст для поиска',
          ),
          controller: _queryController,
          onSubmitted: (value) {
            _bloc.add(LazyListFetched(_queryController.text));
          },
        ),
        Expanded(
          child: BlocBuilder<LazyListBloc<T>, LazyListState>(
            builder: (context, state) {
              switch (state.status) {
                case LazyListStatus.error:
                  return Center(
                    child: Text(state.message),
                  );
                case LazyListStatus.completed:
                  if (state.items.isEmpty) {
                    return const Center(
                      child: Text('Нет данных для отображения'),
                    );
                  }
                  return ListView.builder(
                    itemBuilder: (context, index) {
                      return listItemDelegate(state.items[index]);
                    },
                    itemCount: state.items.length,
                    controller: _scrollController,
                  );
                default:
                  return Container();
              }
            },
          ),
        ),
        BlocBuilder<LazyListBloc<T>, LazyListState>(
          builder: (context, state) {
            if (state.status == LazyListStatus.loading) {
              return const BottomLoader();
            }
            return Container();
          },
        ),
      ],
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  bool get _isBottom {
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;

    return currentScroll >= (maxScroll * 0.9);
  }

  void _onScroll() {
    if (_isBottom) {
      _bloc.add(LazyListFetched(_queryController.text));
    }
  }
}
