import '../data_providers/lazy_list_data_provider.dart';
import '../data_providers/search_data_provider.dart';
import '../entity/animal.dart';

class AnimalSearchDataProvider
    implements SearchDataProvider<Animal>, LazyListDataProvider<Animal> {
  const AnimalSearchDataProvider();

  @override
  Future<List<Animal>> getSearchResults(String query) async {
    return [
      Animal(1, 'Cat'),
      Animal(2, 'Dog'),
      Animal(3, 'Elephant'),
      Animal(4, 'Horse'),
      Animal(5, 'Tiger'),
      Animal(6, 'Lion'),
    ];
  }

  @override
  Future<List<Animal>> fetched(
    String query,
    int startIndex, [
    int limit = 5,
  ]) async {
    const list = [
      Animal(1, 'Cat'),
      Animal(2, 'Dog'),
      Animal(3, 'Elephant'),
      Animal(4, 'Horse'),
      Animal(5, 'Tiger'),
      Animal(6, 'Lion'),
      Animal(7, 'Rabbit'),
      Animal(8, 'Monkey'),
      Animal(9, 'Zebra'),
      Animal(10, 'Rat'),
      Animal(11, 'Worm'),
      Animal(12, 'Fish'),
      Animal(13, 'Donkey'),
      Animal(14, 'Cow'),
      Animal(15, 'Turkey'),
      Animal(16, 'Eagle'),
      Animal(17, 'Bear'),
      Animal(18, 'Wolf'),
      Animal(19, 'Fox'),
      Animal(20, 'Frog'),
    ];
    final sortList = list
        .where((element) =>
            element.name.toLowerCase().contains(query.toLowerCase()))
        .toList();

    final end = startIndex + limit;
    final realEnd = end > sortList.length ? sortList.length : end;

    await Future.delayed(Duration(seconds: 2));
    return sortList.sublist(startIndex, realEnd);
  }
}
