abstract class LazyListEvent {
  const LazyListEvent();
}

class LazyListFetched extends LazyListEvent {
  final String query;

  const LazyListFetched(this.query);
}