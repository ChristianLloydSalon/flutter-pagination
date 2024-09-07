import 'package:equatable/equatable.dart';
import 'package:exam/common/helper/extension/json_extension.dart';
import 'package:exam/modules/person/data/model/output/address.dart';
import 'package:flutter/foundation.dart';

@immutable
class Person extends Equatable {
  const Person({
    this.id = 0,
    this.firstName = '',
    this.lastName = '',
    this.email = '',
    this.phone = '',
    this.gender = Gender.none,
    this.birthday,
    this.address = Address.empty,
    this.website = '',
    this.image = '',
  });

  factory Person.fromJson(Map<String, dynamic> json) {
    if (json.isEmpty) {
      return Person.empty;
    }

    return Person(
      id: json.parseInt('id'),
      firstName: json.parseString('firstname'),
      lastName: json.parseString('lastname'),
      email: json.parseString('email'),
      phone: json.parseString('phone'),
      birthday: json.parseDateTime('birthday'),
      address: Address.fromJson(json.parseMap('address')),
      website: json.parseString('website'),
      image: json.parseString('image'),
    );
  }

  static const empty = Person();

  final int id;
  final String firstName;
  final String lastName;
  final String email;
  final String phone;
  final Gender gender;
  final DateTime? birthday;
  final Address address;
  final String website;
  final String image;

  @override
  String toString() {
    return '''
      Person(
        id: $id, 
        firstName: $firstName, 
        lastName: $lastName, 
        email: $email, 
        phone: $phone,
        gender: $gender,
        birthday: $birthday,
        address: $address,
        website: $website,
        image: $image,
      )
   ''';
  }

  @override
  List<Object?> get props => [
        id,
        firstName,
        lastName,
        email,
        phone,
        gender,
        birthday,
        address,
        website,
        image,
      ];
}

enum Gender {
  none,
  male,
  female;

  bool get isNone => this == Gender.none;

  bool get isMale => this == Gender.male;

  bool get isFemale => this == Gender.female;
}
