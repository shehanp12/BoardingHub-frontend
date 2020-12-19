import 'package:flutter/material.dart';
import 'package:flutter_app/screens/HomePage.dart';
import 'package:flutter_app/shared/Styles.dart';
import 'package:flutter_app/widgets/Loading_Screen.dart';
import 'package:flutter_app/widgets/RegisterWidget.dart';

class RegisterFrom extends StatefulWidget {
  RegisterFrom();

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterFrom> {
  bool loading = false;
 
  
  showAlertDialog(BuildContext context) {
    AlertDialog alert = AlertDialog(
      content: new Row(
        children: [
          CircularProgressIndicator(),
          Container(margin: EdgeInsets.only(left: 5), child: Text("Loading")),
        ],
      ),
    );
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
          appBar: AppBar(
        
     leading: BackButton(
     color: Colors.black,
     onPressed: () { Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
            );},
   ), 
        brightness: Brightness.light,
        backgroundColor: Colors.transparent,
        title: Text(
          "Listing Information",
                           style: h3,
                            textAlign: TextAlign.right,
          
        ),
        elevation: 0,
      ),
            body: Stack(
              children: <Widget>[
                SizedBox(height: 100),
                Container(
                  decoration: BoxDecoration(
                      /*image: DecorationImage(
                          image: AssetImage('Ecfinder_Assets/logo/mainbg.jpg'),
                          fit: BoxFit.cover)*/
                          ),
                ),
                
                RegisterWidget()
              ],
            ),
          );
  }
}
