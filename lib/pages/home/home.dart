import 'package:flutter/material.dart';
import 'package:price/services/auth.dart';

class Home extends StatelessWidget {

  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.brown[200],
        title: Text('Your Plan Test'),
        actions: <Widget>[
          FlatButton(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.brown,
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Text(
                  'Log out',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            onPressed: () async{
              await _auth.signOut();
            },
          ),
        ],
      ),
    );
  }
}
