

import 'package:dio/dio.dart';


class RestService {

  Dio _dio  = new Dio();

  final String host = 'http://192.168.8.172:5000/api/';

   registerUser(boardingProvider) async{

       return await _dio.post(host+'user/register',data: {
         "username":boardingProvider.username,
         "fullName":boardingProvider.fullName,
         "email":boardingProvider.email,
         "password":boardingProvider.password

       }

       );


   }



}

