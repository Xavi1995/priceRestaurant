import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:price/pages/main_user.dart';
import 'package:price/utils/Style.dart';
import 'package:price/widgets/clipPath.dart';

class AuthenticateMain extends StatefulWidget {
  @override
  _AuthenticateMainState createState() => _AuthenticateMainState();
}

class _AuthenticateMainState extends State<AuthenticateMain> {
  @override
  Widget build(BuildContext context) {
    double maxHeight = MediaQuery.of(context).size.height;
    double maxWidth = MediaQuery.of(context).size.width;
    return Stack(
      children: <Widget>[
        Scaffold(
          backgroundColor: Style.primaryColor,
          body: Column(
            children: <Widget>[
              Expanded(
                child: Column(
                  children: <Widget>[
                    Stack(
                      children: <Widget>[
                        Container(
                          height: maxHeight / 2.6,
                          child: Stack(
                            children: <Widget>[
                              ClipPath(
                                clipper: CustomImageClipper(),
                                child: Container(
                                  height: maxHeight / 2.6,
                                  width: maxWidth,
                                  child: Image.asset(
                                    'assets/img/comiendo.jpg',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Container(
                                color: Style.primaryColor.withOpacity(0.5),
                              ),
                              Align(
                                child: Style.title('Your Plan'),
                                alignment: Alignment.center,
                              ),
                            ],
                          ),
                        ),
                        SafeArea(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              Column(
                                children: <Widget>[
                                  Padding(
                                    padding: Style.lateralPadding,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: <Widget>[
                                        SizedBox(height: maxHeight / 2),
                                        Style.button(
                                          'Start now',
                                          () {
                                            _goToMainVC();
                                          },
                                          color: Colors.white,
                                        ),
                                        SizedBox(height: 20),
                                        Style.outlineButton(
                                          'Sign in',
                                          () {},
                                          fontweight: FontWeight.w300,
                                        ),
                                        SizedBox(height: 6),
                                        Text(
                                          'Forgot your password?',
                                          textAlign: TextAlign.center,
                                          style: GoogleFonts.montserrat(
                                            fontSize: Style.fontSizeMedium,
                                            fontWeight: FontWeight.w300,
                                            color: Colors.white,
                                            decoration:
                                                TextDecoration.underline,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                padding:
                    EdgeInsets.symmetric(vertical: Style.lateralPaddingValue),
                child: Padding(
                  padding: EdgeInsets.only(
                    right: Style.lateralPaddingValue,
                  ),
                  child: Container(
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        GestureDetector(
                          child: Container(
                            decoration: BoxDecoration(
                              color: Style.containerColor,
                              borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(20),
                                topRight: Radius.circular(20),
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(8),
                              child: Stack(
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      SizedBox(width: 20),
                                      SvgPicture.asset(
                                          'assets/icons/google.svg',
                                          height: 22,
                                          width: 22),
                                    ],
                                  ),
                                  Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      'Sign in with Google',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w300,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        GestureDetector(
                          child: Container(
                            decoration: BoxDecoration(
                              color: Style.containerColor,
                              borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(20),
                                topRight: Radius.circular(20),
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(8),
                              child: Stack(
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      SizedBox(width: 20),
                                      SvgPicture.asset(
                                          'assets/icons/instagram.svg',
                                          height: 22,
                                          width: 22),
                                    ],
                                  ),
                                  Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      'Sign in with Instagram',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w300,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  void _goToMainVC() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => MainVc(),
      ),
    );
  }
}
