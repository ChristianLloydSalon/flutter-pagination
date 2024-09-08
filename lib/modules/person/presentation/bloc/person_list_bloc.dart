import 'package:exam/common/core/app_logger.dart';
import 'package:exam/common/helper/event_transformer/event_transformer.dart';
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
    on<PersonListRequested>(_onPersonListRequested, transformer: restartable());
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
      if (!state.hasMore) return;

      final persons = await repository.fetchPersons(
        input: PersonPaginationInput(
          quantity: PersonListState.quantity,
        ),
      );

      emit(
        state.copyWith(
          persons: refresh ? persons : [...state.persons, ...persons],
          page: refresh ? PersonListState.initialPage : state.page + 1,
          hasMore: refresh ? true : state.page < PersonListState.pageLimit,
        ),
      );
    } catch (error, stackTrace) {
      logError(error.toString(), error, stackTrace);
      emit(state.copyWith(error: error));
    }
  }
}
