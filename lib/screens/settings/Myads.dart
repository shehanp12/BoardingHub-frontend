import 'package:flutter/material.dart';
import 'package:flutter_app/shared/Category.dart';
import 'package:flutter_app/shared/Colors.dart';

class MyadScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new MyadScreenState();
}

class MyadScreenState extends State<MyadScreen> {

  List<Myad> categories = new List();

  @override
  void initState() {
    createDummyData();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.grey,
      appBar: new AppBar(
        title: new Text(
          "My Ads".toUpperCase(),
          style: new TextStyle(color: Colors.black, fontFamily: "Arquitecta"),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: new Center(
        child: new Container(
          child: new ListView.builder(
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) => new MyadCard(
                  category: categories[index],
                ),
            itemCount: categories.length,
            padding: new EdgeInsets.all(20.0),
          ),
        ),
      ),
    );
  }

  

  createDummyData() {
    setState(() {
      categories.clear();

      categories.add(new Myad(
          id: 7, name: "Kaduwela", image: "images/room1.jpeg", ));

      categories.add(new Myad(
          id: 1, name: "Colombo", image: "images/room2.jpeg", ));

      categories.add(new Myad(
          id: 2, name: "Nittambuwa", image: "images/room1.jpeg", ));

      categories.add(new Myad(
          id: 3,
          name: "Homagama",
          image: "images/room1.jpeg",
          ));

      categories.add(new Myad(
          id: 4, name: "London", image: "images/room1.jpeg", ));

      categories.add(new Myad(
          id: 5, name: "Gampaha", image: "images/room1.jpeg", ));

      categories.add(new Myad(
          id: 6, name: "Nugegoda", image: "images/room1.jpeg", ));
    });
  }
}

typedef void MyadClick(Myad myad);

class MyadCard extends StatelessWidget {
  Myad category;
  MyadClick callback;

  MyadCard({this.category, this.callback});

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: () {
        callback(category);
      },
      child: new Card(
        color: Colors.white,
        margin: new EdgeInsets.all(10.0),
        child: new Container(
          height: 100.0,
          width: double.infinity,
          child: new Stack(
            children: <Widget>[
              Container(
  decoration: BoxDecoration(
              border: Border.all(width: 5,color: primaryColor),),
              child: Image.asset(
                category.image,
                fit: BoxFit.cover,
                width: double.infinity,
                
              ),),
              new Container(
                color: new Color(0x80000000),
              ),
              new Center(
                child: new Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new Text(
                      category.name,
                      style: new TextStyle(
                          color: Colors.white,
                          fontSize: 22.0,
                          fontFamily: "OpenSanBold"),
                    ),
                    
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
