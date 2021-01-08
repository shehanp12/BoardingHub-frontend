import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/models/BoardingHouse.dart';
import 'package:flutter_app/utils/BoardingService.dart';
 import 'package:get/get.dart' as a;


var _controller = BoardingService.to;

class RestService {
  Dio _dio = new Dio();

  final String host = 'http://192.168.8.102:3000/';

  registerUser(boardingProvider) async {
    return await _dio.post(host + 'user/register', data: {
      "username": boardingProvider.username,
      "fullName": boardingProvider.fullName,
      "email": boardingProvider.email,
      "password": boardingProvider.password
    });
  }



  login(email, password) async {
    return await _dio.post(host + 'employee/login',
        data: {"email": email, "password": password});
  }

  registerBoarding(boardingHouse) async{
    return await _dio.post(host+'boardingHouse/register',
      data: {
      "title":boardingHouse.title,
        "subtitle":boardingHouse.subtitle,
        "description":boardingHouse.description,
        "distance":boardingHouse.distance,
        "perMonth":boardingHouse.perMonth,
        "keyMoney":boardingHouse.keyMoney,
        "imageUrl":boardingHouse.imageUrl,
        "checkGirlsOnly":boardingHouse.checkGirlsOnly,
        "checkParkingOnly":boardingHouse.checkParkingOnly,
        "checkAttachBathroom":boardingHouse.checkAttachBathroom,
        "checkKitchen":boardingHouse.checkKitchen,
        "userId":4

    }
    );
}

  static Future<List<BoardingHouse>> fetchData() async {
    Future.delayed(
      Duration.zero,
        () => a.Get.dialog(Center(child: CircularProgressIndicator(),)
        ));

    Dio _dio = Dio();


    Response response = await _dio.get('http://192.168.8.102:3000/boardingHouse');
    a.Get.back();

    if(response.statusCode == 200){
      for (var item in response.data){
        _controller.listData.add(BoardingHouse.fromJson(item));

      }
      return _controller.listData;
    }


  }







}
