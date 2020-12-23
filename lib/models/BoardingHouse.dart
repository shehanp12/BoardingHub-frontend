class BoardingHouse {

  String title = '';
  String subtitle = '';
  String description = '';
  double distance = 0.0;
  double perMonth = 0.0;
  double keyMoney = 0.0;
  List<FireImage> images;

  BoardingHouse(String title,
      String subtitle,
      String description,
      double distance,
     double perMonth,
      double keyMoney,
      List<FireImage> imageList){
    this.title= title;
    this.description=description;
    this.distance=distance;
    this.perMonth=perMonth;
    this.keyMoney=keyMoney;
  }




}


class FireImage {
  String id = '';
  String url = '';

  FireImage(String imgId, String imgUrl) {
    this.id = imgId;
    this.url = imgUrl;
  }
}
