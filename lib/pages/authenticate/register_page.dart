import 'package:flutter/material.dart';
import 'package:price/services/auth.dart';

class Register extends StatefulWidget {
  final Function toggleView;
  Register({this.toggleView});
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  AuthService _auth = AuthService();
  String email = '';
  String pass = '';
  String error = '';
  final _formKey = GlobalKey<FormState>();

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
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            TextFormField(
                              validator: (val) =>
                                  val.isEmpty ? 'Please enter an email' : null,
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
                            SizedBox(height: 10),
                            Text(
                              error,
                              style: TextStyle(
                                color: Colors.red,
                              ),
                            ),
                          ],
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
                                  'Go !',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w400),
                                ),
                                onPressed: () async {
                                  if (_formKey.currentState.validate()) {
                                    dynamic result = await _auth
                                        .registerEmailPass(email, pass);
                                    if (result == null) {
                                      setState(() {
                                        error = 'Please supply a valid email';
                                      });
                                    }
                                  }
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
                                    'Have an account Already?',
                                  ),
                                  SizedBox(width: 4),
                                  GestureDetector(
                                    child: Text(
                                      'Sing in here.',
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
                        )
                      ],
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
