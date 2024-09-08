import 'package:exam/common/theme/layout/screen_size.dart';
import 'package:exam/modules/person/data/model/output/person.dart';
import 'package:exam/modules/person/presentation/bloc/person_list_bloc.dart';
import 'package:exam/modules/person/presentation/component/person_grid_view.dart';
import 'package:exam/modules/person/presentation/component/person_list_view.dart';
import 'package:exam/modules/person/presentation/component/theme_mode_switch.dart';
import 'package:exam/modules/person/presentation/event/person_list_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class PersonListScreen extends StatefulHookWidget {
  const PersonListScreen({super.key});

  @override
  State<PersonListScreen> createState() => _PersonListScreenState();
}

class _PersonListScreenState extends State<PersonListScreen> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Person List'),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 100),
              child: const ThemeModeSwitch(),
            ),
          ),
        ],
      ),
      body: context.isMobile
          ? PersonListView(pageController: _pageController)
          : PersonGridView(pageController: _pageController),
    );
  }
}
