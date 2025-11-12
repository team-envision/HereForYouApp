import 'package:firebase_auth/firebase_auth.dart';
import 'package:logger/logger.dart';

class FirebaseAuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Logger logger = Logger();

  Future<void> logout() async {
    try {
      await _auth.signOut();
    } catch (e) {
      logger.e(e);
      rethrow;
    }
  }

  Future<void> reloadUser() async {
    try {
      await _auth.currentUser?.reload();
    } catch (e) {
      logger.e(e);
      rethrow;
    }
  }

  Future<User> getUser() async {
    try {
      await reloadUser();
      return _auth.currentUser!;
    } catch (e) {
      logger.e(e);
      rethrow;
    }
  }

  ///user signup
  Future<User?> signUp({
    required String email,
    required String password,
  }) async {
    try {
      final userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      logger.d("User created: ${userCredential.user?.uid}");
      return userCredential.user;
    } catch (e) {
      logger.e(e);
      rethrow;
    }
  }

  ///login method
  Future<User?> login(String email, String password) async {
    try {
      final userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      logger.d("User logged in: ${userCredential.user?.uid}");
      return userCredential.user;
    } catch (e) {
      logger.e(e);
      rethrow;
    }
  }

  User? get currentUser => _auth.currentUser;
}
