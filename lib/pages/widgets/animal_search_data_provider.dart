import '../../entity/animal.dart';
import '../search_data_provider.dart';

class AnimalSearchDataProvider extends SearchDataProvider<Animal> {
  const AnimalSearchDataProvider() : super();

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
}
