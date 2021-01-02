class BoardingHouse {
  BoardingHouse(
      String title,
      String subtitle,
      String description,
      double distance,
      double perMonth,
      double keyMoney,
      String imageUrl,
      bool checkGirlsOnly,
      bool checkParkingOnly,
      bool checkAttachBathroom,
      bool checkKitchen) {
    this.title = title;
    this.subtitle = subtitle;
    this.description = description;
    this.distance = distance;
    this.perMonth = perMonth;
    this.keyMoney = keyMoney;
    this.imageUrl = imageUrl;
    this.checkGirlsOnly = checkGirlsOnly;
    this.checkParkingOnly = checkParkingOnly;
    this.checkAttachBathroom = checkAttachBathroom;
    this.checkKitchen = checkKitchen;
  }

  String title = '';
  String subtitle = '';
  String description = '';
  double distance = 0.0;
  double perMonth = 0.0;
  double keyMoney = 0.0;
  String imageUrl = '';
  bool checkGirlsOnly = false;
  bool checkParkingOnly = false;
  bool checkAttachBathroom = false;
  bool checkKitchen = false;

  factory BoardingHouse.fromJson(Map<String, dynamic> json) => BoardingHouse(
      json["title"],
      json["subtitle"],
      json["description"],
      json["distance"].toDouble(),
      json["perMonth"].toDouble(),
      json["keyMoney"],
      json["imageUrl"],
      json["checkGirlsOnly"],
      json["checkParkingOnly"] == null ? null : json["checkParkingOnly"],
      json["checkAttachBathroom"] == null ? null : json["checkAttachBathroom"],
      json["checkKitchen"] == null ? null : json["checkKitchen"]);

  Map<String, dynamic> toJson() => {
        "title": title,
        "subtitle": subtitle,
        "description": description,
        "distance": distance,
        "perMonth": perMonth,
        "keyMoney": keyMoney,
        "imageUrl": imageUrl,
        "checkGirlsOnly": checkGirlsOnly,
        "checkParkingOnly": checkParkingOnly == null ? null : checkParkingOnly,
        "checkAttachBathroom":
            checkAttachBathroom == null ? null : checkAttachBathroom,
        "checkKitchen": checkKitchen == null ? null : checkKitchen,
      };
}
