import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';

part 'user.g.dart';

@freezed
abstract class Geo with _$Geo {
  const factory Geo({String lat, String lng}) = _Geo;
  factory Geo.fromJson(Map<String, dynamic> json) => _$GeoFromJson(json);
}

@freezed
abstract class Company with _$Company {
  const factory Company({String name, String catchPhrase, String bs}) =
      _Company;
  factory Company.fromJson(Map<String, dynamic> json) => _$CompanyFromJson(json);
}

@freezed
abstract class Address with _$Address {
  const factory Address(
      {String street, String suite, String zipcode, Geo geo}) = _Address;

  factory Address.fromJson(Map<String, dynamic> json) => _$AddressFromJson(json);
}

@freezed
abstract class User with _$User {
  const factory User(
      {int id,
      String name,
      String username,
      String email,
      String phone,
      String website,
      Address address,
      Company company}) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
