import 'package:flutter/material.dart';
import 'package:price/utils/Style.dart';

class FilterCard extends StatefulWidget {
  @override
  _FilterCardState createState() => _FilterCardState();

  final Color primaryColor;
  final Color backgroundColor;
  final String image;
  final String label;
  final bool isSelected;

  FilterCard(
      {this.primaryColor,
      this.backgroundColor,
      this.image,
      this.label,
      this.isSelected});
}

class _FilterCardState extends State<FilterCard> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              Style.containerRadius,
            ),
            border: Border.all(
              color:
                  widget.isSelected ? widget.primaryColor : Colors.transparent,
              width: 3,
            ),
            color: widget.backgroundColor,
          ),
          child: Center(
            child: Image.asset(widget.image, width: 68, height: 68),
          ),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: Container(
            decoration: BoxDecoration(
              color: widget.isSelected ? widget.primaryColor : Colors.white,
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(
                    Style.containerRadius,
                  ),
                  topLeft: Radius.circular(40)),
            ),
            child: Padding(
              padding: EdgeInsets.fromLTRB(20, 8, 10, 8),
              child: Style.bodyText(
                widget.label,
                color:
                    widget.isSelected ? Colors.white : Style.grayColor,
                fontSize: 14.0,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
