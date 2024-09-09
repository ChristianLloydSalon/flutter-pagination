import 'package:equatable/equatable.dart';
import 'package:exam/modules/person/data/model/output/person.dart';

class PersonListState extends Equatable {
  const PersonListState({
    this.persons = const [],
    this.page = 0,
    this.hasMore = true,
    this.error,
  });

  final List<Person> persons;
  final int page;
  final bool hasMore;
  final Object? error;

  static int get quantity => 20;

  static int get initialPage => 1;

  static int get pageLimit => 4;

  PersonListState copyWith({
    List<Person>? persons,
    int? page,
    bool? hasMore,
    Object? error,
  }) {
    return PersonListState(
      persons: persons ?? this.persons,
      page: page ?? this.page,
      hasMore: hasMore ?? this.hasMore,
      error: error,
    );
  }

  @override
  String toString() {
    return '''
      PersonListState(
        persons: $persons, 
        page: $page, 
        hasMore: $hasMore
        error: $error
      )
    ''';
  }

  @override
  List<Object?> get props => [persons, page, hasMore, error];
}
