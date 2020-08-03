import 'package:flutter/material.dart';
import 'package:price/utils/Style.dart';

class Test1Page extends StatefulWidget {
  @override
  _Test1PageState createState() => _Test1PageState();
  Test1Page({
    this.menuTriggerValue,
  });

  final Function(bool) menuTriggerValue;
}

typedef Callback(value);

class _Test1PageState extends State<Test1Page> {
  bool menuState = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Style.appBar(
        'Your Plan',
        textColor: Style.primaryColor,
        backgroundColor: Style.backgroundColor,
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            menuState = /*!menuState*/ true;
            widget.menuTriggerValue(menuState);
          },
        ),
      ),
      backgroundColor: Style.backgroundColor,
      body: Center(
        child: Text(
          'Test 2',
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}
