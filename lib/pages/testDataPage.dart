import 'package:flutter/material.dart';
import 'package:price/models/place.dart';

class TestDataPage extends StatefulWidget {
  List<Place> places;
  TestDataPage({this.places});
  @override
  _TestDataPageState createState() => _TestDataPageState();
}

class _TestDataPageState extends State<TestDataPage> {
  @override
  Widget build(BuildContext context) {
    List<Place> places = widget.places;
    return Scaffold(
      backgroundColor: Colors.brown[100],
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: places.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Container(
                          color: Colors.brown[200],
                          child: Text(places[index].name),
                        ),
                        SizedBox(height: 4)
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
