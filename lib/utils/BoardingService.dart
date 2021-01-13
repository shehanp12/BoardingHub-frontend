import 'package:flutter_app/models/BoardingHouse.dart';
import 'package:flutter_app/models/BoardingProvider.dart';

import 'package:flutter_app/utils/RestService.dart';
import 'package:get/get.dart';

class BoardingService extends GetxController {
  List<BoardingHouse> listData = List<BoardingHouse>().obs;
  List<BoardingProvider> myListData = List<BoardingProvider>().obs;




  var _x;

  get x => _x;

  static get to => Get.find<BoardingService>();


  @override
  void onInit() {
    print(myListData);
    RestService.fetchBoardingdetails();
    RestService.fetchMyDetails();
    super.onInit();
  }
}
