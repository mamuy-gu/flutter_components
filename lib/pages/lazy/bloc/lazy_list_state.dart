import 'package:equatable/equatable.dart';

enum LazyListStatus { initial, loading, completed, error }

class LazyListState extends Equatable {
  final LazyListStatus status;
  final List<Object> items;
  final String message;
  final String query;

  const LazyListState({this.status, this.items, this.message, this.query});

  const LazyListState.initial()
      : status = LazyListStatus.initial,
        items = const [],
        message = '',
        query = '';

  LazyListState copyWith({
    LazyListStatus status,
    List<Object> items,
    String message,
    String query,
  }) {
    return LazyListState(
      status: status ?? this.status,
      items: items ?? this.items,
      message: message ?? this.message,
      query: query ?? this.query,
    );
  }

  @override
  List<Object> get props => [status, items, message, query];

  @override
  bool get stringify => true;
}
