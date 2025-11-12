import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fpdart/fpdart.dart';
import 'package:here_for_you_app/common/exceptions/custom_exception.dart';
import 'package:here_for_you_app/common/firebase/firebase_firestore.dart';

class GenderPageDataSource {
  FirebaseFirestoreService firebaseFirestoreService;

  GenderPageDataSource({required this.firebaseFirestoreService});

  Future<Either<CustomException, bool>> updateGender(
    Map<String, dynamic> data,
  ) async {
    try {
      await firebaseFirestoreService.updateProfile(data: data);
      return right(true);
    } on FirebaseException catch (e) {
      return left(CustomException(message: e.message.toString()));
    } catch (e) {
      return left(CustomException(message: e.toString()));
    }
  }
}
