import 'package:dio/dio.dart';

class RestService {
  Dio _dio = new Dio();

  final String host = 'http://192.168.8.100:3000/';
  

  registerUser(boardingProvider) async {
    return await _dio.post(host + 'boardingProvider/signUp', data: {
      "fullName": boardingProvider.fullName,
      "email": boardingProvider.email,
      "contactNumber": boardingProvider.contactNumber,
      "username": boardingProvider.userName,
      "address": boardingProvider.address,
      "password": boardingProvider.password
    });
  }

  login(email, password) async {
    return await _dio.post( host + 'boardingProvider/login',
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

  static Future<List<BoardingHouse>> fetchData() async {
    Future.delayed(
      Duration.zero,
        () => a.Get.dialog(Center(child: CircularProgressIndicator(),)
        ));

    Dio _dio = Dio();


    Response response = await _dio.get('http://192.168.1.107:3000/boardingHouse');
    a.Get.back();

    if(response.statusCode == 200){
      for (var item in response.data){
        _controller.listData.add(BoardingHouse.fromJson(item));

      }
      return _controller.listData;
    }


  }

}
