import 'package:dio/dio.dart';

class RestService {
  Dio _dio = new Dio();

  final String host = 'http://192.168.8.100:3000/';
  

  registerUser(boardingProvider) async {
    return await _dio.post(host + 'provider/signUp', data: {
      "fullName": boardingProvider.fullName,
      "email": boardingProvider.email,
      "contactNumber": boardingProvider.contactNumber,
      "username": boardingProvider.userName,
      "address": boardingProvider.address,
      "password": boardingProvider.password
    });
  }

  login(email, password) async {
    return await _dio.post( host + 'employee/login',
        data: {"email": email, 
               "password": password
                });
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

}
