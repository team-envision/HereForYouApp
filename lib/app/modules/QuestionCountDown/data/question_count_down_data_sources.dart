import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fpdart/fpdart.dart';
import 'package:here_for_you_app/common/exceptions/custom_exception.dart';
import 'package:here_for_you_app/common/firebase/firebase_firestore.dart';
import 'package:here_for_you_app/common/models/questionnaire.dart';
import 'package:logger/logger.dart';

class QuestionCountDownDataSources {
  FirebaseFirestoreService firebaseFirestoreService;
  Logger logger = new Logger();

  QuestionCountDownDataSources({required this.firebaseFirestoreService});

  Future<Either<CustomException, QuestionnaireModel>> getQuestionnaire({
    required String questionnaire,
  }) async {
    try {
      final response = await firebaseFirestoreService.getDocument(
        collection: 'questionnaires',
        doc: questionnaire,
      );
      logger.d(response.data());
      return Right(QuestionnaireModel.fromFirestore(response));
    } on FirebaseException catch (e) {
      return Left(
        CustomException(message: e.message ?? "Firebase error occurred"),
      );
    } catch (e) {
      logger.e(e);
      return Left(CustomException(message: e.toString()));
    }
  }
}
