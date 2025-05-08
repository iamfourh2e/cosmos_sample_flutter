import 'package:json_annotation/json_annotation.dart';
part 'user.g.dart';
@JsonSerializable()
class Address {
  final String city;
  final String country;

  Address({required this.city, required this.country});

  factory Address.fromJson(Map<String, dynamic> json) => _$AddressFromJson(json);
  Map<String, dynamic> toJson() => _$AddressToJson(this);
}

@JsonSerializable()
class User {
  final String name;
  final int age;
  final Address address;

  User({required this.name, required this.age, required this.address});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}