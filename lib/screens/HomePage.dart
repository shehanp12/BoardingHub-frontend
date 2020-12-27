import 'package:flutter/material.dart';
import 'package:flutter_app/models/AdsListData.dart';
import 'package:flutter_app/screens/AdsPage.dart';
import 'package:flutter_app/screens/ProfilePage.dart';
import 'package:flutter_app/screens/auth/SignInPage.dart';
import 'package:flutter_app/screens/bottom_navigation_view/BottomBarView.dart';
import 'package:flutter_app/screens/hamburger/Hambueger.dart';
import 'package:flutter_app/screens/viewData/BoardingRegisterPage.dart';
import 'package:flutter_app/shared/AppTheme.dart';
import 'package:flutter_app/screens/bottom_navigation_view/TabIconData.dart';

import 'package:flutter_app/screens/feed/NewFeed.dart';


class HomePage extends StatefulWidget {
  final String pageTitle;

  HomePage({Key key, this.pageTitle}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with TickerProviderStateMixin {
  AnimationController animationController;

  List<TabIconData> tabIconsList = TabIconData.tabIconsList;
  List<AdsListData> adList = AdsListData.adList;
  Widget tabBody = Container(
    color: BoardingAppTheme.background,
  );

  @override
  void initState() {
    tabIconsList.forEach((TabIconData tab) {
      tab.isSelected = false;
    });
    tabIconsList[0].isSelected = true;

    animationController = AnimationController(
        duration: const Duration(milliseconds: 600), vsync: this);
    tabBody = AdsScreen();
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: BoardingAppTheme.background,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: FutureBuilder<bool>(
          future: getData(),
          builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
            if (!snapshot.hasData) {
              return const SizedBox();
            } else {
              return Stack(
                children: <Widget>[
                  tabBody,
                  bottomBar(),
                ],
              );
            }
          },
        ),
      ),
    );
  }

  Future<bool> getData() async {
    await Future<dynamic>.delayed(const Duration(milliseconds: 200));
    return true;
  }


  Widget bottomBar() {
    return Column(
      children: <Widget>[
        const Expanded(
          child: SizedBox(),
        ),
        BottomBarView(
          tabIconsList: tabIconsList,
          addClick: () {},
          changeIndex: (int index) {
            if (index == 0 ) {
              animationController.reverse().then<dynamic>((data) {
                if (!mounted) {
                  return;
                }
                setState(() {
                  tabBody =
                      AdsScreen();
                });
              });
            } else if (index == 1) {
              animationController.reverse().then<dynamic>((data) {
                if (!mounted) {
                  return;
                }
                setState(() {
                  tabBody =
                      CarouselDemo();
                });
              });
            }
            else if (index == 2) {
              animationController.reverse().then<dynamic>((data) {
                if (!mounted) {
                  return;
                }
                setState(() {
                  tabBody =
                      ProfilePage();
                });
              });
            }
            else if (index == 3){
              animationController.reverse().then<dynamic>((data) {
                if (!mounted) {
                  return;
                }
                setState(() {
                  tabBody =
                      MenudrawerPage();
                });
              });
            }
          },
        ),
      ],
    );
  }

}
