import 'dart:async';

import 'package:flutter/material.dart';
import 'package:price/models/filter.dart';
import 'package:price/utils/Style.dart';
import 'package:flutter_range_slider/flutter_range_slider.dart' as RS;

class Step2 extends StatefulWidget {
  @override
  _Step2State createState() => _Step2State();

  final List<Filter> filters;

  Step2({this.filters});
}

class _Step2State extends State<Step2> {
  StreamController<bool> _canGoNext = StreamController<bool>.broadcast();
  StreamController<int> _distanceState = StreamController<int>.broadcast();
  TextEditingController locationController = TextEditingController();
  TextEditingController timeController = TextEditingController();

  int indexSelected = 4;

  @override
  Widget build(BuildContext context) {
    double minPrice = 8.00;
    double maxPrice = 35.00;
    List<Filter> trueFilters = [];

    for (int i = 0; i < widget.filters.length; i++) {
      if (widget.filters[i].state == true) {
        trueFilters.add(widget.filters[i]);
      }
    }
    for (int i = 0; i < trueFilters.length; i++) {
      print(trueFilters[i].title);
    }
    double maxHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Style.primaryColor,
      body: StreamBuilder(
          stream: _canGoNext.stream,
          initialData: false,
          builder: (context, canGoSnapshot) {
            return Stack(
              children: <Widget>[
                SafeArea(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Padding(
                          padding: Style.extraFullPadding,
                          child: Style.bodyTitle('Step 2 : Parameters',
                              fontSize: Style.fontSizeBodyPlus),
                        ),
                        SizedBox(height: 20),
                        Container(
                          height: maxHeight * 6 / 7,
                          decoration: BoxDecoration(
                            color: Style.backgroundColor,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(60),
                            ),
                          ),
                          child: Padding(
                            padding: Style.lateralPadding,
                            child: Column(
                              children: <Widget>[
                                SizedBox(height: 20),
                                Style.bodyText(
                                    'Give me some parameters to make a better plan',
                                    color: Style.grayColor,
                                    fontSize: 14.0),
                                SizedBox(height: 20),
                                ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: trueFilters.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    switch (trueFilters[index].title) {
                                      case 'Price':
                                        return MoneyRange(
                                          minPrice: minPrice,
                                          maxPrice: maxPrice,
                                        );
                                        break;
                                      case 'Location':
                                        return Padding(
                                          padding: EdgeInsets.only(bottom: 20),
                                          child: Material(
                                            elevation: 3,
                                            borderRadius:
                                                BorderRadius.circular(16),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(16),
                                                color: Colors.white,
                                              ),
                                              child: Padding(
                                                padding: EdgeInsets.all(
                                                  Style.lateralPaddingValue,
                                                ),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment
                                                          .stretch,
                                                  children: <Widget>[
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: <Widget>[
                                                        Row(
                                                          children: <Widget>[
                                                            Image.asset(
                                                                'assets/icons/locationIcon.png',
                                                                height: 38,
                                                                width: 38),
                                                            SizedBox(width: 8),
                                                            Style.bodyText(
                                                                'Location',
                                                                color: Colors
                                                                    .black,
                                                                fontSize: 20.0),
                                                          ],
                                                        ),
                                                        Icon(Icons.refresh,
                                                            color: Style
                                                                .grayColor),
                                                      ],
                                                    ),
                                                    SizedBox(height: 10),
                                                    Style.bodyText(
                                                        'Distance from current location',
                                                        color: Style.grayColor,
                                                        fontSize: 14.0),
                                                    SizedBox(height: 10),
                                                    StreamBuilder(
                                                        stream: _distanceState
                                                            .stream,
                                                        initialData:
                                                            indexSelected,
                                                        builder: (context,
                                                            snapshot) {
                                                          print(snapshot.data);
                                                          return Row(
                                                            children: <Widget>[
                                                              Expanded(
                                                                flex: 1,
                                                                child: snapshot
                                                                            .data ==
                                                                        0
                                                                    ? Style.button(
                                                                        'near',
                                                                        () {
                                                                        indexSelected =
                                                                            0;
                                                                        _distanceState
                                                                            .add(indexSelected);
                                                                      },
                                                                        fontSize:
                                                                            14.0,
                                                                        textColor:
                                                                            Colors
                                                                                .white,
                                                                        padding:
                                                                            EdgeInsets.all(
                                                                                0),
                                                                        borderRadiusValue:
                                                                            20.0)
                                                                    : Style
                                                                        .outlineButton(
                                                                        'near',
                                                                        () {
                                                                          indexSelected =
                                                                              0;
                                                                          _distanceState
                                                                              .add(indexSelected);
                                                                        },
                                                                        fontSize:
                                                                            14.0,
                                                                        textColor:
                                                                            Style.primaryColor,
                                                                        padding:
                                                                            EdgeInsets.all(0),
                                                                        borderRadiusValue:
                                                                            20.0,
                                                                        borderColor:
                                                                            Style.primaryColor,
                                                                        color: Colors
                                                                            .transparent,
                                                                      ),
                                                              ),
                                                              SizedBox(
                                                                  width: 4),
                                                              Expanded(
                                                                flex: 1,
                                                                child: snapshot
                                                                            .data ==
                                                                        1
                                                                    ? Style
                                                                        .button(
                                                                        'far',
                                                                        () {
                                                                          indexSelected =
                                                                              1;
                                                                          _distanceState
                                                                              .add(indexSelected);
                                                                        },
                                                                        fontSize:
                                                                            14.0,
                                                                        textColor:
                                                                            Colors.white,
                                                                        padding:
                                                                            EdgeInsets.all(0),
                                                                        borderRadiusValue:
                                                                            20.0,
                                                                      )
                                                                    : Style
                                                                        .outlineButton(
                                                                        'far',
                                                                        () {
                                                                          indexSelected =
                                                                              1;
                                                                          _distanceState
                                                                              .add(indexSelected);
                                                                        },
                                                                        fontSize:
                                                                            14.0,
                                                                        textColor:
                                                                            Style.primaryColor,
                                                                        padding:
                                                                            EdgeInsets.all(0),
                                                                        borderRadiusValue:
                                                                            20.0,
                                                                        borderColor:
                                                                            Style.primaryColor,
                                                                        color: Colors
                                                                            .transparent,
                                                                      ),
                                                              ),
                                                              SizedBox(
                                                                  width: 4),
                                                              Expanded(
                                                                flex: 1,
                                                                child: snapshot
                                                                            .data ==
                                                                        2
                                                                    ? Style
                                                                        .button(
                                                                        'far away',
                                                                        () {
                                                                          indexSelected =
                                                                              2;
                                                                          _distanceState
                                                                              .add(indexSelected);
                                                                        },
                                                                        fontSize:
                                                                            14.0,
                                                                        textColor:
                                                                            Colors.white,
                                                                        padding:
                                                                            EdgeInsets.all(0),
                                                                        borderRadiusValue:
                                                                            20.0,
                                                                      )
                                                                    : Style
                                                                        .outlineButton(
                                                                        'far away',
                                                                        () {
                                                                          indexSelected =
                                                                              2;
                                                                          _distanceState
                                                                              .add(indexSelected);
                                                                        },
                                                                        fontSize:
                                                                            14.0,
                                                                        textColor:
                                                                            Style.primaryColor,
                                                                        padding:
                                                                            EdgeInsets.all(0),
                                                                        borderRadiusValue:
                                                                            20.0,
                                                                        borderColor:
                                                                            Style.primaryColor,
                                                                        color: Colors
                                                                            .transparent,
                                                                      ),
                                                              )
                                                            ],
                                                          );
                                                        }),
                                                    SizedBox(height: 20),
                                                    Style.bodyText(
                                                        'Know the location ?',
                                                        color: Style.grayColor,
                                                        fontSize: 14.0),
                                                    SizedBox(height: 20),
                                                    Theme(
                                                      data: Theme.of(context)
                                                          .copyWith(
                                                        primaryColor:
                                                            Colors.grey,
                                                      ),
                                                      child: Style.textField(
                                                        'Location...',
                                                        locationController,
                                                        context,
                                                        prefixIcon: Icon(
                                                          Icons.location_on,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        );
                                        break;
                                      case 'Time':
                                        return Padding(
                                          padding: EdgeInsets.only(
                                            bottom: 20,
                                          ),
                                          child: Material(
                                            elevation: 3,
                                            borderRadius:
                                                BorderRadius.circular(16),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.all(
                                                  Radius.circular(16),
                                                ),
                                                color: Colors.white,
                                              ),
                                              child: Padding(
                                                padding: EdgeInsets.all(
                                                  Style.lateralPaddingValue,
                                                ),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: <Widget>[
                                                    Row(
                                                      children: <Widget>[
                                                        Image.asset(
                                                            'assets/icons/timeIcons.png',
                                                            height: 38,
                                                            width: 38),
                                                        SizedBox(width: 8),
                                                        Style.bodyText('Time',
                                                            color: Colors.black,
                                                            fontSize: 20.0),
                                                        SizedBox(height: 20),
                                                      ],
                                                    ),
                                                    SizedBox(height: 20),
                                                    Style.bodyText(
                                                      'I dont\'t wait more than...',
                                                      color: Colors.grey,
                                                    ),
                                                    SizedBox(height: 20),
                                                    Style.textField(
                                                        'Minutes',
                                                        timeController,
                                                        context),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        );
                                        break;
                                      default:
                                        return Container();
                                    }
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 100,
                        ),
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    color: Style.backgroundColor,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: Style.outlineButton(
                              'back',
                              () {
                                Navigator.pop(context);
                              },
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
                              'See restaurants',
                              canGoSnapshot.data
                                  ? () {
                                      //TODO:
                                    }
                                  : null,
                              fontSize: Style.fontSizeSmall,
                              textColor: Colors.white,
                              borderRadiusValue: 20.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            );
          }),
    );
  }
}

class MoneyRange extends StatelessWidget {
  double minPrice;
  double maxPrice;

  int divisions;
  bool showValueIndicator;
  int valueIndicatorMaxDecimals;
  bool forceValueIndicator;
  Color overlayColor;
  Color activeTrackColor;
  Color inactiveTrackColor;
  Color thumbColor;
  Color valueIndicatorColor;
  Color activeTickMarkColor;

  static const Color defaultActiveTrackColor = Style.priceAccentColor;
  static const Color defaultInactiveTrackColor = Style.grayColor;
  static const Color defaultActiveTickMarkColor = Style.priceAccentColor;
  static const Color defaultThumbColor = Style.priceAccentColor;
  static const Color defaultValueIndicatorColor = Style.priceAccentColor;
  static const Color defaultOverlayColor = Style.priceAccentColor;

  MoneyRange({
    this.maxPrice,
    this.minPrice,
    this.divisions,
    this.showValueIndicator: true,
    this.valueIndicatorMaxDecimals: 1,
    this.forceValueIndicator: false,
    this.overlayColor: defaultOverlayColor,
    this.activeTrackColor: defaultActiveTrackColor,
    this.inactiveTrackColor: defaultInactiveTrackColor,
    this.thumbColor: defaultThumbColor,
    this.valueIndicatorColor: defaultValueIndicatorColor,
    this.activeTickMarkColor: defaultActiveTickMarkColor,
  });

  @override
  Widget build(BuildContext context) {
    StreamController<List<double>> pricesStream =
        StreamController<List<double>>.broadcast();

    List<double> prices = [4.00, 20.0];

    return StreamBuilder(
        stream: pricesStream.stream,
        initialData: prices,
        builder: (context, snapshot) {
          return Padding(
            padding: EdgeInsets.only(bottom: 10),
            child: Material(
              elevation: 3,
              borderRadius: BorderRadius.circular(16),
              shadowColor: Colors.black,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: EdgeInsets.all(Style.lateralPaddingValue),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Image.asset('assets/icons/priceIcon.png',
                                  height: 38, width: 38),
                              SizedBox(width: 8),
                              Style.bodyText('Price',
                                  color: Colors.black, fontSize: 20.0),
                              SizedBox(width: 4),
                              Style.bodyText('range',
                                  color: Style.grayColor, fontSize: 20.0),
                            ],
                          ),
                          Icon(Icons.refresh, color: Style.grayColor),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: <Widget>[
                          Style.bodyText('€',
                              color: Style.grayColor, fontSize: 15.0),
                          SizedBox(width: 2),
                          Style.bodyText(
                              snapshot.data[0].toString().substring(0, 2),
                              /*
                              snapshot.data[0].toString().length >= 3
                                  ? snapshot.data[0].toString().substring(0, 2)
                                  : snapshot.data[0].toString().substring(0, 2),
                                  */
                              color: Style.grayColor,
                              fontSize: 15.0),
                          SizedBox(width: 2),
                          Style.bodyText(
                            '-',
                            color: Style.grayColor,
                          ),
                          SizedBox(width: 2),
                          Style.bodyText('€',
                              color: Style.grayColor, fontSize: 15.0),
                          SizedBox(width: 2),
                          Style.bodyText(
                              snapshot.data[1].toString().substring(0, 3),
                              color: Style.grayColor,
                              fontSize: 15.0),
                        ],
                      ),
                      SizedBox(height: 20),
                      SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          overlayColor: overlayColor,
                          activeTickMarkColor: activeTickMarkColor,
                          activeTrackColor: activeTrackColor,
                          inactiveTrackColor: /*inactiveTrackColor*/ Colors
                              .grey.shade300,
                          trackHeight: 1.0,
                          thumbColor: thumbColor,
                          valueIndicatorColor: valueIndicatorColor,
                          showValueIndicator: showValueIndicator
                              ? ShowValueIndicator.always
                              : ShowValueIndicator.onlyForDiscrete,
                        ),
                        child: RS.RangeSlider(
                          min: 0.00,
                          max: 50.0,
                          upperValue: maxPrice,
                          lowerValue: minPrice,
                          showValueIndicator: true,
                          onChanged:
                              (double newLowerValue, double newUpperValue) {
                            maxPrice = newUpperValue;
                            minPrice = newLowerValue;
                            prices = [newLowerValue, newUpperValue];

                            pricesStream.add(prices);
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
