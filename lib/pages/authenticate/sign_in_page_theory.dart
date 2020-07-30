import 'package:flutter/material.dart';
import 'package:price/services/auth.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;
  SignIn({this.toggleView});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  String email = '';
  String pass = '';
  String error = '';
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
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Container(
                  color: Colors.brown[200],
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                    //height: _screenHeight * 1 / 3,
                    //width: _screenWidth * 0.8,
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              TextFormField(
                                validator: (val) => val.isEmpty
                                    ? 'Please enter an email'
                                    : null,
                                onChanged: (val) {
                                  setState(() {
                                    email = val;
                                  });
                                },
                              ),
                              SizedBox(height: 10),
                              TextFormField(
                                validator: (val) => val.length < 6
                                    ? 'Enter a 6+ chars password'
                                    : null,
                                obscureText: true,
                                onChanged: (val) {
                                  setState(() {
                                    pass = val;
                                  });
                                },
                              ),
                              Text(
                                error,
                                style: TextStyle(
                                  color: Colors.red,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 20),
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
                                    if (_formKey.currentState.validate()) {
                                      dynamic result = await _auth
                                          .signInEmailPass(email, pass);
                                      if (result == null) {
                                        setState(() {
                                          error =
                                              'Could not sign in with those credentials';
                                        });
                                      }
                                    }
                                  },
                                ),
                              ),
                            ],
                          ),
                          
                          SizedBox(height: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
                                  color: Colors.white,
                                ),
                                child: FlatButton(
                                  child: Text(
                                    'Sign In with Google account',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  onPressed: () async {
                                   _auth.googleSignIn();
                                  },
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 20),
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
                                    widget.toggleView();
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
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
