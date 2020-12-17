import 'package:flutter/material.dart';

class Guidelines extends StatefulWidget {
  @override
  _AboutusPageState createState() => _AboutusPageState();
}

class _AboutusPageState extends State<Guidelines> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        brightness: Brightness.light,
        backgroundColor: Colors.transparent,
        title: Text(
          '',
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0,
      ),
      body: SafeArea(
        bottom: true,
        child: Padding(
          padding: const EdgeInsets.only(top: 0.0, left: 24.0, right: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: Text(
                  'User Guidelines ',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0),
                ),
              ),
              Flexible(
                child: ListView(
                  children: <Widget>[
                    Text(
                        'Please respect BORDING HUB, the owners of the Content, and other users of the BORDING HUB Service. Don’t engage in any activity, post any User Content, or register and/or use a username, which is or includes material that:'),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                        'Is offensive, abusive, defamatory, pornographic, threatening, or obscene; '),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                        'Is illegal, or intended to promote or commit an illegal act of any kind, including violations of intellectual property rights, privacy rights, or proprietary rights of BORDING HUB or a third party;'),
                    SizedBox(
                      height: 15,
                    ),
                    
                    Text(
                        "Includes your password or purposely includes any other user’s password or purposely includes personal data of third parties or is intended to solicit such personal data;"),
                    SizedBox(
                      height: 15,
                    ),
                    
                    
                    Text(
                        "You acknowledge and agree that posting any User Content that violates these User guidelines (or that BORDING HUB reasonably believes violates these User guidelines) may result in immediate termination or suspension of your BORDING HUB account. You also agree that BORDING HUB may reclaim your username for any reason."),
                    SizedBox(
                      height: 15,
                    ),
                    
                    Text(
                        "Impersonates or misrepresents your affiliation with another user, person, or entity, or is otherwise fraudulent, false, deceptive, or misleading;")
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
