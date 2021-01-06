import 'dart:convert';
import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/models/BoardingHouse.dart';
import 'package:flutter_app/models/Token.dart';
import 'package:flutter_app/utils/BoardingService.dart';
import 'package:get/get.dart' as a;
import 'package:shared_preferences/shared_preferences.dart';

var _controller = BoardingService.to;

class RestService {
  Dio _dio = new Dio();

  final String host = 'http://192.168.1.107:3000/';

  registerUser(boardingProvider) async {
    return await _dio.post(host + 'boardingProvider/signup', data: {
      "userName": boardingProvider.userName,
      "fullName": boardingProvider.fullName,
      "email": boardingProvider.email,
      "password": boardingProvider.password,
      "address": boardingProvider.address,
      "contactNumber": boardingProvider.contactNumber
    });
  }

  login(email, password) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    var response = await _dio.post(
      host + 'boardingProvider/login',
      data: {"email": email, "password": password},
    );
    print(response.data);

    if (response.statusCode == 200) {
      // print(response.data);
      var responseBody = response.data;
      // print(responseBody);
      // print(responseBody["token"]);
      //
      if (responseBody != null) {
        sharedPreferences.setString("token", response.data["token"]);
      }
    }
    print(sharedPreferences.get("token"));
    return response;
  }

  registerBoarding(boardingHouse) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return await _dio.post(host + 'boardingHouse/register',
        data: {
          "title": boardingHouse.title,
          "subtitle": boardingHouse.subtitle,
          "description": boardingHouse.description,
          "distance": boardingHouse.distance,
          "perMonth": boardingHouse.perMonth,
          "keyMoney": boardingHouse.keyMoney,
          "imageUrl": boardingHouse.imageUrl,
          "checkGirlsOnly": boardingHouse.checkGirlsOnly,
          "checkParkingOnly": boardingHouse.checkParkingOnly,
          "checkAttachBathroom": boardingHouse.checkAttachBathroom,
          "checkKitchen": boardingHouse.checkKitchen
        },
        options: Options(headers: {
          'Authorization': 'Bearer ${sharedPreferences.get("token")}'
        }));
  }

  static Future<List<BoardingHouse>> fetchData() async {
    Future.delayed(
        Duration.zero,
        () => a.Get.dialog(Center(
              child: CircularProgressIndicator(),
            )));

    Dio _dio = Dio();

    Response response =
        await _dio.get('http://192.168.1.107:3000/boardingHouse');
    a.Get.back();

    if (response.statusCode == 200) {
      for (var item in response.data) {
        _controller.listData.add(BoardingHouse.fromJson(item));
      }
      return _controller.listData;
    }
  }
}
