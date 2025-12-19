import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fpdart/fpdart.dart';
import 'package:here_for_you_app/common/exceptions/custom_exception.dart';
import 'package:here_for_you_app/common/firebase/firebase_firestore.dart';

class BasicInfoPageDataSource {
  FirebaseFirestoreService firebaseFirestoreService;

  BasicInfoPageDataSource({required this.firebaseFirestoreService});

  Future<Either<CustomException, bool>> update({
    required String age,
    required String height,
    required String weight,
  }) async {
    try {
      await firebaseFirestoreService.updateDocument(
        collection: 'profile',
        data: {
          'age': age,
          'height': height,
          'weight': weight,
          'status': 'complete',
        },
      );
      return right(true);
    } on FirebaseException catch (e) {
      return left(CustomException(message: e.message.toString()));
    } catch (e) {
      return left(CustomException(message: e.toString()));
    }
  }
}
