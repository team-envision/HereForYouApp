import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fpdart/fpdart.dart';
import 'package:here_for_you_app/common/exceptions/custom_exception.dart';
import 'package:here_for_you_app/common/firebase/firebase_firestore.dart';
import 'package:here_for_you_app/common/models/user.dart';
import 'package:logger/logger.dart';

class EditProfileDataSources {
  FirebaseFirestoreService firebaseFirestoreService;
  Logger logger = Logger();

  EditProfileDataSources({required this.firebaseFirestoreService});

  Future<Either<CustomException, UserModel>> getData() async {
    try {
      final response = await firebaseFirestoreService.getDocument(
        collection: "profile",
      );
      return Right(UserModel.fromFirestore(response));
    } on FirebaseException catch (e) {
      return Left(
        CustomException(message: e.message ?? "Firebase error occurred"),
      );
    } catch (e) {
      return Left(CustomException(message: e.toString()));
    }
  }

  Future<Either<CustomException, void>> update({
    required UserModel model,
  }) async {
    try {
      await firebaseFirestoreService.updateDocument(
        collection: "profile",
        data: model.toJson(),
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
}
