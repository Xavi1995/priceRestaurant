import 'dart:async';

import 'package:flutter/material.dart';

import '../utils/Style.dart';

class NeumorphicContainer extends StatefulWidget {
  @override
  _NeumorphicContainerState createState() => _NeumorphicContainerState();
  Widget child;
  final double bevel;
  bool state;

  NeumorphicContainer({this.bevel = 4.0, this.child, this.state});
}

class _NeumorphicContainerState extends State<NeumorphicContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Style.timeAccentColor,
                Style.primaryColor,
              ]),
          borderRadius: BorderRadius.circular(40),
          color: Colors.blueGrey.shade200,
          boxShadow: [
            BoxShadow(
              blurRadius: widget.bevel,
              offset: Offset(-3.0, -3.0),
              color: Style.containerColor,
            ),
            BoxShadow(
                blurRadius: widget.bevel,
                offset: Offset(3.0, 3.0),
                color: Style.timeAccentColor)
          ]),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 40.0),
        child: widget.child,
      ),
    );
  }
}
