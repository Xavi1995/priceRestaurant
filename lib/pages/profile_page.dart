import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:price/pages/user_settings_page.dart';

import '../utils/Style.dart';

class ProfielPage extends StatefulWidget {
  @override
  _ProfielPageState createState() => _ProfielPageState();
}

class _ProfielPageState extends State<ProfielPage> {
  @override
  Widget build(BuildContext context) {
    double maxWidth = MediaQuery.of(context).size.width;
    double maxHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Style.primaryColor,
      appBar: Style.appBar(
        '',
        textColor: Colors.white,
        backgroundColor: Style.backgroundColor,
        leading: IconButton(
            icon: Icon(
              Icons.close,
              color: Style.primaryColor,
            ),
            onPressed: () {
              Navigator.pop(context);
            }),
        actions: [
          IconButton(
            icon: Icon(Icons.settings, color: Style.primaryColor),
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => UserSettings()));
            },
          )
        ],
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Container(
                color: Style.backgroundColor,
                child: Container(
                  child: Container(),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: Style.lateralPadding,
                    child: Neumorphic(
                      child: Container(
                        height: maxHeight / 2,

                        /*
                        Container(
                          child: Image.asset(
                            'assets/img/profileTest.jpeg',
                            //fit: BoxFit.cover,
                          ),
                        ),
                        */
                      ),
                      /* Image.asset(
                          'assets/img/profileTest.jpeg',
                          fit: BoxFit.cover,
                          height: 100,
                          width: 100,
                        ),
                        */
                      style: NeumorphicStyle(
                        boxShape: NeumorphicBoxShape.roundRect(
                          BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                        color: Style.primaryColor,
                        shadowLightColor: Style.primaryLightColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
