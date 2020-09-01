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
      backgroundColor: Style.backgroundColor,
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
          ),
        ],
      ),
      body: SafeArea(
        child: Container(
          child: Column(
            children: <Widget>[
              SizedBox(height: 50),
              ClipOval(
                child: Image.asset(
                  'assets/img/profile-pic-test.jpg',
                  fit: BoxFit.cover,
                  height: 150,
                  width: 150,
                ),
              ),
              SizedBox(height: 20),
              Style.bodyBoldText(
                'Xavi Castro',
                fontSize: 30.0,
                color: Style.primaryColor,
              ),
              SizedBox(height: 10),
              Style.bodyText(
                'Profile info',
                color: Style.primaryColor,
              ),
              SizedBox(height: 50),
              Container(
                width: double.infinity,
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Style.bodyBoldText(
                                'Your priorities',
                                color: Style.primaryColor,
                              ),
                              SizedBox(height: 4),
                            ],
                          ),
                        ),
                      ),
                    ),
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
