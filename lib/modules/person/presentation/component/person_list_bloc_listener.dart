import 'package:exam/modules/person/data/model/output/person.dart';
import 'package:exam/modules/person/presentation/bloc/person_list_bloc.dart';
import 'package:exam/modules/person/presentation/state/person_list_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class PersonListBlocListener extends StatelessWidget {
  const PersonListBlocListener({
    required this.pagingController,
    required this.child,
    super.key,
  });

  final PagingController<int, Person> pagingController;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocListener<PersonListBloc, PersonListState>(
      listener: (context, state) {
        if (state.error != null) {
          pagingController.error = state.error;
        } else if (!state.hasMore) {
          pagingController.appendLastPage(state.persons);
        } else {
          pagingController.appendPage(state.persons, state.page);
        }
      },
      child: child,
    );
  }
}
