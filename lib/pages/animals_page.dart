import 'package:flutter/material.dart';

import '../data_providers_impl/animal_search_data_provider.dart';
import '../entity/animal.dart';
import 'app_drawer.dart';
import 'search/bloc/bloc.dart';
import 'search/delegates/search.dart';

class AnimalsPage extends StatelessWidget {
  const AnimalsPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Поиск'),
      ),
      drawer: const AppDrawer(),
      body: Center(
        child: RaisedButton(
          child: Text('Поиск'),
          onPressed: () async {
            final selected = await showSearch<Iterable<Animal>>(
              context: context,
              delegate: Search(
                searchBloc: SearchBloc(
                  searchDataProvider: AnimalSearchDataProvider(),
                ),
              ),
            );
            print(selected);
          },
        ),
      ),
    );
  }
}
