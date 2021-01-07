// To parse this JSON data, do
//
//     final boardingProvider = boardingProviderFromJson(jsonString);

import 'dart:convert';

BoardingProvider boardingProviderFromJson(String str) => BoardingProvider.fromJson(json.decode(str));

String boardingProviderToJson(BoardingProvider data) => json.encode(data.toJson());

class BoardingProvider {
  BoardingProvider({
    this.fullName,
    this.email,
    this.contactNumber,
    this.userName,
    this.address,
    this.password,
  });

  String fullName;
  String email;
  String contactNumber;
  String userName;
  String address;
  String password;

  factory BoardingProvider.fromJson(Map<String, dynamic> json) => BoardingProvider(
    fullName: json["fullName"],
    email: json["email"],
    contactNumber: json["contactNumber"],
    userName: json["userName"],
    address: json["address"],
    password: json["password"],
  );

  Map<String, dynamic> toJson() => {
    "fullName": fullName,
    "email": email,
    "contactNumber": contactNumber,
    "userName": userName,
    "address": address,
    "password": password,
  };
}
