import 'package:flutter/material.dart';
import 'package:price/utils/Style.dart';

class PrioritiesPage extends StatefulWidget {
  @override
  _PrioritiesPageState createState() => _PrioritiesPageState();
}

class _PrioritiesPageState extends State<PrioritiesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: Style.lateralPaddingValue,
                vertical: 20,
              ),
              child: GestureDetector(
                child: Row(
                  children: [
                    Icon(Icons.arrow_back_ios,
                        color: Style.primaryColor, size: 15.0),
                    Style.bodyText('back', color: Style.primaryColor),
                  ],
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ),
            SizedBox(height: 20),
            Style.bodyTitle(
              'Your priorities',
              color: Style.primaryColor,
            ),
          ],
        ),
      ),
    );
  }
}
