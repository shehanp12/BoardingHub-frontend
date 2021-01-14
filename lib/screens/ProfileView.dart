import 'package:flutter/material.dart';
import 'package:flutter_app/models/BoardingProvider.dart';
import 'package:flutter_app/screens/ProfilePage.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key key,this.myData});
  final BoardingProvider myData;

  @override
  Widget build(BuildContext context) {
    return Container(
     child: Column(
        children: [
          AvatarImage(),
          SizedBox(
            height: 25,
          ),
          // Text(
          //   myData.userName,
          //   style: TextStyle(
          //       fontSize: 30,
          //       fontWeight: FontWeight.w700,
          //       fontFamily: "Poppins"),
          // ),
          Text(
            '0778342720',
            style: TextStyle(fontWeight: FontWeight.w300),
          ),
          SizedBox(height: 10),
          Text(
            'lakshan.bimantha@gmail.com',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20, fontFamily: "Poppins"),
          ),
          ProfileListItems(),
        ],

      )
    );
  }
}
