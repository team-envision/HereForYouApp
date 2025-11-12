import 'package:firebase_auth/firebase_auth.dart';
import 'package:fpdart/fpdart.dart';
import 'package:here_for_you_app/common/exceptions/custom_exception.dart';
import 'package:here_for_you_app/common/firebase/firebase_auth.dart';
import 'package:here_for_you_app/common/firebase/firebase_firestore.dart';

class SignupDataSources {
  FirebaseAuthService firebaseAuthService;
  FirebaseFirestoreService firebaseFirestoreService;

  SignupDataSources({
    required this.firebaseAuthService,
    required this.firebaseFirestoreService,
  });

  Future<Either<CustomException, User>> signup({
    required String email,
    required String password,
    required name,
    required String phone,
  }) async {
    try {
      final response = await firebaseAuthService.signUp(
        email: email,
        password: password,
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
    } on FirebaseException catch (e) {
      return Left(CustomException(message: e.message.toString()));
    } catch (e) {
      return Left(CustomException(message: e.toString()));
    }
  }

  // Future<Either<CustomException, User>> googleSignUp() async {
  //
  // }
}
