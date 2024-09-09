import 'package:exam/common/theme/extension/app_theme_extension.dart';
import 'package:exam/modules/person/data/model/output/person.dart';
import 'package:exam/modules/person/presentation/component/person_avatar.dart';
import 'package:exam/modules/person/presentation/component/person_info_item.dart';
import 'package:exam/modules/person/presentation/component/person_info_section.dart';
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
      body: SingleChildScrollView(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 400),
            child: Padding(
              padding: EdgeInsets.all(context.layout.paddingMedium),
              child: Column(
                children: [
                  PersonAvatar(
                    state: PersonAvatarUiState(
                      imageUrl: person.image,
                      radius: context.layout.radiusLarge,
                    ),
                  ),
                  SizedBox(height: context.layout.spacingMedium),
                  Text(
                    person.name,
                    style: context.textStyle.headline3,
                  ),
                  SizedBox(height: context.layout.spacingMedium),
                  if (!person.gender.isNone) ...[
                    Center(
                      child: PersonInfoItem(
                        state: PersonInfoItemUiState(
                          icon: switch (person.gender) {
                            Gender.male => Icons.male_rounded,
                            Gender.female => Icons.female_rounded,
                            _ => Icons.person,
                          },
                          value: person.gender.name.toUpperCase(),
                        ),
                      ),
                    ),
                    SizedBox(height: context.layout.spacingMedium),
                  ],
                  PersonInfoSection(
                    state: PersonInfoUiState(
                      title: 'Contact Information',
                      items: [
                        PersonInfoItem(
                          state: PersonInfoItemUiState(
                            icon: Icons.email,
                            value: person.email,
                            valueColor: context.colors.interactive,
                          ),
                        ),
                        PersonInfoItem(
                          state: PersonInfoItemUiState(
                            icon: Icons.phone,
                            value: person.phone,
                          ),
                        ),
                        PersonInfoItem(
                          state: PersonInfoItemUiState(
                            icon: Icons.web,
                            value: person.website,
                            valueColor: context.colors.interactive,
                          ),
                        ),
                        // Birthday
                        PersonInfoItem(
                          state: PersonInfoItemUiState(
                            icon: Icons.cake,
                            value: person.formattedBirthday,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: context.layout.spacingMedium),
                  PersonInfoSection(
                    state: PersonInfoUiState(
                      title: 'Address',
                      items: [
                        PersonInfoItem(
                          state: PersonInfoItemUiState(
                            icon: Icons.place_rounded,
                            value: person.address.location,
                          ),
                        ),
                        PersonInfoItem(
                          state: PersonInfoItemUiState(
                            icon: Icons.place_outlined,
                            value: person.address.postalInfo,
                          ),
                        ),
                        PersonInfoItem(
                          state: PersonInfoItemUiState(
                            icon: Icons.my_location_rounded,
                            value: person.address.geoLocation,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
