abstract class LazyListDataProvider<T> {
  const LazyListDataProvider();

  Future<List<T>> fetched(String query, int startIndex, [int limit]);
}
