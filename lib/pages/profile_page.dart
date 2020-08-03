import 'package:flutter/material.dart';
import 'package:price/widgets/neumorphyc.dart';

import '../utils/Style.dart';

class ProfielPage extends StatefulWidget {
  @override
  _ProfielPageState createState() => _ProfielPageState();
}

class _ProfielPageState extends State<ProfielPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Style.primaryColor,
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Center(child: NeumorphicContainer(child: Text('hello'))),
          ),
          Expanded(
            flex: 2,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                color: Style.backgroundColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
