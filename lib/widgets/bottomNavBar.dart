import 'package:flutter/material.dart';
import 'package:price/utils/Style.dart';

class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();

  BottomNavBar({this.index, this.indexSelected});
  final int indexSelected;
  final Function(int) index;
}

typedef Callback(value);

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          color: Style.backgroundColor,
          border: Border.all(color: Style.primaryColor),
        ),
        child: Padding(
          padding: Style.lateralPadding,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              IconButton(
                  onPressed: () {
                    widget.index(0);
                  },
                  icon: widget.indexSelected == 0
                      ? Column(
                          children: <Widget>[
                            Image.asset(
                              'assets/icons/home_primary.png',
                              height: 28,
                              width: 28,
                            ),
                            SizedBox(
                              height: 1,
                            ),
                            Material(
                              shape: CircleBorder(),
                              color: Style.primaryColor,
                              child: Container(height: 3, width: 3),
                            ),
                          ],
                        )
                      : Image.asset(
                          'assets/icons/home_black.png',
                          height: 24,
                          width: 24,
                        )),
              IconButton(
                onPressed: () {
                  widget.index(1);
                },
                icon: widget.indexSelected == 1
                    ? Column(
                        children: <Widget>[
                          Image.asset(
                            'assets/icons/social_primary.png',
                            height: 28,
                            width: 28,
                          ),
                          SizedBox(
                            height: 1,
                          ),
                          Material(
                            shape: CircleBorder(),
                            color: Style.primaryColor,
                            child: Container(height: 3, width: 3),
                          ),
                        ],
                      )
                    : Image.asset(
                        'assets/icons/social_black.png',
                        height: 24,
                        width: 24,
                      ),
              ),
              IconButton(
                onPressed: () {
                  widget.index(2);
                },
                icon: widget.indexSelected == 2
                    ? Column(
                        children: <Widget>[
                          Image.asset(
                            'assets/icons/coupon_primary.png',
                            height: 28,
                            width: 28,
                          ),
                          SizedBox(
                            height: 1,
                          ),
                          Material(
                            shape: CircleBorder(),
                            color: Style.primaryColor,
                            child: Container(height: 3, width: 3),
                          ),
                        ],
                      )
                    : Image.asset(
                        'assets/icons/coupon_black.png',
                        height: 24,
                        width: 24,
                      ),
              ),
              IconButton(
                onPressed: () {
                  widget.index(3);
                },
                icon: widget.indexSelected == 3
                    ? Column(
                        children: <Widget>[
                          Image.asset(
                            'assets/icons/search_primary.png',
                            height: 28,
                            width: 28,
                          ),
                          SizedBox(
                            height: 1,
                          ),
                          Material(
                            shape: CircleBorder(),
                            color: Style.primaryColor,
                            child: Container(height: 3, width: 3),
                          ),
                        ],
                      )
                    : Image.asset(
                        'assets/icons/search_black.png',
                        height: 24,
                        width: 24,
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
