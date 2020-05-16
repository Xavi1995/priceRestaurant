import 'package:flutter/material.dart';
import 'package:price/pages/authenticate/register_page.dart';
import 'package:price/services/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  AuthService _auth = AuthService();
  String name = '';
  String pass = '';
  @override
  Widget build(BuildContext context) {
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
                      Form(
                        child: Column(
                          children: <Widget>[
                            TextField(
                              onChanged: (val) {
                                setState(() {
                                  name = val;
                                });
                              },
                            ),
                            SizedBox(height: 10),
                            TextField(
                              obscureText: true,
                              onChanged: (val) {
                                setState(() {
                                  pass = val;
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: Colors.brown,
                            ),
                            child: FlatButton(
                              child: Text(
                                'Sign In Anonymously',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400),
                              ),
                              onPressed: () async {
                                /*dynamic result = await _auth.signInAnon();
                                if (result == null) {
                                  print('error in sign in');
                                } else {
                                  print(result.uid);
                                }
                                */
                              },
                            ),
                          ),
                          SizedBox(height: 10),
                          Align(
                            alignment: Alignment.center,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  'Dont have account?',
                                ),
                                SizedBox(width: 4),
                                GestureDetector(
                                  child: Text(
                                    'Register here.',
                                    style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      color: Colors.brown,
                                    ),
                                  ),
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Register()),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
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
