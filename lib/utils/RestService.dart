import 'package:dio/dio.dart';
import 'package:flutter_app/models/BoardingHouse.dart';

class RestService {
  Dio _dio = new Dio();

  final String host = 'http://192.168.8.172:3000/';

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
        "checkGirlsOnly":boardingHouse.checkGirlsOnly
    }
    );


  }
}
