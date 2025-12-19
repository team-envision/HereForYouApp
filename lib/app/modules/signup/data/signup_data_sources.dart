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

  Future<Either<CustomException, User>> signUp({
    required String email,
    required String password,
  }) async {
    try {
      final response = await firebaseAuthService.signUp(
        email: email,
        password: password,
      );

      if (response != null) {
        return Right(response);
      } else {
        return Left(
          CustomException(message: "Something went wrong: User is null"),
        );
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

  Future<Either<CustomException, void>> verifyPhoneNumber({
    required String phoneNumber,
    required Function(PhoneAuthCredential) verificationCompleted,
    required Function(FirebaseAuthException) verificationFailed,
    required Function(String, int?) codeSent,
    required Function(String) codeAutoRetrievalTimeout,
  }) async {
    try {
      await firebaseAuthService.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: verificationCompleted,
        verificationFailed: verificationFailed,
        codeSent: codeSent,
        codeAutoRetrievalTimeout: codeAutoRetrievalTimeout,
      );
      return const Right(null);
    } catch (e) {
      return Left(CustomException(message: e.toString()));
    }
  }

  Future<Either<CustomException, User>> linkPhoneCredential(
    PhoneAuthCredential credential,
  ) async {
    try {
      final user = await firebaseAuthService.linkPhoneCredential(credential);
      if (user != null) {
        return Right(user);
      } else {
        return Left(CustomException(message: "Failed to link phone number"));
      }
    } on FirebaseAuthException catch (e) {
      String errorMessage = e.message ?? "Failed to link phone";

      switch (e.code) {
        case 'provider-already-linked':
          errorMessage = "This phone number is already linked";
          break;
        case 'invalid-verification-code':
          errorMessage = "Invalid OTP code";
          break;
        case 'credential-already-in-use':
          errorMessage = "This phone number is already in use";
          break;
      }

      return Left(CustomException(message: errorMessage));
    } catch (e) {
      return Left(CustomException(message: e.toString()));
    }
  }

  Future<Either<CustomException, void>> createUserDocument({
    required String name,
    required String email,
    required String phone,
  }) async {
    try {
      await firebaseFirestoreService.addDocument(
        collection: 'profile',
        data: {
          'name': name,
          'email': email,
          'phone': phone,
          'status': 'gender',
          'createdAt': FieldValue.serverTimestamp(),
        },
      );
      return const Right(null);
    } on FirebaseException catch (e) {
      return Left(
        CustomException(message: e.message ?? "Failed to create user document"),
      );
    } catch (e) {
      return Left(CustomException(message: e.toString()));
    }
  }
}
