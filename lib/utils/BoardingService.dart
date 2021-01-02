import 'package:flutter_app/models/BoardingHouse.dart';
import 'package:dio/dio.dart';
import 'package:flutter_app/utils/RestService.dart';

class BoardingService{
  final RestService restService = RestService();
  Dio _dio = new Dio();
  Response response ;
List<BoardingHouse> list = List <BoardingHouse>();

 Future<List<BoardingHouse>> getBoarding() async {

   if(response.statusCode == 200){
     for(var item in response.data){
       list.add(BoardingHouse.fromJson(item));
     }
     return list;
   }


}




}