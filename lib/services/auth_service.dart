import 'package:firebase_auth/firebase_auth.dart';

import 'package:nail_artists_hub/shared/logger.dart';

class AuthService {
  static final _logger = Logger(loggerClass: 'AuthService');
  static final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Stream<User?> get user {
    return _firebaseAuth.authStateChanges();
  }

  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      return await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (e) {
      _logger.logError(e.toString());
      return null;
    }
  }

  Future signInWithEmailAndPassWord(String email, String password) async {
    try {
      return await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (e) {
      _logger.logError(e.toString());
      return;
    }
  }
}
