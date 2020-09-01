import 'package:flutter/material.dart';
import 'package:price/models/place.dart';
import 'package:price/models/profile.dart';
import 'package:price/pages/wrapper.dart';
import 'package:price/services/auth.dart';
import 'package:price/utils/Utils.dart';
import 'package:provider/provider.dart';
import 'package:price/database/db.dart' as db;

import '../utils/Style.dart';

class RootPage extends StatefulWidget {
  @override
  _RootPageState createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: StreamBuilder(
        stream: db.getPlaces(),
        builder: (BuildContext context, AsyncSnapshot<List<Place>> snapshot) {
          Utils.places = snapshot.data;
          if (snapshot.hasError) {
            return MaterialApp(
              home: Scaffold(
                backgroundColor: Colors.yellow,
                body: Center(
                  child: Text(
                    snapshot.error.toString(),
                  ),
                ),
              ),
            );
          } else if (!snapshot.hasData) {
            return Scaffold(
              backgroundColor: Style.backgroundColor,
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }

          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: Wrapper(),
          );
        },
      ),
    );
  }
}
