import 'package:firebase_auth/firebase_auth.dart';
import 'package:fpdart/fpdart.dart';
import 'package:here_for_you_app/common/exceptions/custom_exception.dart';
import 'package:here_for_you_app/common/firebase/firebase_auth.dart';
import 'package:here_for_you_app/common/firebase/firebase_firestore.dart';

class LoginDataSources {
  final FirebaseAuthService firebaseAuthService;
  final FirebaseFirestoreService firebaseFirestoreService;

  LoginDataSources({
    required this.firebaseAuthService,
    required this.firebaseFirestoreService,
  });

  Future<Either<CustomException, User>> login(
      String email,
      String password,
      ) async {
    try {
      User? response = await firebaseAuthService.login(email, password);

      if (response != null) {
        return Right(response);
      } else {
        return Left(
          CustomException(message: "Something went wrong: User is null"),
        );
      }
    } on FirebaseAuthException catch (e) {
      String errorMessage = e.message ?? "Authentication failed";

      switch (e.code) {
        case 'user-not-found':
          errorMessage = "No user found with this email";
          break;
        case 'wrong-password':
          errorMessage = "Incorrect password";
          break;
        case 'invalid-email':
          errorMessage = "Invalid email address";
          break;
        case 'user-disabled':
          errorMessage = "This account has been disabled";
          break;
        case 'too-many-requests':
          errorMessage = "Too many attempts. Please try again later";
          break;
        case 'network-request-failed':
          errorMessage = "Network error. Please check your connection";
          break;
      }

      return Left(CustomException(message: errorMessage));
    } catch (e) {
      return Left(CustomException(message: e.toString()));
    }
  }

  Future<Either<CustomException, String>> status() async {
    try {
      final response = await firebaseFirestoreService.getProfileDocument();

      if (response.exists) {
        final status = response.get('status') as String?;

        if (status == null || status.isEmpty) {
          return Left(
            CustomException(
              message: 'Profile status is missing. Please contact support.',
            ),
          );
        }

        return Right(status);
      } else {
        return Left(
          CustomException(
            message: 'Profile not found. Please complete registration.',
          ),
        );
      }
    } on FirebaseException catch (e) {
      return Left(
        CustomException(
          message: e.message ?? "Failed to fetch profile data",
        ),
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