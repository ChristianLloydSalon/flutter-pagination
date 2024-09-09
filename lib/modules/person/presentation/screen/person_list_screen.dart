import 'package:exam/modules/person/presentation/component/person_mobile_view.dart';
import 'package:exam/modules/person/presentation/component/person_web_view.dart';
import 'package:exam/modules/person/presentation/component/theme_mode_switch.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class PersonListScreen extends StatelessWidget {
  const PersonListScreen({super.key});

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
      body: kIsWeb ? const PersonWebView() : const PersonMobileView(),
    );
  }
}
