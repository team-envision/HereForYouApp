import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fpdart/fpdart.dart';
import 'package:here_for_you_app/common/exceptions/custom_exception.dart';
import 'package:here_for_you_app/common/firebase/firebase_firestore.dart';

import '../../../../common/models/emergency_contact.dart';

class EmergencyContactDataSources {
  final FirebaseFirestoreService firebaseFirestoreService;

  EmergencyContactDataSources({required this.firebaseFirestoreService});

  Future<Either<CustomException, void>> update({
    required EmergencyContactModel model,
  }) async {
    try {
      await firebaseFirestoreService.addDocument(
        collection: "emergency",
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

  Future<Either<CustomException, EmergencyContactModel>> get() async {
    try {
      final snapshot = await firebaseFirestoreService.getDocument(
        collection: "emergency",
      );
      return Right(EmergencyContactModel.fromFirestore(snapshot));
    } on FirebaseException catch (e) {
      return Left(
        CustomException(message: e.message ?? "Firebase error occurred"),
      );
    } catch (e) {
      return Left(CustomException(message: e.toString()));
    }
  }
}
