import 'package:flutter/material.dart';
import 'package:flutter_app/shared/AppTheme.dart';
import 'package:flutter_app/shared/Colors.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class ProfileListItem extends StatelessWidget {
  final IconData icon;
  final String text;
  final Function onPress;


  const ProfileListItem({
    Key key,
    this.icon,
    this.text,
    this.onPress

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      margin: EdgeInsets.symmetric(
        horizontal: 10,
      ).copyWith(
        bottom: 20,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 20,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.grey[300],
       
      ),
      child: Row(
        children: <Widget>[
          Icon(
            this.icon,
            size: 25,
            color: primaryColor,
          ),
          SizedBox(width: 15),
          Text(
            this.text,
            style: kTitleTextStyle.copyWith(
              fontWeight: FontWeight.w500,
              fontFamily: "Poppins",
            ),
          ),
          Spacer(),

            Icon(
              LineAwesomeIcons.angle_right,
              size: 25,
              color: primaryColor,
            ),
        ],
      ),
    );
  }
}
