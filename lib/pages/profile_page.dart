import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:price/pages/profile_pages/ContactUs_page.dart';
import 'package:price/pages/profile_pages/InviteFriend_page.dart';
import 'package:price/pages/profile_pages/MyComments_page.dart';
import 'package:price/pages/profile_pages/MyRestaurant_page.dart';
import 'package:price/pages/profile_pages/priorities_page.dart';
import 'package:price/pages/user_settings_page.dart';

import '../utils/Style.dart';

class ProfielPage extends StatefulWidget {
  @override
  _ProfielPageState createState() => _ProfielPageState();
}

class _ProfielPageState extends State<ProfielPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Style.backgroundColor,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: Style.lateralPaddingValue, vertical: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          child: Row(
                            children: [
                              Icon(Icons.arrow_back_ios,
                                  color: Style.primaryColor, size: 15.0),
                              Style.bodyText('back', color: Style.primaryColor),
                            ],
                          ),
                          onTap: () {
                            Navigator.pop(context);
                          },
                        ),
                        GestureDetector(
                            child: Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 6, vertical: 2),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10),
                                    ),
                                  ),
                                  child: Center(
                                    child: Style.bodyText(
                                      'edit',
                                      color: Style.primaryColor,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => UserSettings(),
                                ),
                              );
                            }),
                      ],
                    ),
                  ),
                  ClipOval(
                    child: Image.asset(
                      'assets/img/profile-pic-test.jpg',
                      fit: BoxFit.cover,
                      height: 150,
                      width: 150,
                    ),
                  ),
                  SizedBox(height: 10),
                  Style.bodyBoldText(
                    'Xavi Castro',
                    fontSize: 30.0,
                    color: Style.primaryColor,
                  ),
                  SizedBox(height: 20),
                  Style.bodyText(
                    'Profile info',
                    color: Style.primaryColor,
                  ),
                  SizedBox(height: 30),
                  Container(
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            Style.bodyBoldText(
                              '192',
                              color: Style.primaryColor,
                              fontSize: 22.0,
                            ),
                            Style.bodyText(
                              'Following',
                              color: Style.primaryColor,
                            ),
                          ],
                        ),
                        SizedBox(width: 40),
                        Column(
                          children: [
                            Style.bodyBoldText(
                              '24.3k',
                              color: Style.primaryColor,
                              fontSize: 22.0,
                            ),
                            Style.bodyText(
                              'Followers',
                              color: Style.primaryColor,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 6),
                      child: ListTile(
                        leading:
                            Icon(Icons.favorite, color: Style.primaryColor),
                        title: Style.bodyText('My priorities',
                            color: Style.primaryColor),
                        trailing: Icon(
                          Icons.arrow_forward_ios,
                          color: Style.primaryColor,
                          size: 16,
                        ),
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => PrioritiesPage(),
                            ),
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 6),
                      child: ListTile(
                        leading: Icon(Icons.comment, color: Style.primaryColor),
                        title: Style.bodyText('Comments',
                            color: Style.primaryColor),
                        trailing: Icon(Icons.arrow_forward_ios,
                            color: Style.primaryColor, size: 16),
                            onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => MyCommentsPage(),
                            ),
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 6),
                      child: ListTile(
                        leading:
                            Icon(Icons.food_bank, color: Style.primaryColor),
                        title: Style.bodyText('Restaurants',
                            color: Style.primaryColor),
                        trailing: Icon(Icons.arrow_forward_ios,
                            color: Style.primaryColor, size: 16),
                            onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => MyRestaurants(),
                            ),
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 6),
                      child: ListTile(
                        leading: Icon(Icons.add, color: Style.primaryColor),
                        title: Style.bodyText('Invite a friend',
                            color: Style.primaryColor),
                        trailing: Icon(Icons.arrow_forward_ios,
                            color: Style.primaryColor, size: 16),
                            onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => InviteAFriendPage(),
                            ),
                          );
                        },
                      ),
                    ),
                    Divider(
                      color: Style.primaryColor,
                      height: 1,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 4),
                      child: ListTile(
                        leading:
                            Icon(Icons.settings, color: Style.primaryColor),
                        title: Style.bodyText('Account settings',
                            color: Style.primaryColor),
                        trailing: Icon(Icons.arrow_forward_ios,
                            color: Style.primaryColor, size: 16),
                            onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => UserSettings(),
                            ),
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 6),
                      child: ListTile(
                        leading: Icon(Icons.help, color: Style.primaryColor),
                        title: Style.bodyText('Contact us',
                            color: Style.primaryColor),
                        trailing: Icon(Icons.arrow_forward_ios,
                            color: Style.primaryColor, size: 16),
                            onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => ContactUsPage(),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
