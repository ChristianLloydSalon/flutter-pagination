import 'package:exam/common/component/custom_refresh_indicator.dart';
import 'package:exam/common/theme/extension/app_theme_extension.dart';
import 'package:exam/modules/person/data/di/person_service_locator.dart';
import 'package:exam/modules/person/data/model/output/person.dart';
import 'package:exam/modules/person/presentation/bloc/person_list_bloc.dart';
import 'package:exam/modules/person/presentation/component/no_more_items_spiel.dart';
import 'package:exam/modules/person/presentation/component/person_card.dart';
import 'package:exam/modules/person/presentation/component/person_list_bloc_listener.dart';
import 'package:exam/modules/person/presentation/event/person_list_event.dart';
import 'package:exam/modules/person/presentation/screen/person_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class PersonMobileView extends StatelessWidget {
  const PersonMobileView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PersonListBloc>(
      create: (_) => PersonListBloc(personRepository),
      child: const _PersonMobileViewContent(),
    );
  }
}

class _PersonMobileViewContent extends StatefulWidget {
  const _PersonMobileViewContent();

  @override
  State<_PersonMobileViewContent> createState() =>
      __PersonMobileViewContentState();
}

class __PersonMobileViewContentState extends State<_PersonMobileViewContent> {
  final PagingController<int, Person> _pageController =
      PagingController(firstPageKey: 1);

  @override
  void initState() {
    super.initState();
    _pageController.addPageRequestListener((pageKey) {
      context.read<PersonListBloc>().add(const PersonListRequested());
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  Future<void> _onRefresh() async {
    await Future.sync(() {
      _pageController.refresh();
      context.read<PersonListBloc>().add(const PersonListRefreshed());
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomRefreshIndicator(
      onRefresh: _onRefresh,
      child: PersonListBlocListener(
        pagingController: _pageController,
        child: PagedListView<int, Person>.separated(
          pagingController: _pageController,
          physics: const AlwaysScrollableScrollPhysics(),
          separatorBuilder: (_, __) => const SizedBox(height: 8),
          padding: EdgeInsets.all(context.layout.paddingMedium),
          builderDelegate: PagedChildBuilderDelegate<Person>(
            noMoreItemsIndicatorBuilder: (_) =>
                const Center(child: NoMoreItemsSpiel()),
            itemBuilder: (context, person, index) {
              return PersonCard.listView(
                key: ValueKey(person.id),
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
    );
  }
}
