import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fpdart/fpdart.dart';
import 'package:here_for_you_app/common/exceptions/custom_exception.dart';
import 'package:here_for_you_app/common/firebase/firebase_firestore.dart';
import 'package:here_for_you_app/common/models/emergency_contact.dart';

class EmergencyCountDownDataSources {
  FirebaseFirestoreService firebaseFirestoreService;

  EmergencyCountDownDataSources({required this.firebaseFirestoreService});

  Future<Either<CustomException, EmergencyContactModel>> getDetails() async {
    try {
      final response = await firebaseFirestoreService.getDocument(
        collection: "emergency",
      );
      if (response.exists) {
        return Right(EmergencyContactModel.fromFirestore(response));
      } else {
        return Left(CustomException(message: "No data found"));
      }
    } on FirebaseException catch (e) {
      return Left(CustomException(message: e.message ?? "Firebase Exception"));
    } catch (e) {
      return Left(CustomException(message: e.toString()));
    }
  }
}
