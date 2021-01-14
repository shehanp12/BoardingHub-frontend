import 'package:flutter/material.dart';
import 'package:flutter_app/shared/Colors.dart';


class SettingPage extends StatefulWidget {
  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      if (scrollController.position.userScrollDirection.index == 1) {
        FocusScope.of(context).requestFocus(FocusNode());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: LayoutBuilder(
        builder: (_, constraints) => GestureDetector(
          behavior: HitTestBehavior.opaque,
          child: SingleChildScrollView(
            controller: scrollController,
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: constraints.maxHeight,
              ),
              child: Container(
                margin: const EdgeInsets.only(top: kToolbarHeight),
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "settings",
                          style: TextStyle(
                            color: Colors.black26,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        CloseButton()
                      ],
                    ),
                    ListTile(
                      title: Text( "change_password"),
                      leading: Icon(
                        Icons.lock,
                        color: primaryColor,
                        size: 20.0,
                      ),
                      //onTap: () => Navigator.of(context).push(MaterialPageRoute(
                        //  builder: (_) => ChangePasswordPage())),
                    ),
                    Divider(),
//                     ListTile(
//                    title: Text('Change Address'),
//                    leading: Icon(Icons.local_post_office,
//                            color: Colors.blue,
//                            size: 20.0,
//                            ),
//                    onTap: () => Navigator.of(context).push(
//                        MaterialPageRoute(builder: (_) => ChangePasswordPage())),
//                  ),
//                    Divider(),
                    ListTile(
                      title:  Text( "change_language"),
                      leading: Icon(
                        Icons.category,
                        color: primaryColor,
                        size: 20.0,
                      ),
                      //onTap: () => Navigator.of(context).push(MaterialPageRoute(
                       //   builder: (_) => Language_Settings())),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}