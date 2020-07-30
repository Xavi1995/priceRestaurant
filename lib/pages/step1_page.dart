import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:price/models/filter.dart';
import 'package:price/pages/step2_page.dart';
import 'package:price/utils/Style.dart';
import 'package:price/widgets/filterCard.dart';

class Step1 extends StatefulWidget {
  @override
  _Step1State createState() => _Step1State();
}

class _Step1State extends State<Step1> {
  StreamController<List<Filter>> filterStatesStream =
      StreamController<List<Filter>>.broadcast();

  StreamController<bool> _canGoForward = StreamController<bool>.broadcast();

  @override
  Widget build(BuildContext context) {
    List<Filter> filters = [
      Filter('Location', false),
      Filter('Health', false),
      Filter('Originality', false),
      Filter('Price', false),
      Filter('Time', false),
    ];
    List<String> filterLabels = [
      'Location',
      'Health',
      'Originality',
      'Price',
      'Time',
    ];
    List<String> filterIcons = [
      'assets/icons/locationIcon.png',
      'assets/icons/healthyIcon.png',
      'assets/icons/originalityIcon.png',
      'assets/icons/priceIcon.png',
      'assets/icons/timeIcons.png',
    ];

    List<Color> filterBackgroundColors = [
      Style.locationColor,
      Style.healthyColor,
      Style.originalityColor,
      Style.priceColor,
      Style.timeColor,
    ];

    List<Color> filterPrimaryColors = [
      Style.locationAccentColor,
      Style.healthyAccentColor,
      Style.originalityAccentColor,
      Style.priceAccentColor,
      Style.timeAccentColor,
    ];

    double maxHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Style.primaryColor,
      body: StreamBuilder(
          stream: _canGoForward.stream,
          initialData: false,
          builder: (BuildContext context, AsyncSnapshot<bool> canGoSnapshot) {
            return Stack(
              children: <Widget>[
                SafeArea(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Padding(
                        padding: Style.extraFullPadding,
                        child: Style.bodyTitle('Step 1 : Filters',
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
                              SizedBox(height: 10),
                              Style.bodyTitle('What mean important for you?',
                                  color: Colors.black,
                                  fontSize: Style.fontSizeBodyPlus),
                              SizedBox(height: 20),
                              Style.bodyText('Select at least one filter',
                                  color: Style.grayColor),
                              SizedBox(height: 20),
                              StreamBuilder(
                                  stream: filterStatesStream.stream,
                                  initialData: filters,
                                  builder: (BuildContext context,
                                      AsyncSnapshot<List<Filter>> snapshot) {
                                    return Container(
                                      child: StaggeredGridView.countBuilder(
                                        physics: NeverScrollableScrollPhysics(),
                                        shrinkWrap: true,
                                        crossAxisCount: 4,
                                        itemCount: 5,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          return GestureDetector(
                                            onTap: () {
                                              int count = 0;
                                              snapshot.data[index].state =
                                                  !snapshot.data[index].state;
                                              filterStatesStream
                                                  .add(snapshot.data);
                                              filters = snapshot.data;
                                              for (int i = 0;
                                                  i < filters.length;
                                                  i++) {
                                                if (filters[i].state) {
                                                  _canGoForward.add(true);
                                                }
                                                if (filters[i].state == false) {
                                                  count++;
                                                }
                                                if (count == filters.length) {
                                                  _canGoForward.add(false);
                                                }
                                              }
                                            },
                                            child: FilterCard(
                                              backgroundColor:
                                                  filterBackgroundColors[index],
                                              primaryColor:
                                                  filterPrimaryColors[index],
                                              image: filterIcons[index],
                                              label: filterLabels[index],
                                              isSelected:
                                                  snapshot.data[index].state,
                                            ),
                                          );
                                        },
                                        crossAxisSpacing: 10,
                                        mainAxisSpacing: 10,
                                        staggeredTileBuilder: (int index) {
                                          return StaggeredTile.count(
                                              2, index.isOdd ? 3 : 2);
                                        },
                                      ),
                                    );
                                  }),
                            ],
                          ),
                        ),
                      ),
                    ],
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
                              Icon(Icons.arrow_forward_ios,
                                  color: Style.backgroundColor, size: 15),
                              canGoSnapshot.data
                                  ? () {
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              Step2(filters: filters),
                                        ),
                                      );
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
