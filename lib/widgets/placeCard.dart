import 'package:flutter/material.dart';
import 'package:price/models/place.dart';
import 'package:price/utils/Style.dart';
import 'package:price/utils/Utils.dart';

class PlaceCard extends StatefulWidget {
  String image;
  Place place;
  final double rating;

  PlaceCard({this.place, this.image, this.rating});
  @override
  _PlaceCardState createState() => _PlaceCardState();
}

class _PlaceCardState extends State<PlaceCard> {
  String description =
      'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod...';

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      width: 300,
      child: Stack(
        children: <Widget>[
          Container(
            height: 300,
            width: 300,
            decoration: BoxDecoration(
              color: Style.backgroundColor,
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
            ),
            child: Container(
              height: 120,
              width: 300,
              //color: Style.containerColor,
              child: Stack(
                children: <Widget>[
                  Positioned(
                    bottom: 0,
                    child: Padding(
                      padding: Style.lateralPadding,
                      child: Column(
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Utils.starsIndicator(widget.rating),
                              Container(
                                height: 15,
                                width: 15,
                                decoration: BoxDecoration(
                                    color: Style.healthyAccentColor,
                                    borderRadius: BorderRadius.circular(4)),
                              )
                            ],
                          ),
                          Container(
                            width: 300,
                            height: 80,
                            child: Style.bodyText(
                              description,
                              maxLines: 3,
                              color: Colors.black,
                              fontSize: Style.fontSizeSmall,
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
          Container(
            height: 220,
            width: 300,
            decoration: BoxDecoration(
              color: Style.backgroundColor,
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                image: widget.image == null
                    ? Center(
                        child: Style.bodyText('No Image',
                            color: Style.primaryColor,
                            fontWeight: FontWeight.w300),
                      )
                    : AssetImage(widget.image),
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
                decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.3),
                    borderRadius: BorderRadius.all(Radius.circular(20)))),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: Container(
              height: 200,
              width: 300,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Style.bodyTitle(
                    widget.place.name,
                    color: Colors.white,
                    fontWeight: FontWeight.w300,
                  ),
                  SizedBox(height: 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Icon(
                        Icons.location_on,
                        color: Colors.white,
                      ),
                      SizedBox(width: 4),
                      Style.bodyText(widget.place.adress,
                          color: Colors.white,
                          fontSize: Style.fontSizeSuperSmall,
                          fontWeight: FontWeight.w300,
                          maxLines: 1),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
