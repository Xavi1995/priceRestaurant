import 'package:flutter/material.dart';
import 'package:price/utils/Style.dart';

class Test2Page extends StatefulWidget {
  @override
  _Test2PageState createState() => _Test2PageState();

  Test2Page({
    this.menuTriggerValue,
  });

  final Function(bool) menuTriggerValue;
}

typedef Callback(value);

class _Test2PageState extends State<Test2Page> {
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
            print('Menu State: $menuState');
          },
        ),
      ),
      backgroundColor: Style.backgroundColor,
      body: Center(
        child: Text('Test3'),
      ),
    );
  }
}
