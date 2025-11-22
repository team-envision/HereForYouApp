import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fpdart/fpdart.dart';
import 'package:here_for_you_app/common/exceptions/custom_exception.dart';
import 'package:here_for_you_app/common/firebase/firebase_auth.dart';
import 'package:here_for_you_app/common/firebase/firebase_firestore.dart';

class SignupDataSources {
  final FirebaseAuthService firebaseAuthService;
  final FirebaseFirestoreService firebaseFirestoreService;

  SignupDataSources({
    required this.firebaseAuthService,
    required this.firebaseFirestoreService,
  });

  Future<Either<CustomException, User>> signup({
    required String email,
    required String password,
    required String name,
    required String phone,
  }) async {
    try {
      final response = await firebaseAuthService.signUp(
        displayName: name,
        email: email,
        password: password,
        phoneNumber: phone
      );

      if (response != null) {
        await firebaseFirestoreService.addUser(
          name: name,
          email: email,
          phone: phone,
          uid: response.uid,
        );
        return Right(response);
      } else {
        return Left(
          CustomException(message: "Something went wrong: User is null"),
        );
      }
    } on FirebaseAuthException catch (e) {
      String errorMessage = e.message ?? "Sign up failed";

      switch (e.code) {
        case 'email-already-in-use':
          errorMessage = "This email is already registered";
          break;
        case 'invalid-email':
          errorMessage = "Invalid email address";
          break;
        case 'operation-not-allowed':
          errorMessage = "Email/password sign up is not enabled";
          break;
        case 'weak-password':
          errorMessage = "Password is too weak";
          break;
      }

      return Left(CustomException(message: errorMessage));
    } on FirebaseException catch (e) {
      return Left(
        CustomException(message: e.message ?? "Firebase error occurred"),
      );
    } catch (e) {
      return Left(CustomException(message: e.toString()));
    }
  }

  Future<Either<CustomException, User>> googleSignUp() async {
    try {
      final response = await firebaseAuthService.signInWithGoogle();
      if (response == null) {
        return Left(CustomException(message: "Google sign-in was cancelled"));
      } else {
        return Right(response);
      }
    } on FirebaseException catch (e) {
      return Left(
        CustomException(message: e.message ?? "Firebase error occurred"),
      );
    } catch (e) {
      return Left(CustomException(message: e.toString()));
    }
  }

  Future<Either<CustomException, DocumentSnapshot>> getProfile() async {
    try {
      DocumentSnapshot response = await firebaseFirestoreService
          .getProfileDocument();
      return Right(response);
    } on FirebaseException catch (e) {
      return Left(
        CustomException(message: e.message ?? "Firebase error occurred"),
      );
    } catch (e) {
      return Left(CustomException(message: e.toString()));
    }
  }

  Future<Either<CustomException, User?>> getUser() async {
    try {
      final response = await firebaseAuthService.getUser();
      return Right(response);
    } on FirebaseException catch (e) {
      return Left(
        CustomException(message: e.message ?? "Firebase error occurred"),
      );
    } catch (e) {
      return Left(CustomException(message: e.toString()));
    }
  }

  Future<Either<CustomException, User?>> linkPassword({
    required String password,
  }) async {
    try {
      final response = await firebaseAuthService.linkPassword(
        password: password,
      );
      return Right(response);
    } on FirebaseAuthException catch (e) {
      String errorMessage = e.message ?? "Failed to link password";

      switch (e.code) {
        case 'provider-already-linked':
          errorMessage = "This account already has a password";
          break;
        case 'invalid-credential':
          errorMessage = "Invalid password";
          break;
        case 'credential-already-in-use':
          errorMessage = "This email is already in use";
          break;
        case 'weak-password':
          errorMessage = "Password is too weak";
          break;
      }

      return Left(CustomException(message: errorMessage));
    } on FirebaseException catch (e) {
      return Left(
        CustomException(message: e.message ?? "Firebase error occurred"),
      );
    } catch (e) {
      return Left(CustomException(message: e.toString()));
    }
  }

  Future<Either<CustomException, void>> addUser({
    required String email,
    required String name,
    required String phone,
  }) async {
    try {
      await firebaseFirestoreService.updateProfile(
        data: {
          "name": name,
          "email": email,
          "phone": phone,
          "status": "gender",
          "updatedAt": FieldValue.serverTimestamp(),
        },
      );
      return const Right(null);
    } on FirebaseException catch (e) {
      return Left(
        CustomException(message: e.message ?? "Firebase error occurred"),
      );
    } catch (e) {
      return Left(CustomException(message: e.toString()));
    }
  }

  Future<Either<CustomException, void>> sendVerificationEmail() async {
    try {
      await firebaseAuthService.sendVerificationEmail();
      return const Right(null);
    } on FirebaseAuthException catch (e) {
      return Left(
        CustomException(
          message: e.message ?? "Failed to send verification email",
        ),
      );
    } catch (e) {
      return Left(CustomException(message: e.toString()));
    }
  }
}
