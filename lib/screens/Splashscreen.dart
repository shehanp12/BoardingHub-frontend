import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/screens/auth/WelcomeUserPage.dart';
class SplashScreen extends StatefulWidget {
  
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

     @override
  void initState() {
    super.initState();
    new Future.delayed(
        const Duration(seconds: 3),
        () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => WelcomePage()),
            ));
  }  


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Stack(
        fit:StackFit.expand,
        
        children:<Widget>[
          Container(
            decoration:BoxDecoration(
              color: new Color(0xff622F74),
              gradient: LinearGradient(
                colors:[Colors.white,Colors.orange[200]],
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                ),
            ),
          ),
          
          Column(  
            mainAxisAlignment:MainAxisAlignment.center,
            children:<Widget>[
              
              Image.asset('images/welcomenewicon.png',
              width: 100,
              ),  
              Padding(
                padding:EdgeInsets.only(top:20.0), 
              ),
              
              SizedBox(
                width: 250.0,
                child:Center(
                child: ColorizeAnimatedTextKit(
                  text: ["BOARDING HUB",],
                  
                  textStyle: TextStyle(
                  fontSize: 30.0, 
                  fontFamily: 'times-new-roman',
                  fontWeight:FontWeight.bold,
                  ),
                  colors: [
                  Colors.white,
                  Colors.orange,
                  Colors.orangeAccent,
                  Colors.black12,
                    ],
                  ),
                ),
              ), 
              
            ]
          )
        ],
      ),
      
    );
  }
  
}