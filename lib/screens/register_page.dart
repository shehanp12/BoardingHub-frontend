import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/Loading_Screen.dart';
import 'package:flutter_app/widgets/register_widget.dart';

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
            body: Stack(
              children: <Widget>[
                SizedBox(height: 100),
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          //stops: [0.1, 0.5, 0.7, 0.9],
         colors: [
            Colors.black,
            Color(0xFFFB8C00),
            Color(0xFFFF6D00),
          ],
        ),
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
