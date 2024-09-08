import 'package:equatable/equatable.dart';
import 'package:exam/common/helper/extension/json_extension.dart';
import 'package:flutter/foundation.dart';

@immutable
class Address extends Equatable {
  const Address({
    this.id = 0,
    this.street = '',
    this.streetName = '',
    this.buildingNumber = '',
    this.city = '',
    this.zipCode = '',
    this.country = '',
    this.countryCode = '',
    this.latitude = 0.0,
    this.longitude = 0.0,
  });

  factory Address.fromJson(Map<String, dynamic> json) {
    if (json.isEmpty) {
      return Address.empty;
    }

    return Address(
      id: json.parseInt('id'),
      street: json.parseString('street'),
      streetName: json.parseString('streetName'),
      buildingNumber: json.parseString('buildingNumber'),
      city: json.parseString('city'),
      zipCode: json.parseString('zipcode'),
      country: json.parseString('country'),
      countryCode: json.parseString('county_code'),
      latitude: json.parseDouble('latitude'),
      longitude: json.parseDouble('longitude'),
    );
  }

  static const empty = Address();

  final int id;
  final String street;
  final String streetName;
  final String buildingNumber;
  final String city;
  final String zipCode;
  final String country;
  final String countryCode;
  final double latitude;
  final double longitude;

  @override
  String toString() {
    return '''
      Address(
        id: $id, 
        street: $street,
        streetName: $streetName,
        buildingNumber: $buildingNumber,
        city: $city,
        zipCode: $zipCode,
        country: $country,
        countryCode: $countryCode,
        latitude: $latitude,
        longitude: $longitude,
      )
   ''';
  }

  @override
  List<Object?> get props => [
        id,
        street,
        streetName,
        buildingNumber,
        city,
        zipCode,
        country,
        countryCode,
        latitude,
        longitude,
      ];
}
