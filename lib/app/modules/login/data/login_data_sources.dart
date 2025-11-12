import 'package:firebase_auth/firebase_auth.dart';
import 'package:fpdart/fpdart.dart';
import 'package:here_for_you_app/common/exceptions/custom_exception.dart';
import 'package:here_for_you_app/common/firebase/firebase_auth.dart';
import 'package:here_for_you_app/common/firebase/firebase_firestore.dart';

class LoginDataSources {
  FirebaseAuthService firebaseAuthService;
  FirebaseFirestoreService firebaseFirestoreService;

  LoginDataSources({required this.firebaseAuthService, required this.firebaseFirestoreService});

  Future<Either<CustomException, User>> login(
    String email,
    String password,
  ) async {
    try {
      User? response = await firebaseAuthService.login(email, password);
      if (response != null) {
        return Right(response);
      } else {
        return Left(CustomException(message: "Something went wrong: User is null"));
      }
    } on FirebaseAuthException catch (e) {
      return Left(CustomException(message: e.message.toString()));
    } catch (e) {
      return Left(CustomException(message: e.toString()));
    }
  }
  Future<Either<CustomException, String>> status() async {
    try {
      final response = await firebaseFirestoreService.getProfileDocument();
      if (response.exists) {
        String status = response.get('status');
        return Right(status);
      } else {
        return Left(
          CustomException(
            message:
            'We are unable to fetch your data. Please try again later.',
          ),
        );
      }
    } on FirebaseException catch (e) {
      return Left(CustomException(message: e.message.toString()));
    } catch (e) {
      return Left(CustomException(message: e.toString()));
    }
  }
}
