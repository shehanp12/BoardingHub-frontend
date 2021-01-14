// To parse this JSON data, do
//
//     final boardingProvider = boardingProviderFromJson(jsonString);

import 'dart:convert';

BoardingProvider boardingProviderFromJson(String str) =>
    BoardingProvider.fromJson(json.decode(str));

String boardingProviderToJson(BoardingProvider data) =>
    json.encode(data.toJson());

class BoardingProvider {
  BoardingProvider(

      String fullName,
      String email,
      String contactNumber,
      String userName,
      String address,
      String password,

      ) {

    this.fullName = fullName;
    this.email = email;
    this.contactNumber = contactNumber;
    this.userName = userName;
    this.address = address;
    this.password = password;

  }

  String fullName;
  String email;
  String contactNumber;
  String userName;
  String address;
  String password;


  factory BoardingProvider.fromJson(Map<String, dynamic> json) =>
      BoardingProvider(

        json["fullName"],
        json["email"],
        json["contactNumber"],
        json["userName"],
        json["address"],
        json["password"]

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
