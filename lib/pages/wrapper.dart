import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:price/models/profile.dart';
import 'package:price/pages/authenticate/authenticate.dart';
import 'package:price/pages/authenticate/authenticate_home_page.dart';
import 'package:price/pages/profile_page.dart';
import 'package:price/pages/test1_age1.dart';
import 'package:price/pages/test2_page.dart';
import 'package:price/pages/test3_page.dart';
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

class _WrapperState extends State<Wrapper> with TickerProviderStateMixin {
  StreamController<int> selectedIndexStream = StreamController<int>.broadcast();
  StreamController<bool> menuTrigger = StreamController<bool>.broadcast();
  AnimationController animation;

  void _onTapAnimation() {
    animation.reset();
    animation.forward();
    animation.duration = Duration(
      milliseconds: 200,
    );
  }

  @override
  void initState() {
    super.initState();
    animation =
        AnimationController(duration: Duration(seconds: 1), vsync: this);
    animation.forward();
    animation.addListener(() => setState(() {}));
    animation.removeListener(() {});
  }

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
                      //padding: EdgeInsets.all(Style.lateralPaddingValue),
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
                                child: Padding(
                                  padding: Style.lateralPadding,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.of(context).push(
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  ProfielPage(),
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
                                                    'assets/img/profile-pic-test.jpg'),
                                              ),
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
                              ),
                              SizedBox(height: 100),
                              Container(
                                width: MediaQuery.of(context).size.width,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    GestureDetector(
                                      onTap: () {
                                        selectedIndexStream.add(0);
                                      },
                                      child: Row(
                                        children: <Widget>[
                                          AnimatedContainer(
                                            duration:
                                                Duration(milliseconds: 200),
                                            height: 10,
                                            width: snapshot.data == 0 ? 3 : 0,
                                            decoration: BoxDecoration(
                                                color: snapshot.data == 0
                                                    ? Colors.white
                                                    : Colors.transparent,
                                                borderRadius: BorderRadius.only(
                                                    topRight:
                                                        Radius.circular(4),
                                                    bottomRight:
                                                        Radius.circular(4))),
                                          ),
                                          SizedBox(
                                              width: Style.lateralPaddingValue),
                                          AnimatedContainer(
                                            duration: Duration(
                                              milliseconds: 200,
                                            ),
                                            child: AnimatedDefaultTextStyle(
                                              duration:
                                                  Duration(milliseconds: 200),
                                              style: snapshot.data == 0
                                                  ? GoogleFonts.montserrat(
                                                      color: Colors.white,
                                                      fontSize: 25.0,
                                                      fontWeight:
                                                          FontWeight.w300,
                                                    )
                                                  : GoogleFonts.montserrat(
                                                      color:
                                                          Style.containerColor,
                                                      fontSize: 16.0,
                                                    ),
                                              child: Text('Home'),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),

                                    ///////////////////////

                                    SizedBox(height: 40),
                                    GestureDetector(
                                      onTap: () {
                                        selectedIndexStream.add(1);
                                      },
                                      child: Row(
                                        children: <Widget>[
                                          AnimatedContainer(
                                            duration:
                                                Duration(milliseconds: 200),
                                            decoration: BoxDecoration(
                                                color: snapshot.data == 1
                                                    ? Colors.white
                                                    : Colors.transparent,
                                                borderRadius: BorderRadius.only(
                                                    topRight:
                                                        Radius.circular(4),
                                                    bottomRight:
                                                        Radius.circular(4))),
                                            height: 10,
                                            width: snapshot.data == 1 ? 3 : 0,
                                          ),
                                          SizedBox(
                                              width: Style.lateralPaddingValue),
                                          AnimatedContainer(
                                            duration: Duration(
                                              milliseconds: 200,
                                            ),
                                            child: AnimatedDefaultTextStyle(
                                              duration:
                                                  Duration(milliseconds: 200),
                                              style: snapshot.data == 1
                                                  ? GoogleFonts.montserrat(
                                                      color: Colors.white,
                                                      fontSize: 25.0,
                                                      fontWeight:
                                                          FontWeight.w300,
                                                    )
                                                  : GoogleFonts.montserrat(
                                                      color:
                                                          Style.containerColor,
                                                      fontSize: 16.0,
                                                    ),
                                              child: Text('Opción 2'),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 40),
                                    GestureDetector(
                                      onTap: () {
                                        selectedIndexStream.add(2);
                                      },
                                      child: Row(
                                        children: <Widget>[
                                          AnimatedContainer(
                                            duration:
                                                Duration(milliseconds: 200),
                                            decoration: BoxDecoration(
                                                color: snapshot.data == 2
                                                    ? Colors.white
                                                    : Colors.transparent,
                                                borderRadius: BorderRadius.only(
                                                    topRight:
                                                        Radius.circular(4),
                                                    bottomRight:
                                                        Radius.circular(4))),
                                            height: 10,
                                            width: snapshot.data == 2 ? 3 : 0,
                                          ),
                                          SizedBox(
                                              width: Style.lateralPaddingValue),
                                          AnimatedContainer(
                                            duration: Duration(
                                              milliseconds: 200,
                                            ),
                                            child: AnimatedDefaultTextStyle(
                                              duration:
                                                  Duration(milliseconds: 200),
                                              style: snapshot.data == 2
                                                  ? GoogleFonts.montserrat(
                                                      color: Colors.white,
                                                      fontSize: 25.0,
                                                      fontWeight:
                                                          FontWeight.w300,
                                                    )
                                                  : GoogleFonts.montserrat(
                                                      color:
                                                          Style.containerColor,
                                                      fontSize: 16.0,
                                                    ),
                                              child: Text('Opción 3'),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 40),
                                    GestureDetector(
                                      onTap: () {
                                        selectedIndexStream.add(3);
                                      },
                                      child: Row(
                                        children: <Widget>[
                                          AnimatedContainer(
                                            duration:
                                                Duration(milliseconds: 200),
                                            decoration: BoxDecoration(
                                                color: snapshot.data == 3
                                                    ? Colors.white
                                                    : Colors.transparent,
                                                borderRadius: BorderRadius.only(
                                                    topRight:
                                                        Radius.circular(4),
                                                    bottomRight:
                                                        Radius.circular(4))),
                                            height: 10,
                                            width: snapshot.data == 3 ? 3 : 0,
                                          ),
                                          SizedBox(
                                              width: Style.lateralPaddingValue),
                                          AnimatedContainer(
                                            duration: Duration(
                                              milliseconds: 200,
                                            ),
                                            child: AnimatedDefaultTextStyle(
                                              duration:
                                                  Duration(milliseconds: 200),
                                              style: snapshot.data == 3
                                                  ? GoogleFonts.montserrat(
                                                      color: Colors.white,
                                                      fontSize: 25.0,
                                                      fontWeight:
                                                          FontWeight.w300,
                                                    )
                                                  : GoogleFonts.montserrat(
                                                      color:
                                                          Style.containerColor,
                                                      fontSize: 16.0,
                                                    ),
                                              child: Text('Opción 4'),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: SizedBox(
                                  height: Style.lateralPaddingValue * 2,
                                ),
                              ),
                              Padding(
                                padding: Style.lateralPadding,
                                child: Container(
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
                                        onTap: () {
                                          Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      AuthenticateMain()));
                                        },
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
                                              Icon(
                                                Icons.close,
                                                color: Colors.white,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
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
        return Test1Page(menuTriggerValue: (value) {
          menuTrigger.add(value);
        });
      /*case 2:
        return ClubPage(changeTab: _onItemTapped);*/
      case 2:
        return Test2Page(menuTriggerValue: (value) {
          menuTrigger.add(value);
        });
      case 3:
        return Test3Page(
          menuTriggerValue: (value) {
            menuTrigger.add(value);
          },
        );
    }
    return Container();
  }
}
