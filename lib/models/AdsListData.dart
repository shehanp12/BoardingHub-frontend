class AdsListData {
  AdsListData({
    this.imagePath = '',
    this.titleTxt = '',
    this.subTxt = "",
    this.dist = 1.8,
    this.reviews = 80,
    this.rating = 4.5,
    this.perMounth = 180,
  });

  String imagePath;
  String titleTxt;
  String subTxt;
  double dist;
  double rating;
  int reviews;
  int perMounth;

  // static List<AdsListData> adList = <AdsListData>[
  //   AdsListData(
  //     imagePath: 'images/room1.jpeg',
  //     titleTxt: 'Bedrooms',
  //     subTxt: 'pitipana,homagama',
  //     dist: 2.0,
  //     reviews: 80,
  //     rating: 4.4,
  //     perMounth: 50,
  //   ),
  //   AdsListData(
  //     imagePath: 'images/room2.jpeg',
  //     titleTxt: 'Rooms',
  //     subTxt: 'kaduwela, London',
  //     dist: 4.0,
  //     reviews: 74,
  //     rating: 4.5,
  //     perMounth: 200,
  //   ),
  //   /*AdsListData(
  //     imagePath: 'assets/hotel/hotel_3.png',
  //     titleTxt: 'Grand Royal Hotel',
  //     subTxt: 'Wembley, London',
  //     dist: 3.0,
  //     reviews: 62,
  //     rating: 4.0,
  //     perMounth: 60,
  //   ),
  //   AdsListData(
  //     imagePath: 'assets/hotel/hotel_4.png',
  //     titleTxt: 'Queen Hotel',
  //     subTxt: 'Wembley, London',
  //     dist: 7.0,
  //     reviews: 90,
  //     rating: 4.4,
  //     perMounth: 170,
  //   ),
  //   AdsListData(
  //     imagePath: 'assets/hotel/hotel_5.png',
  //     titleTxt: 'Grand Royal Hotel',
  //     subTxt: 'Wembley, London',
  //     dist: 2.0,
  //     reviews: 240,
  //     rating: 4.5,
  //     perMounth: 200,
  //   ),*/
  // ];
}
