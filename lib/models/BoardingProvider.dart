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
      int id,
      String fullName,
      String email,
      String contactNumber,
      String userName,
      String address,
      String password,
      String createdAt,
      String updatedAt) {
    this.id = id;
    this.fullName = fullName;
    this.email = email;
    this.contactNumber = contactNumber;
    this.userName = userName;
    this.address = address;
    this.password = password;
    this.createdAt = createdAt;
    this.updatedAt = updatedAt;
  }
  int id;
  String fullName;
  String email;
  String contactNumber;
  String userName;
  String address;
  String password;
  String createdAt;
  String updatedAt;

  factory BoardingProvider.fromJson(Map<String, dynamic> json) =>
      BoardingProvider(
        json["id"],
        json["fullName"],
        json["email"],
        json["contactNumber"],
        json["userName"],
        json["address"],
        json["password"],
        json["createdAt"],
        json["updatedAt"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "fullName": fullName,
        "email": email,
        "contactNumber": contactNumber,
        "userName": userName,
        "address": address,
        "password": password,
        "createdAt": createdAt,
        "updatedAt": updatedAt,
      };
}
