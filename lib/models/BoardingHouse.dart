class BoardingHouse {

  String title = '';
  String subtitle = '';
  String description = '';
  double distance = 0.0;
  double perMonth = 0.0;
  double keyMoney = 0.0;
  String imageUrl = '';
  bool checkGirlsOnly= false;
  bool checkParkingOnly = false;
  bool checkAttachBathroom = false;
  bool checkKitchen = false;

  BoardingHouse(String title,
      String subtitle,
      String description,
      double distance,
     double perMonth,
      double keyMoney,
      String imageUrl,
      bool checkGirlsOnly,
      bool checkParkingOnly,
      bool checkAttachBathroom,
      bool checkKitchen



      ){
    this.title= title;
    this.description=description;
    this.distance=distance;
    this.perMonth=perMonth;
    this.keyMoney=keyMoney;
    this.imageUrl= imageUrl;
    this.checkGirlsOnly=checkGirlsOnly;
    this.checkParkingOnly=checkParkingOnly;
    this.checkAttachBathroom=checkAttachBathroom;
    this.checkKitchen=checkKitchen;
  }




}


// class FireImage {
//   String id = '';
//   String url = '';
//
//   FireImage(String imgId, String imgUrl) {
//     this.id = imgId;
//     this.url = imgUrl;
//   }
// }
