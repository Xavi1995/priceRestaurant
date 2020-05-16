import 'package:flutter/material.dart';
import 'package:price/models/place.dart';
import 'package:price/pages/wrapper.dart';
import 'package:provider/provider.dart';
import 'package:price/services/auth.dart';
import 'package:price/models/profile.dart';

import 'db.dart' as db;

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
          child: StreamBuilder(
        stream: db.getPlaces(),
        builder: (BuildContext context, AsyncSnapshot<List<Place>> snapshot) {
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
            return Center(child: CircularProgressIndicator());
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
