import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthHelper {
  static final FirebaseAuth _auth = FirebaseAuth.instance;

  static Future<UserCredential> signIn(String email, String password) async {
    return await _auth.signInWithEmailAndPassword(email: email, password: password);
  }

  static Future<UserCredential> signUp(String email, String password) async {
    return await _auth.createUserWithEmailAndPassword(email: email, password: password);
  }

  static User? get currentUser => _auth.currentUser;

  static Future<void> signOut() async {
    await _auth.signOut();
  }
}
