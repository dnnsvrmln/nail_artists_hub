import 'package:firebase_auth/firebase_auth.dart';

import 'package:nail_artists_hub/commons/logger.dart';

class AuthService {
  static final _commonsLogger = CommonsLogger(loggerClass: 'AuthService');
  static final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future signInAnonymous() async {
    try {
      var result = await _firebaseAuth.signInAnonymously();
      return result.user;
    } catch (e) {
      _commonsLogger.logError(e.toString());
      return;
    }
  }
}
