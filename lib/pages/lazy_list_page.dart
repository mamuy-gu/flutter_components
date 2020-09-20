import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../data_providers_impl/animal_search_data_provider.dart';
import '../entity/animal.dart';
import 'app_drawer.dart';
import 'lazy/bloc/bloc.dart';
import 'lazy/widgets/lazy_list.dart';

class LazyListPage extends StatelessWidget {
  const LazyListPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ленивая загрузка'),
      ),
      drawer: const AppDrawer(),
      body: BlocProvider(
        create: (context) => LazyListBloc(
          searchDataProvider: AnimalSearchDataProvider(),
        ),
        child: LazyList<Animal>(listItemDelegate: (value) {
          return CheckboxListTile(
            title: Text(value.toString()),
            value: true,
            onChanged: (value) => null,
          );
        }),
      ),
    );
  }
}
