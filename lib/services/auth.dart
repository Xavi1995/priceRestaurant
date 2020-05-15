import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //sing in anon
  Future signInAnon() async {
    try {
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;
      return user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
  //sign in with email & password

  //register with email & password

  //sing in with Google Account

  //register with Google Account

  //sign in with Facebook Account

  //register with Facebook Account

  // sign out

}
