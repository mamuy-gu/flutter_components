abstract class SearchDataProvider<T> {
  const SearchDataProvider();

  Future<List<T>> getSearchResults(String query);
}