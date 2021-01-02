
import 'dart:convert';

import 'package:flutter_app/models/BoardingHouse.dart';



import 'package:dio/dio.dart';
import 'package:flutter_app/utils/RestService.dart';

class BoardingService{
  final RestService restService = RestService();
  Dio _dio = new Dio();
  Response response;



//  Future<List<BoardingHouse>> getBoarding() async{
//   response = await restService.getBoarding();
//   response.toString();
//   final List parsed = response.data;
//   List<BoardingHouse> boardingHouse = response.data;
// print(boardingHouse);
// return boardingHouse;
//
//
//
//
//   // var responseJson =  json.decode(utf8.decode(response));
//  // return (jsonResponse as List).map((e) =>BoardingHouse ).toList();
// }



}