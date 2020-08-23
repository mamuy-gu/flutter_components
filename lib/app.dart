import 'package:flutter/material.dart';
import 'package:flutter_components/pages/home_page.dart';

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
        '/': (BuildContext context) => const HomePage(title: 'Главная'),
      },
      initialRoute: '/',
    );
  }
}
