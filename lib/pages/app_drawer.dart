import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text('Компоненты'),
            decoration: BoxDecoration(color: Colors.blue),
          ),
          ListTile(
            title: Text('Главная'),
            onTap: () => Navigator.of(context).pushReplacementNamed('/'),
          ),
          ListTile(
            title: Text('Поиск'),
            onTap: () => Navigator.of(context).pushReplacementNamed('/search'),
          ),
          ListTile(
            title: Text('Поля'),
            onTap: () => Navigator.of(context).pushReplacementNamed('/fields'),
          ),
          ListTile(
            title: Text('Реактивная форма'),
            onTap: () =>
                Navigator.of(context).pushReplacementNamed('/reactive'),
          ),
          ListTile(
            title: Text('Ленивая загрузка'),
            onTap: () =>
                Navigator.of(context).pushReplacementNamed('/lazy'),
          ),
        ],
      ),
    );
  }
}
