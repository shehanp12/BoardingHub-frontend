import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/models/AdsListData.dart';
import 'package:flutter_app/models/BoardingHouse.dart';
import 'package:flutter_app/models/suit_models.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DetailScreen extends StatefulWidget {
  final BoardingHouse hotelData;

  DetailScreen(this.hotelData);

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  bool isLike = false;

  Icon icon = Icon(FontAwesomeIcons.solidHeart);

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 300,
            pinned: true,
            flexibleSpace: ClipRRect(
              borderRadius:
                  BorderRadius.only(bottomLeft: Radius.circular(60.0)),
              child: FlexibleSpaceBar(
                collapseMode: CollapseMode.parallax,
                background: Stack(
                  children: <Widget>[
                    Positioned(
                      bottom: 0,
                      top: 0,
                      right: 0,
                      left: 0,
                      child: CachedNetworkImage(
                        imageUrl: widget.hotelData.imageUrl,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                        bottom: 10,
                        right: 10,
                        child: FloatingActionButton(
                          child: icon,
                          onPressed: () {
                            setState(() {
                              isLike = !isLike;
                              icon = !isLike
                                  ? Icon(FontAwesomeIcons.solidHeart)
                                  : Icon(
                                      FontAwesomeIcons.solidHeart,
                                      color: Colors.red,
                                    );
                            });
                          },
                        ))
                  ],
                ),
              ),
            ),
          ),
          SliverFillRemaining(
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: Column(
                children: <Widget>[
                  _buildTitleInfo(),
                  SizedBox(
                    height: 20.0,
                  ),
                  _buildServiceBar(),
                  SizedBox(
                    height: 30.0,
                  ),
                  _buildBookButton(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  _buildTitleInfo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              widget.hotelData.title,
              style: TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.2),
            ),
            SizedBox(
              height: 10.0,
            ),
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: Text(widget.hotelData.description,
            //     textAlign: TextAlign.justify,
            //   ),
            // ),
            Row(
              textDirection: TextDirection.rtl,
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Expanded(
                    child: Text(
                      widget.hotelData.description,
                      textAlign: TextAlign.justify,
                      textDirection: TextDirection.ltr,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w200,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              '\$${widget.hotelData.perMonth}',
              style: TextStyle(
                  fontSize: 19.0,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1.2),
            ),
            SizedBox(
              height: 10.0,
            ),
            Text("Per month"),
          ],
        ),
      ],
    );
  }

  _buildMenuBar() {
    return Container(
      height: 45.0,
      child: ListView.builder(
        itemCount: listString.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          String menu = listString[index];
          return GestureDetector(
            onTap: () {
              setState(() {
                _selectedIndex = index;
              });
            },
            child: Container(
              margin: EdgeInsets.only(right: 40.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    menu,
                    style: TextStyle(
                        fontSize: 20.0,
                        color: _selectedIndex == index
                            ? Theme.of(context).accentColor
                            : Colors.grey),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  _selectedIndex == index
                      ? Container(
                          color: Theme.of(context).accentColor,
                          height: 4.0,
                          width: 30.0,
                        )
                      : SizedBox.shrink()
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  _buildServiceBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Column(
          children: <Widget>[
            Container(
              width: 70.0,
              height: 70.0,
              decoration: BoxDecoration(
                  color: Colors.orange[100],
                  borderRadius: BorderRadius.circular(45.0)),
              child: Icon(
                FontAwesomeIcons.bath,
                color: Colors.blueAccent,
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Text("AttachBathroom"),
            SizedBox(
              height: 10.0,
            ),
            // Text(
            //   "12 sqft",
            //   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
            // ),
          ],
        ),
        Column(
          children: <Widget>[
            Container(
              width: 70.0,
              height: 70.0,
              decoration: BoxDecoration(
                  color: Colors.orange[100],
                  borderRadius: BorderRadius.circular(45.0)),
              child: Icon(
                FontAwesomeIcons.female,
                color: Colors.blueAccent,
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Text("GirlsOnly"),
            SizedBox(
              height: 10.0,
            ),
            // Text(
            //   "20 sqft",
            //   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
            // ),
          ],
        ),
        Column(
          children: <Widget>[
            Container(
              width: 70.0,
              height: 70.0,
              decoration: BoxDecoration(
                  color: Colors.orange[100],
                  borderRadius: BorderRadius.circular(45.0)),
              child: Icon(
                FontAwesomeIcons.car,
                color: Colors.blueAccent,
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Text("Parking"),
            SizedBox(
              height: 10.0,
            ),
            // Text(
            //   "80 sqft",
            //   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
            // ),
          ],
        ),
      ],
    );
  }

  _buildBookButton() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(45.0),
      child: FlatButton(
        onPressed: () {},
        color: Colors.orange[500],
        child: Container(
          width: 180.0,
          height: 80.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                width: 120.0,
                child: Text(
                  "Call now",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                width: 60.0,
                height: 60.0,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(45.0),
                ),
                child: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.blue[800],
                  size: 21.0,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
