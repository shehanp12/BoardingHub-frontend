import 'package:async/async.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/src/widgets/Loading_Screen.dart';
import 'package:flutter_app/src/widgets/register_widget.dart';

enum PhoneAuthState {
  Started,
  CodeSent,
  CodeResent,
  Verified,
  Failed,
  Error,
  AutoRetrievalTimeOut
}

class RegisterFrom extends StatefulWidget {
  RegisterFrom();

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterFrom> {
  bool loading = false;
  //final CategoryService categoryService = CategoryService();
  //Future<List<CategoryNew>> categoryList;
  final AsyncMemoizer _memoizer = AsyncMemoizer();
  String phoneNumber;
  String phoneIsoCode;
  bool visible = false;
  String confirmedNumber;
  int id = 1;

  void onPhoneNumberChange(
      String number, String internationalizedPhoneNumber, String isoCode) {
    print(number);
    setState(() {
      phoneNumber = number;
      phoneIsoCode = isoCode;
    });
  }

  onValidPhoneNumber(
      String number, String internationalizedPhoneNumber, String isoCode) {
    setState(() {
      visible = true;
      confirmedNumber = internationalizedPhoneNumber;
    });
  }



 

  


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
