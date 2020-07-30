import 'dart:async';

import 'package:flutter/material.dart';
import 'package:price/models/profile.dart';
import 'package:price/pages/authenticate/authenticate.dart';
import 'package:price/pages/authenticate/authenticate_home_page.dart';
import 'package:price/utils/Style.dart';
import 'package:price/widgets/bottomNavBar.dart';

import 'package:provider/provider.dart';

import 'authenticate/register_page.dart';

import 'home/home.dart';
import 'main_user.dart';

class Wrapper extends StatefulWidget {
  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  StreamController<int> selectedIndexStream = StreamController<int>.broadcast();

  @override
  Widget build(BuildContext context) {
    double maxWidth = MediaQuery.of(context).size.width;
    final user = Provider.of<User>(context);
    /*
    if (user == null) {
      return Authenticate();
    } else {
      return Home();
    }
    */

    return StreamBuilder(
      stream: selectedIndexStream.stream,
      initialData: 0,
      builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
        return Scaffold(
          backgroundColor: Colors.transparent,
          body: Stack(
            children: <Widget>[
              Container(
                color: Style.primaryColor,
              ),
              Stack(
                children: <Widget>[
                  layout(snapshot.data),
                  Positioned(
                    bottom: 0,
                    child: Material(
                      color: Colors.transparent,
                      shape: RoundedRectangleBorder(),
                      child: Container(
                        width: maxWidth,
                        child: BottomNavBar(
                          indexSelected: snapshot.data,
                          index: (value) {
                            selectedIndexStream.add(value);
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
  }

  Widget layout(int index) {
    switch (index) {
      case 0:
        return MainVc();
      case 1:
        return Container();
      /*case 2:
        return ClubPage(changeTab: _onItemTapped);*/
      case 2:
        return Container();
      case 3:
        return Container();
    }
    return Container();
  }
}
