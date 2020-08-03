import 'package:flutter/material.dart';
import 'package:price/utils/Style.dart';

class Test3Page extends StatefulWidget {
  @override
  _Test3PageState createState() => _Test3PageState();

  Test3Page({
    this.menuTriggerValue,
  });

  final Function(bool) menuTriggerValue;
}

typedef Callback(value);

class _Test3PageState extends State<Test3Page> {
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
        child: Text('Test4'),
      ),
    );
  }
}
