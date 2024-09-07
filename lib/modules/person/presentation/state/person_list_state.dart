import 'package:equatable/equatable.dart';
import 'package:exam/modules/person/data/model/output/person.dart';

class PersonListState extends Equatable {
  const PersonListState({
    this.status = PersonListStatus.initial,
    this.persons = const [],
    this.page = 0,
    this.hasMore = true,
  });

  final PersonListStatus status;
  final List<Person> persons;
  final int page;
  final bool hasMore;

  static int get quantity => 10;

  static int get initialPage => 1;

  static int get pageLimit => 4;

  PersonListState copyWith({
    PersonListStatus? status,
    List<Person>? persons,
    int? page,
    bool? hasMore,
  }) {
    return PersonListState(
      status: status ?? this.status,
      persons: persons ?? this.persons,
      page: page ?? this.page,
      hasMore: hasMore ?? this.hasMore,
    );
  }

  @override
  String toString() {
    return '''
      PersonListState(
        status: $status, 
        persons: $persons, 
        page: $page, 
        hasMore: $hasMore
      )
    ''';
  }

  @override
  List<Object?> get props => [status, persons, page, hasMore];
}

enum PersonListStatus {
  initial,
  loading,
  loaded,
  error;

  bool get isInitial => this == PersonListStatus.initial;

  bool get isLoading => this == PersonListStatus.loading;

  bool get isLoaded => this == PersonListStatus.loaded;

  bool get isError => this == PersonListStatus.error;
}
