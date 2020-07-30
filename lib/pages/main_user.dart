import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:price/models/place.dart';
import 'package:price/pages/step1_page.dart';
import 'package:price/utils/MyLocalizations.dart';
import 'package:price/utils/Style.dart';
import 'package:price/utils/Utils.dart';
import 'package:price/widgets/clipPath.dart';
import 'package:price/widgets/placeCard.dart';

class MainVc extends StatefulWidget {
  @override
  _MainVcState createState() => _MainVcState();
}

class _MainVcState extends State<MainVc> {
  int _currentIndex = 0;
  bool transform = false;
  StreamController<List<Place>> places =
      StreamController<List<Place>>.broadcast();

  StreamController<int> selectedIndexStream = StreamController<int>.broadcast();
  StreamController<bool> transformStream = StreamController<bool>.broadcast();

  @override
  Widget build(BuildContext context) {
    List<String> images = [
      'assets/img/9reinas.jpg',
      'assets/img/antigua.jpg',
      'assets/img/BarcelonaMilano.jpg',
      'assets/img/CincSentits.jpg',
      'assets/img/comiendo.jpg',
      'assets/img/DonKilo.jpg',
    ];

    List<double> rates = [
      4.2,
      3.5,
      4.8,
      4.3,
      4.1,
      4.2,
    ];

    double maxHeight = MediaQuery.of(context).size.height;
    double maxWidth = MediaQuery.of(context).size.width;
    return AnimatedContainer(
      duration: Duration(milliseconds: 1000),
      child: StreamBuilder(
        stream: transformStream.stream,
        initialData: transform,
        builder: (context, snapshot) {
          return Transform(
            transform: Matrix4.translationValues(
                transform ? maxWidth * 2 / 3 : 0, transform ? maxHeight / 3 : 0, 0)
              ..scale(transform ? 0.7 : 1.0),
            child: Scaffold(
              backgroundColor: Style.backgroundColor,
              appBar: Style.appBar(
                'Your Plan',
                color: Style.primaryColor,
                leading: IconButton(
                  icon: Icon(Icons.menu),
                  onPressed: () {
                    transform = !transform;
                    transformStream.add(transform);
                    print(transform);
                  },
                ),
              ),
              body: SafeArea(
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      Stack(
                        children: <Widget>[
                          Container(
                            color: Style.containerColor,
                            width: double.infinity,
                            height: 40,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: Style.backgroundColor,
                                borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(60))),
                            width: double.infinity,
                            height: 40,
                          )
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: Style.lateralPaddingValue,
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Style.containerColor,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(40),
                              bottomLeft: Radius.circular(40),
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(
                                20, 20, Style.lateralPaddingValue, 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: <Widget>[
                                Style.bodyText('Let\'s plan !',
                                    color: Colors.black,
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.normal),
                                SizedBox(height: 10),
                                Style.bodyText(
                                  'We make your plan,',
                                  color: Colors.black,
                                ),
                                Style.bodyText('you just have to enjoy it.',
                                    color: Colors.black),
                                SizedBox(height: 50),
                                Row(
                                  children: <Widget>[
                                    Expanded(
                                      child: Style.outlineButton(
                                        'Repeat one',
                                        () {},
                                        fontSize: Style.fontSizeSmall,
                                        borderColor: Style.primaryColor,
                                        color: Colors.transparent,
                                        textColor: Style.primaryColor,
                                        borderRadiusValue: 20.0,
                                      ),
                                    ),
                                    SizedBox(width: 8),
                                    Expanded(
                                      child: Style.button(
                                        'Start new',
                                        () {
                                          _goToConfigurablePlan();
                                        },
                                        fontSize: Style.fontSizeSmall,
                                        textColor: Colors.white,
                                        borderRadiusValue: 20.0,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                        child: Stack(
                          children: <Widget>[
                            Container(
                              color: Style.containerColor,
                              width: double.infinity,
                              height: 60,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: Style.backgroundColor,
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(60),
                                ),
                              ),
                              width: double.infinity,
                              height: 60,
                            )
                          ],
                        ),
                      ),
                      Container(
                        width: maxWidth,
                        decoration: BoxDecoration(
                          color: Style.containerColor,
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: Style.lateralPaddingValue + 20,
                              top: 20,
                              bottom: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Style.bodyText('Some restaurants you could like',
                                  color: Colors.black,
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.normal),
                              SizedBox(
                                height: 20,
                              ),
                              StreamBuilder(
                                stream: places.stream,
                                initialData: Utils.places,
                                builder: (BuildContext context,
                                    AsyncSnapshot<List<Place>> snapshot) {
                                  return Container(
                                    height: 300,
                                    child: ListView.builder(
                                      itemCount: 6,
                                      scrollDirection: Axis.horizontal,
                                      shrinkWrap: true,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return Padding(
                                          padding: EdgeInsets.only(
                                              right: Style.lateralPaddingValue),
                                          child: Container(
                                            child: PlaceCard(
                                              place: snapshot.data[index],
                                              image: images[index] == null
                                                  ? null
                                                  : images[index],
                                              rating: rates[index],
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  );
                                },
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
          );
        }
      ),
    );
  }

  void _goToConfigurablePlan() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => Step1()));
  }
}
