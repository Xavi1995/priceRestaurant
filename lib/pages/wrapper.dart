import 'dart:async';

import 'package:flutter/material.dart';
import 'package:price/models/profile.dart';
import 'package:price/pages/authenticate/authenticate.dart';
import 'package:price/pages/authenticate/authenticate_home_page.dart';
import 'package:price/pages/profile_page.dart';
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
  StreamController<bool> menuTrigger = StreamController<bool>.broadcast();

  @override
  Widget build(BuildContext context) {
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
        double maxHeight = MediaQuery.of(context).size.height;
        double maxWidth = MediaQuery.of(context).size.width;

        return StreamBuilder(
            stream: menuTrigger.stream,
            initialData: false,
            builder: (context, snapshotState) {
              return Scaffold(
                backgroundColor: Colors.transparent,
                body: Stack(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(Style.lateralPaddingValue),
                      color: Style.primaryColor,
                      height: maxHeight,
                      child: AnimatedOpacity(
                        duration: Duration(milliseconds: 300),
                        opacity: snapshotState.data ? 1 : 0,
                        child: Container(
                          width: double.infinity,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              SizedBox(height: 20),
                              SafeArea(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.of(context).push(
                                          MaterialPageRoute(
                                            builder: (context) => ProfielPage(),
                                          ),
                                        );
                                      },
                                      child: Row(
                                        children: <Widget>[
                                          ClipRRect(
                                            child: CircleAvatar(
                                                backgroundColor:
                                                    Style.containerColor,
                                                backgroundImage: AssetImage(
                                                    'assets/img/profileTest.jpeg')),
                                          ),
                                          SizedBox(width: 20),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Style.bodyTitle(
                                                'Xavi Castro',
                                                fontSize: 20.0,
                                              ),
                                              SizedBox(height: 4),
                                              Style.bodyTitle(
                                                'xavicascoll@gmail.com',
                                                fontSize: 16.0,
                                                fontFamilyAbril: true,
                                                letterSpacing: 2.0,
                                                color: Colors.white
                                                    .withOpacity(0.7),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    Row(
                                      children: <Widget>[
                                        IconButton(
                                          icon: Icon(
                                            Icons.close,
                                            color: Colors.white,
                                          ),
                                          onPressed: () {
                                            menuTrigger
                                                .add(!snapshotState.data);
                                          },
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 100),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: <Widget>[
                                  GestureDetector(
                                    onTap: () {
                                      selectedIndexStream.add(0);
                                    },
                                    child: Row(
                                      children: <Widget>[
                                        Style.bodyText(
                                          'Opción 1',
                                          fontSize:
                                              snapshot.data == 0 ? 25.0 : 16.0,
                                          color: snapshot.data == 0
                                              ? Colors.white
                                              : Style.containerColor,
                                        ),
                                      ],
                                    ),
                                  ),
                                  snapshot.data == 0
                                      ? SizedBox(height: 20)
                                      : Container(),
                                  SizedBox(height: 30),
                                  GestureDetector(
                                    onTap: () {
                                      selectedIndexStream.add(1);
                                    },
                                    child: Row(
                                      children: <Widget>[
                                        Style.bodyText(
                                          'Opción 2',
                                          fontSize:
                                              snapshot.data == 1 ? 25.0 : 16.0,
                                          color: snapshot.data == 1
                                              ? Colors.white
                                              : Style.containerColor,
                                        ),
                                      ],
                                    ),
                                  ),
                                  snapshot.data == 1
                                      ? SizedBox(height: 20)
                                      : Container(),
                                  SizedBox(height: 30),
                                  GestureDetector(
                                    onTap: () {
                                      selectedIndexStream.add(2);
                                    },
                                    child: Row(
                                      children: <Widget>[
                                        Style.bodyText(
                                          'Opción 3',
                                          fontSize:
                                              snapshot.data == 2 ? 25.0 : 16.0,
                                          color: snapshot.data == 2
                                              ? Colors.white
                                              : Style.containerColor,
                                        ),
                                      ],
                                    ),
                                  ),
                                  snapshot.data == 2
                                      ? SizedBox(height: 20)
                                      : Container(),
                                  SizedBox(height: 30),
                                  GestureDetector(
                                    onTap: () {
                                      selectedIndexStream.add(3);
                                    },
                                    child: Row(
                                      children: <Widget>[
                                        Style.bodyText(
                                          'Opción 4',
                                          fontSize:
                                              snapshot.data == 3 ? 25.0 : 16.0,
                                          color: snapshot.data == 3
                                              ? Colors.white
                                              : Style.containerColor,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Expanded(
                                child: SizedBox(
                                  height: Style.lateralPaddingValue * 2,
                                ),
                              ),
                              Container(
                                width: double.infinity,
                                margin: EdgeInsets.only(bottom: 40),
                                child: Column(
                                  children: <Widget>[
                                    Divider(
                                      color: Style.backgroundColor,
                                      endIndent: 200,
                                    ),
                                    SizedBox(height: 30),
                                    GestureDetector(
                                      onTap: () {},
                                      child: Container(
                                        //color: Colors.red,
                                        child: Row(
                                          children: <Widget>[
                                            Style.bodyTitle(
                                              'Log out',
                                              fontSize: 14.0,
                                              letterSpacing: 2.0,
                                              color: Colors.white,
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Icon(Icons.close,
                                                color: Colors.white)
                                          ],
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
                    ),
                    Stack(
                      children: <Widget>[
                        AnimatedPositioned(
                          width: maxWidth,
                          height: maxHeight,
                          duration: Duration(milliseconds: 200),
                          top: snapshotState.data ? maxWidth / 2 : 0,
                          left: snapshotState.data ? maxHeight / 4 : 0,
                          curve: Curves.easeOutSine,
                          child: Container(
                            decoration: BoxDecoration(boxShadow: [
                              BoxShadow(
                                  offset: Offset(-15.0, 15.0),
                                  color: Style.containerColor,
                                  blurRadius: 0)
                            ]),
                            child: layout(
                              snapshot.data,
                            ),
                          ),
                        ),
                        /*
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
                        */
                      ],
                    )
                  ],
                ),
              );
            });
      },
    );
  }

  Widget layout(int index) {
    switch (index) {
      case 0:
        return MainVc(
          menuTriggerValue: (value) {
            menuTrigger.add(value);
          },
        );
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
