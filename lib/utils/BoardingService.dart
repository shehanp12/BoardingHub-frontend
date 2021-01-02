
import 'package:flutter_app/models/BoardingHouse.dart';
import 'package:flutter_app/utils/RestService.dart';
import 'package:get/get.dart';
class BoardingService extends GetxController{
  List<BoardingHouse> listData = List <BoardingHouse>().obs;

  var _x;

  get x => _x;

  static get to =>Get.find<BoardingService>();

  @override
  void onInit() {
    RestService.fetchData();
    super.onInit();
  }



}




