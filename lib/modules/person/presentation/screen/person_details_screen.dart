import 'package:exam/common/theme/extension/app_theme_extension.dart';
import 'package:exam/modules/person/data/model/output/person.dart';
import 'package:exam/modules/person/presentation/component/person_avatar.dart';
import 'package:flutter/material.dart';

class PersonDetailsScreen extends StatelessWidget {
  const PersonDetailsScreen({required this.person, super.key});

  final Person person;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(person.name),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            PersonAvatar(
              state: PersonAvatarUiState(
                imageUrl: person.image,
                radius: context.layout.radiusLarge,
              ),
            ),
            SizedBox(width: context.layout.spacingMedium),
            Text(person.name),
            Row(
              children: [
                const Icon(Icons.email),
                SizedBox(width: context.layout.spacingSmall),
                Text(person.email),
              ],
            ),
            Row(
              children: [
                const Icon(Icons.web),
                SizedBox(width: context.layout.spacingSmall),
                Text(person.website),
              ],
            ),
            Row(
              children: [
                const Icon(Icons.phone),
                SizedBox(width: context.layout.spacingSmall),
                Text(person.phone),
              ],
            ),
            Row(
              children: [
                const Icon(Icons.cake_rounded),
                SizedBox(width: context.layout.spacingSmall),
                Text(person.birthday?.toString() ?? ''),
              ],
            ),
            Row(
              children: [
                Icon(
                  switch (person.gender) {
                    Gender.male => Icons.male_rounded,
                    Gender.female => Icons.female_rounded,
                    Gender.none => Icons.person_2_rounded,
                  },
                ),
                SizedBox(width: context.layout.spacingSmall),
                Text(person.gender.name.toUpperCase()),
              ],
            ),
            Row(
              children: [
                const Icon(Icons.location_on),
                SizedBox(width: context.layout.spacingSmall),
                Text(person.address.toString()),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
