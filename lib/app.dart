import 'package:flutter/material.dart';
import 'package:flutter_components/pages/animals_page.dart';
import 'pages/fields_page.dart';
import 'pages/home_page.dart';
import 'pages/reactive_form_page.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Компоненты',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: {
        '/': (context) => const HomePage(title: 'Главная'),
        '/search': (context) => const AnimalsPage(),
        '/fields': (context) => const FieldsPage(),
        '/reactive': (context) => const ReactiveFormPage(),
      },
      initialRoute: '/',
    );
  }
}
