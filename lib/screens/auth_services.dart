

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class AuthServices {
  final FirebaseAuth _auth =FirebaseAuth.instance;

  // ini kelas untuk menghendel kondisi ke onek apa kgk
  AuthServices() {
    if (!kIsWeb) { //only for android/IOS
    FirebaseAuth.instance.setSettings(
      appVerificationDisabledForTesting: true,
      // ini biar kita ga ada cachaa(yang kek robot ataau manusia)
      forceRecaptchaFlow: false,
    );
    }
  }
  
  //get current user
  User? get currentUser => _auth.currentUser;

  //auth state changes stream
  Stream<User?> get authStateChanges => _auth.authStateChanges();

  // sign in with email and password
  Future<UserCredential> signInWithEmailAndPassword(String email, String password) async {
    // ini tuh buat ngecek data nya udah ada blm gitu
    try {
      return await _auth.signInWithEmailAndPassword(
        email: email,
        password: password
      );
      // kalo succes maka akan di lempar ke data base cuman kalo eror kita bakal rethrow(catch)
    } catch (e) {
      rethrow;
    }
  }
}