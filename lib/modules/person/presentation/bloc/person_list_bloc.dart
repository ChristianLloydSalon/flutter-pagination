import 'package:exam/common/core/app_logger.dart';
import 'package:exam/modules/person/data/model/input/person_pagination_input.dart';
import 'package:exam/modules/person/data/repository/person_repository_interface.dart';
import 'package:exam/modules/person/presentation/event/person_list_event.dart';
import 'package:exam/modules/person/presentation/state/person_list_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PersonListBloc extends Bloc<PersonListEvent, PersonListState>
    with AppLogger {
  PersonListBloc(this.repository)
      : super(PersonListState(page: PersonListState.initialPage)) {
    on<PersonListRefreshed>(_onPersonListRefreshed);
    on<PersonListRequested>(_onPersonListRequested);
  }

  final PersonRepositoryInterface repository;

  Future<void> _onPersonListRefreshed(
    PersonListRefreshed event,
    Emitter<PersonListState> emit,
  ) async {
    await _loadPerson(refresh: true, emit: emit);
  }

  Future<void> _onPersonListRequested(
    PersonListRequested event,
    Emitter<PersonListState> emit,
  ) async {
    await _loadPerson(emit: emit);
  }

  Future<void> _loadPerson({
    bool refresh = false,
    required Emitter<PersonListState> emit,
  }) async {
    try {
      if (state.page >= PersonListState.pageLimit) return;

      emit(state.copyWith(status: PersonListStatus.loading));

      final page = refresh ? PersonListState.initialPage : state.page;
      final quantity = PersonListState.quantity +
          (refresh ? 0 : PersonListState.quantity * page);

      final persons = await repository.fetchPersons(
        input: PersonPaginationInput(
          quantity: quantity,
          seed: PersonListState.quantity,
        ),
      );

      emit(
        state.copyWith(
          status: PersonListStatus.loaded,
          persons: refresh ? persons : [...state.persons, ...persons],
          page: page,
          hasMore: state.persons.length % PersonListState.quantity == 0,
        ),
      );

      emit(state.copyWith(status: PersonListStatus.initial));
    } catch (error, stackTrace) {
      logError(error.toString(), error, stackTrace);
      emit(state.copyWith(status: PersonListStatus.error));
      emit(state.copyWith(status: PersonListStatus.initial));
    }
  }
}
