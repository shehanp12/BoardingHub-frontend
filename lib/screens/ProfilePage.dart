import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_app/localization/language_constants.dart';
import 'package:flutter_app/screens/settings/Myads.dart';
import 'package:flutter_app/screens/auth/WelcomeUserPage.dart';
import 'package:flutter_app/screens/settings/settings.dart';
import 'package:flutter_app/shared/AppTheme.dart';
import 'package:flutter_app/widgets/Profile_List_item.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _ProfilePageState createState() => _ProfilePageState();
}
Future<Null> logoutUser() async {
    //logout user
    SharedPreferences prefs;
    prefs = await SharedPreferences.getInstance();
    //await _auth.signOut();
    prefs.clear();
    prefs.commit();
  } 

void launchWhatsApp() async {
    String url() {
      String phone = "+966539500051";
      String message = "";
      if (Platform.isIOS) {
        return "whatsapp://wa.me/$phone/?text=${Uri.parse(message)}";
      } else {
        return "whatsapp://send?phone=$phone&text=${Uri.parse(message)}";
      }
    }

    if (await canLaunch(url())) {
      await launch(url());
    } else {
      throw 'Could not launch ${url()}';
    }
  }

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kAppPrimaryColor,
      body: Stack(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(25),
            child: Column(
              children: <Widget>[
                AvatarImage(),
                SizedBox(
                  height: 25,
                ),
                Text(
                  'Anjana98',
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w700,
                      fontFamily: "Poppins"),
                ),
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
            ),
          )
        ],
      ),
    );
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

class ProfileListItems extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        children: <Widget>[
          GestureDetector(
            onTap: (){
              Get.to(MyadScreen());
            },
            child: ProfileListItem(
              icon: LineAwesomeIcons.user_shield,
              text: getTranslated(context, 'My_Ads'),

            ),
          ),
          ProfileListItem(
            icon: LineAwesomeIcons.history,
            text: getTranslated(context, 'Purchase_History'),

          ),
          ProfileListItem(
            icon: LineAwesomeIcons.question_circle,
            text: getTranslated(context, 'Help_&_Support'),
          ),
           GestureDetector(
             onTap: (){
              Get.to(SettingPage());
            },
          child:ProfileListItem(
            icon: LineAwesomeIcons.cog,
            text: getTranslated(context, 'Settings'),
            
          ),),

          GestureDetector(
             onTap: ()async {
              await launchWhatsApp();
                          },
          child:ProfileListItem(
            icon: LineAwesomeIcons.user_plus,
            text:getTranslated(context, 'Invite_a_Friend'),
            ),),

          GestureDetector(
             onTap: ()async {
                                        await logoutUser();
                                        //state.onRemoveLocation();

                                        Navigator.pushAndRemoveUntil(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    WelcomePage()),
                                            (Route<dynamic> route) => false);
                                      } ,
          child:ProfileListItem(
            icon: LineAwesomeIcons.alternate_sign_out,
            text:getTranslated(context,'Logout'),
            //hasNavigation: false,
          )
          ),
        ],
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