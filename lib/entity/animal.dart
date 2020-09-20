import 'package:equatable/equatable.dart';

class Animal extends Equatable {
  final int id;
  final String name;

  const Animal(this.id, this.name);

  @override
  List<Object> get props => [id, name];

  @override
  bool get stringify => true;
}
