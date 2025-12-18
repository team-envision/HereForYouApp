import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fpdart/fpdart.dart';
import 'package:get/get.dart';
import 'package:here_for_you_app/common/exceptions/custom_exception.dart';
import 'package:here_for_you_app/common/firebase/firebase_firestore.dart';
import 'package:logger/logger.dart';

import '../models/results.dart';

class ResultService extends GetxController {
  final FirebaseFirestoreService firebaseFirestoreService;
  Logger logger = Logger();

  static ResultService get to => Get.find();

  ResultService({required this.firebaseFirestoreService});

  final resultsModel = ResultsModel.empty().obs;

  Future<Either<CustomException, ResultsModel>> get({
    bool forceRefresh = false,
  }) async {
    try {
      if (!forceRefresh && resultsModel.value.monday.mentalScore != 0) {
        return Right(resultsModel.value);
      }

      final response = await firebaseFirestoreService.getDocument(
        collection: "assessments",
      );

      if (response.exists) {
        final data = response.data() as Map<String, dynamic>;
        logger.d(response.data());
        final fetchedResults = ResultsModel.fromJson(data);
        resultsModel.value = fetchedResults;
        return Right(fetchedResults);
      } else {
        final emptyResults = ResultsModel.empty();
        resultsModel.value = emptyResults;
        return Right(emptyResults);
      }
    } on FirebaseException catch (e) {
      return Left(CustomException(message: e.message ?? "Firebase error"));
    } catch (e) {
      return Left(CustomException(message: e.toString()));
    }
  }

  Future<Either<CustomException, void>> setToday({
    required DailyScore dailyScore,
    String? mentalRecommendation,
    String? stressRecommendation,
  }) async {
    try {
      final updatedModel = resultsModel.value
          .updateToday(dailyScore)
          .copyWith(
            mentalRecommendation: mentalRecommendation,
            stressRecommendation: stressRecommendation,
          );
      await firebaseFirestoreService.updateDocument(
        collection: "assessments",
        data: updatedModel.toJson(),
      );
      resultsModel.value = updatedModel;

      return const Right(null);
    } catch (e) {
      return Left(CustomException(message: e.toString()));
    }
  }

  void clear() {
    resultsModel.value = ResultsModel.empty();
  }
}
