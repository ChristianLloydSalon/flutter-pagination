import 'package:equatable/equatable.dart';

abstract class PersonListEvent extends Equatable {
  const PersonListEvent();

  @override
  List<Object?> get props => [];
}

class PersonListRequested extends PersonListEvent {
  const PersonListRequested();
}

class PersonListRefreshed extends PersonListEvent {
  const PersonListRefreshed();
}
