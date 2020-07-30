import 'package:firebase_auth/firebase_auth.dart';
import 'package:price/models/profile.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  //create user object from FirebaseUser

  User _fromFirebaseUser(FirebaseUser user) {
    return user != null ? User(uid: user.uid) : null;
  }

  //auth change user stream

  Stream<User> get user {
    return _auth.onAuthStateChanged.map(_fromFirebaseUser);
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

  Future signInEmailPass(String email, String pass) async {
    try {
      AuthResult result =
          await _auth.signInWithEmailAndPassword(email: email, password: pass);
      FirebaseUser user = result.user;
      return _fromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //register with email & password
  Future registerEmailPass(String email, String pass) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(
          email: email, password: pass);
      FirebaseUser user = result.user;
      return _fromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //sing in with Google Account

  Future googleSignIn()async {
    try{
      GoogleSignInAccount googleUser = await _googleSignIn.signIn();
      GoogleSignInAuthentication googleAuth = await googleUser.authentication;
      AuthCredential credential = GoogleAuthProvider.getCredential(idToken: googleAuth.idToken, accessToken: googleAuth.accessToken);

      AuthResult result = await _auth.signInWithCredential(credential);
      FirebaseUser user = result.user;
      return _fromFirebaseUser(user);
      
    }catch (e){
      print(e.toString());
      return null;
    }
  }

  //sign in with Facebook Account

  // sign out

  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
