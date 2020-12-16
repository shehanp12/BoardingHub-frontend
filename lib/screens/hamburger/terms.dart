import 'package:flutter/material.dart';

class TermsCondition extends StatefulWidget {
  @override
  _AboutusPageState createState() => _AboutusPageState();
}

class _AboutusPageState extends State<TermsCondition> {
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
                  'TERMS AND CONDITIONS',
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
                        'Your access to and use of http://bordinghub/ is subject exclusively to these Terms and Conditions. These Terms and Conditions present the "General Conditions" applicable to the use of services offered by Pick Me, either through the site http://bordinghub/, application software for mobile phone handset (app) or phone (in addition to the "Website" ).  You will not use the Website for any purpose that is unlawful or prohibited by these Terms and Conditions. By using the Website you are fully accepting the terms, conditions and disclaimers contained in this notice. If you do not accept these Terms and Conditions you must immediately stop using the Website and all software that belong to Digital Boarding Hub Solutions Lanka (Pvt) Ltd.'),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "Advice",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 14.0),
                    ),
                    Text(
                        "The contents of http://bordinghub/ website do not constitute advice and should not be relied on in making or refraining from making, any decision."),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                        "Change of Use http://bordinghub/ reserves the right to: change or remove (temporarily or permanently) the Website or any part of it without notice and you confirm that http://bordinghub/ shall not be liable to you for any such change or removal. The same applies to the changing of these Terms and Conditions at any time, and your continued use of the Website following any changes shall be deemed to be your acceptance of such change."),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                        "Links to Third Party Websites http://bordinghub/ Website may include links to third party websites that are controlled and maintained by others. Any link to other websites is not an endorsement of such websites and you acknowledge and agree that we are not responsible for the content or availability of any such sites."),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "Copyright",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 14.0),
                    ),
                    Text(
                        "All copyright, trade marks and all other intellectual property rights in the Website and its content (including without limitation the Website design, text, graphics and all software and source codes connected with the Website) are owned by or licensed to http://bordinghub/ or otherwise used byhttp://bordinghub/ as permitted by law.")
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
