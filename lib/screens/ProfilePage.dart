import 'package:flutter/material.dart';
import 'package:flutter_app/localization/language_constants.dart';
import 'package:flutter_app/screens/ProfileView.dart';
import 'package:flutter_app/shared/AppTheme.dart';
import 'package:flutter_app/utils/BoardingService.dart';
import 'package:flutter_app/widgets/Profile_List_item.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kAppPrimaryColor,
        body: Container(
          child: GetX<BoardingService>(
            init: BoardingService(),
            builder: (controller) => ListView.builder(
                itemCount: controller.myListData.length,
                itemBuilder:
                    (BuildContext context,int index){
                return ProfileView(

                  myData:controller.myListData[index]

                );
                }

            ),

          ),
        ));




  }
}

class AppBarButton extends StatelessWidget {
  final IconData icon;

  const AppBarButton({this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 55,
      height: 55,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: kAppPrimaryColor,
          boxShadow: [
            BoxShadow(
              color: kLightBlack,
              offset: Offset(1, 1),
              blurRadius: 10,
            ),
            BoxShadow(
              color: kWhite,
              offset: Offset(-1, -1),
              blurRadius: 10,
            ),
          ]),
      child: Icon(
        icon,
        color: fCL,
      ),
    );
  }
}

class AvatarImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 1,
      height: MediaQuery.of(context).size.height / 4.5,
      padding: EdgeInsets.all(8),
      decoration: avatarDecoration,
      child: Container(
        decoration: avatarDecoration,
        padding: EdgeInsets.all(3),
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: AssetImage('images/as.png'),
            ),
          ),
        ),
      ),
    );
  }
}

class ProfileListItems extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        children: <Widget>[
          ProfileListItem(
            icon: LineAwesomeIcons.user_shield,
            text: getTranslated(context, 'My_Ads'),
          ),
          ProfileListItem(
            icon: LineAwesomeIcons.history,
            text: getTranslated(context, 'Purchase_History'),
          ),
          ProfileListItem(
            icon: LineAwesomeIcons.question_circle,
            text: getTranslated(context, 'Help_&_Support'),
          ),
          ProfileListItem(
            icon: LineAwesomeIcons.cog,
            text: getTranslated(context, 'Settings'),
          ),
          ProfileListItem(
            icon: LineAwesomeIcons.user_plus,
            text: getTranslated(context, 'Invite_a_Friend'),
          ),
          ProfileListItem(
            icon: LineAwesomeIcons.alternate_sign_out,
            text: getTranslated(context, 'Logout'),
            hasNavigation: false,
          ),
        ],
      ),
    );
  }
}
