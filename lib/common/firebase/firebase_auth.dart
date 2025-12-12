import 'package:firebase_auth/firebase_auth.dart';
import 'package:logger/logger.dart';

class FirebaseAuthService {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final Logger logger = Logger();

  Future<void> logout() async {
    try {
      await firebaseAuth.signOut();
      logger.d("User logged out successfully");
    } catch (e) {
      logger.e("Logout error: $e");
      rethrow;
    }
  }

  Future<User?> linkPassword({required String password}) async {
    try {
      User? user = await getUser();
      if (user == null) {
        logger.e("Error while linking password: User not found");
        throw Exception("User not found while linking password");
      }
      String? email = user.email;

      if (email == null) {
        logger.e("Error while linking password: Email not found");
        throw Exception("Email not found while linking password");
      }

      AuthCredential credential = EmailAuthProvider.credential(
        email: email,
        password: password,
      );

      UserCredential? userCredential = await user.linkWithCredential(
        credential,
      );
      logger.d("Password linked successfully: ${user.uid}");

      return userCredential.user;
    } catch (e) {
      logger.e("Link password error: $e");
      rethrow;
    }
  }

  Future<void> sendVerificationEmail() async {
    try {
      ActionCodeSettings actionCodeSettings = ActionCodeSettings(
        url: 'https://hereforyou-59786.firebaseapp.com',
        handleCodeInApp: true,
        androidPackageName: 'com.example.here_for_you_app',
      );
      await firebaseAuth.currentUser?.sendEmailVerification();
      logger.d("Verification email sent successfully");
    } catch (e) {
      logger.e("Send verification email error: $e");
      rethrow;
    }
  }

  Future<void> reloadUser() async {
    try {
      await firebaseAuth.currentUser?.reload();
      logger.d("User reloaded successfully");
    } catch (e) {
      logger.e("Reload user error: $e");
      rethrow;
    }
  }

  Future<User?> getUser() async {
    try {
      await reloadUser();
      logger.d("User fetched successfully");
      return firebaseAuth.currentUser;
    } catch (e) {
      logger.e("Get user error: $e");
      rethrow;
    }
  }

  Future<User?> signUp({
    required String email,
    required String password,
  }) async {
    try {
      final userCredential = await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      User? user = userCredential.user;
      logger.d("Sign up in firebase: ${userCredential.user?.uid}");
      return user;
    } catch (e) {
      logger.e("Error in firebase sign up: $e");
      rethrow;
    }
  }

  Future<User?> login(String email, String password) async {
    try {
      final userCredential = await firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      logger.d("User logged in firebase: ${userCredential.user?.uid}");
      return userCredential.user;
    } catch (e) {
      logger.e("Error in firebase login: $e");
      rethrow;
    }
  }

  Future<void> verifyPhoneNumber({
    required String phoneNumber,
    required Function(PhoneAuthCredential) verificationCompleted,
    required Function(FirebaseAuthException) verificationFailed,
    required Function(String, int?) codeSent,
    required Function(String) codeAutoRetrievalTimeout,
  }) async {
    try {
      await firebaseAuth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: verificationCompleted,
        verificationFailed: verificationFailed,
        codeSent: codeSent,
        codeAutoRetrievalTimeout: codeAutoRetrievalTimeout,
        timeout: const Duration(seconds: 60),
      );
      logger.d("Phone verification initiated for: $phoneNumber");
    } catch (e) {
      logger.e("Phone verification error: $e");
      rethrow;
    }
  }

  Future<User?> linkPhoneCredential(PhoneAuthCredential credential) async {
    try {
      User? user = await getUser();
      if (user == null) {
        throw Exception("User not found");
      }

      UserCredential userCredential = await user.linkWithCredential(credential);
      logger.d("Phone credential linked successfully: ${user.uid}");

      return userCredential.user;
    } catch (e) {
      logger.e("Link phone credential error: $e");
      rethrow;
    }
  }
}