import 'package:exam/common/theme/extension/app_theme_extension.dart';
import 'package:exam/modules/person/data/model/output/person.dart';
import 'package:exam/modules/person/presentation/bloc/person_list_bloc.dart';
import 'package:exam/modules/person/presentation/component/person_card.dart';
import 'package:exam/modules/person/presentation/state/person_list_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class PersonGridView extends StatelessWidget {
  const PersonGridView({required this.pageController, super.key});

  final PagingController<int, Person> pageController;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 800),
        child: BlocListener<PersonListBloc, PersonListState>(
          listenWhen: (previous, current) => previous.page != current.page,
          listener: (context, state) {
            if (state.error != null) {
              pageController.error = state.error;
            } else if (!state.hasMore) {
              pageController.appendLastPage(state.persons);
            } else {
              pageController.appendPage(state.persons, state.page);
            }
          },
          child: RefreshIndicator(
            onRefresh: () => Future.sync(pageController.refresh),
            child: PagedGridView<int, Person>(
              pagingController: pageController,
              padding: EdgeInsets.only(
                top: context.layout.paddingMedium,
                left: context.layout.paddingMedium,
                right: context.layout.paddingMedium,
              ),
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
              ),
              builderDelegate: PagedChildBuilderDelegate<Person>(
                itemBuilder: (context, person, index) {
                  return PersonCard.gridView(
                    key: ValueKey(person.id),
                    state: PersonCardUiState(
                      name: person.name,
                      email: person.email,
                      imageUrl: person.image,
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
