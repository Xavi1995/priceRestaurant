import 'dart:io' show Platform;

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:price/pages/root_page.dart';
import 'package:price/utils/MyLocalizationsDelegate.dart';
import 'package:price/utils/Style.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TargetPlatform targetPlatform;

    if (Platform.isAndroid) {
      targetPlatform = TargetPlatform.android;
    } else if (Platform.isIOS) {
      targetPlatform = TargetPlatform.iOS;
    }
    return OverlaySupport(
      child: MaterialApp(
        title: 'YourPlan',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          platform: targetPlatform,
          appBarTheme: AppBarTheme(
            brightness: Brightness.dark,
            color: Colors.transparent,
            elevation: 0,
            iconTheme: IconThemeData(
              color: Color(0XFF383838),
            ),
          ),
          backgroundColor: Colors.white,
          primaryColor: Style.primaryColor,
          accentColor: Style.primaryColor,
        ),
        home: RootPage(),
        localizationsDelegates:[
          const MyLocalizationsDelegate(),
          GlobalMaterialLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
        ],
        supportedLocales: [
          const Locale('es'),
          const Locale('en'),
          const Locale('cat'),
        ],
      ),
    );

    /*StreamProvider<User>.value(
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
    */
  }
}
