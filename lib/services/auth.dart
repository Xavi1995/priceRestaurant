import 'package:firebase_auth/firebase_auth.dart';
import 'package:price/models/profile.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;



  //create user object from FirebaseUser

  User _fromFirebaseUser(FirebaseUser user){
return user != null ? User(uid: user.uid ) : null;
  }


  //auth change user stream

  Stream<User> get user {
    return _auth.onAuthStateChanged
    .map(_fromFirebaseUser);
  }

  //sing in anon
  Future signInAnon() async {
    try {
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;
      return _fromFirebaseUser(user);
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

  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch(e){
      print(e.toString());
      return null;
    }
  }

}
