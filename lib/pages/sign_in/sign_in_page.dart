import 'package:flutter/material.dart';
import 'package:price/services/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    AuthService _auth = AuthService();
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      double _screenHeight = constraints.maxHeight;
      double _screenWidth = constraints.maxWidth;
      return Scaffold(
        backgroundColor: Colors.brown[100],
        body: Column(
          //mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          //crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Align(
              alignment: Alignment.center,
              child: Container(
                color: Colors.brown[200],
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                  height: _screenHeight * 1 / 3,
                  width: _screenWidth * 0.8,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          TextField(),
                          SizedBox(height: 10),
                          TextField(),
                        ],
                      ),
                      Container(
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(4), color: Colors.brown,),
                        
                        child: FlatButton(
                          child: Text(
                            'Sign In Anonymously',
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: () async{
                            dynamic result = await _auth.signInAnon();
                            if(result == null){
                              print('error in sign in');
                            } else{
                              print('sign in');
                              print(result.uid);
                            }
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
