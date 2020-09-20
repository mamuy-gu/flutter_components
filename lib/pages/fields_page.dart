import 'package:flutter/material.dart';

import 'app_drawer.dart';
import 'widgets/chip_row_form_field.dart';
import 'widgets/switch_form_field.dart';

class FieldsPage extends StatelessWidget {
  const FieldsPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Поля'),
      ),
      drawer: const AppDrawer(),
      body: MyCustomForm(),
    );
  }
}

class MyCustomForm extends StatefulWidget {
  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

class MyCustomFormState extends State<MyCustomForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Наименование'),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Введите текст';
                  }
                  return null;
                },
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Наименование'),
              ),
              SwitchFormField(
                decoration: InputDecoration(labelText: 'Переключатель'),
                initialValue: true,
                validator: (value) {
                  if (value) {
                    return 'Введите текст';
                  }
                  return null;
                },
              ),
              ChipsRowFormField(
                decoration: InputDecoration(labelText: 'Фамилия'),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Введите текст';
                  }
                  return null;
                },
                initialValue: [
                  /*'Собака',
                  'Кошка',
                  'Енот',
                  'Медведь',
                  'Олень',
                  'Ёж',
                  'Ворона',*/
                ],
              ),
              RaisedButton(
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    Scaffold.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Processing Data'),
                      ),
                    );
                  }
                },
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
