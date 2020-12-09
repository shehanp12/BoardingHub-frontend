import 'package:flutter/material.dart';
import 'package:flutter_app/src/shared/buttons.dart';

class Regbutton extends StatelessWidget {
  Regbutton({@required this.onPress, @required this.typeText});

  final Function onPress;
  final Text typeText;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
        onTap: onPress,
        child: Container(
          width: MediaQuery.of(context).size.width / 2.5,
          height: 40,
          
          child: Center(
              child: typeText
               ),
          decoration: BoxDecoration(
            gradient:mainButton,
            
            
              boxShadow: [
                    
                BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, 0.16),
                  offset: Offset(0, 5),
                  blurRadius: 10.0,
                )
              ],
              borderRadius: BorderRadius.circular(50.0)),
        ),
      ),
    );
  }
}