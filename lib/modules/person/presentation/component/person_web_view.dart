import 'package:exam/common/theme/extension/app_theme_extension.dart';
import 'package:exam/modules/person/data/di/person_service_locator.dart';
import 'package:exam/modules/person/data/model/output/person.dart';
import 'package:exam/modules/person/presentation/bloc/person_list_bloc.dart';
import 'package:exam/modules/person/presentation/component/person_card.dart';
import 'package:exam/modules/person/presentation/event/person_list_event.dart';
import 'package:exam/modules/person/presentation/screen/person_details_screen.dart';
import 'package:exam/modules/person/presentation/state/person_list_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class PersonWebView extends StatefulWidget {
  const PersonWebView({super.key});

  @override
  State<PersonWebView> createState() => _PersonWebViewState();
}

class _PersonWebViewState extends State<PersonWebView> {
  final PagingController<int, Person> _pageController =
      PagingController(firstPageKey: 1);

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PersonListBloc>(
      create: (_) =>
          PersonListBloc(personRepository)..add(const PersonListRequested()),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 800),
          child: BlocListener<PersonListBloc, PersonListState>(
            listener: (context, state) {
              if (state.error != null) {
                _pageController.error = state.error;
              } else if (!state.hasMore) {
                _pageController.appendLastPage(state.persons);
              } else {
                _pageController.appendPage(state.persons, state.page);
              }
            },
            child: PagedGridView(
              pagingController: _pageController,
              padding: EdgeInsets.all(context.layout.paddingMedium),
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
              ),
              builderDelegate: PagedChildBuilderDelegate<Person>(
                newPageProgressIndicatorBuilder: (context) {
                  return const _SeeMoreButton();
                },
                itemBuilder: (context, person, index) {
                  return PersonCard.gridView(
                    state: PersonCardUiState(
                      name: person.name,
                      email: person.email,
                      imageUrl: person.image,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return PersonDetailsScreen(person: person);
                          },
                        ),
                      );
                    },
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

class _SeeMoreButton extends StatelessWidget {
  const _SeeMoreButton();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () =>
          context.read<PersonListBloc>().add(const PersonListRequested()),
      child: Card(
        child: Center(
          child: Text(
            'Load more',
            style: context.textStyle.body2,
          ),
        ),
      ),
    );
  }
}
