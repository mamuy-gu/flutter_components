import 'package:equatable/equatable.dart';

class SearchEvent extends Equatable {
  final String query;

  const SearchEvent(this.query);

  @override
  List<Object> get props => [query];

  @override
  bool get stringify => true;
}
