
import 'dart:convert';

import 'package:flutter_app/models/BoardingHouse.dart';



import 'package:dio/dio.dart';
import 'package:flutter_app/utils/RestService.dart';

class BoardingService{
  final RestService restService = RestService();
  Dio _dio = new Dio();
  Response response;

 Future<List<BoardingHouse>> getBoarding() async{
  response = await restService.getBoarding();
  print(response.data.toString());

  var jsonResponse = response.data.toString();
  // var responseJson =  json.decode(utf8.decode(response));
 // return (jsonResponse as List).map((e) =>BoardingHouse ).toList();
}



}