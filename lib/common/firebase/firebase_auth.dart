import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:logger/logger.dart';

class FirebaseAuthService {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final Logger logger = Logger();
  final GoogleSignIn _googleSignIn = GoogleSignIn.instance;

  Future<void> logout() async {
    try {
      await Future.wait([firebaseAuth.signOut(), _googleSignIn.signOut()]);
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
      await firebaseAuth.currentUser?.sendEmailVerification(actionCodeSettings);
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
    required String displayName,
    required String phoneNumber,
  }) async {
    try {
      final userCredential = await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      User? user = userCredential.user;
      if (user != null) {
        await user.updateDisplayName(displayName);
      }
      logger.d("Sign up in firebase: ${userCredential.user?.uid}");
      return userCredential.user;
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

  Future<User?> signInWithGoogle() async {
    try {
      await _googleSignIn.signOut();
      await _googleSignIn.initialize();

      final GoogleSignInAccount googleUser = await _googleSignIn.authenticate();

      logger.d("User signed in with Google: ${googleUser.email}");

      final GoogleSignInAuthentication googleAuth = googleUser.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken,
      );
      final userCredential = await firebaseAuth.signInWithCredential(
        credential,
      );
      logger.d("Firebase user created/signed in: ${userCredential.user?.uid}");

      return userCredential.user;
    } catch (e) {
      logger.e("Google sign-in error: $e");
      rethrow;
    }
  }
}
