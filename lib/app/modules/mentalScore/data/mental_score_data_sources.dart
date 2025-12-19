import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fpdart/fpdart.dart';
import 'package:here_for_you_app/common/exceptions/custom_exception.dart';
import 'package:here_for_you_app/common/firebase/firebase_ai.dart';
import 'package:here_for_you_app/common/local_storage/class%20LocalStorage.dart';
import 'package:here_for_you_app/common/models/user_assessment.dart';

class MentalScoreDataSources {
  LocalStorage localStorage;
  FirebaseAi firebaseAi;

  MentalScoreDataSources({
    required this.localStorage,
    required this.firebaseAi,
  });

  Future<Either<CustomException, Map<String, String>>> getLocalData({
    required String key,
  }) async {
    try {
      final response = await localStorage.getMap(key: key);
      return Right(response);
    } catch (e) {
      return Left(CustomException(message: e.toString()));
    }
  }

  Future<Either<CustomException, UserAssessmentModel>> analyzeUserState({
    required Map<String, String> userAnswers,
  }) async {
    try {
      final response = await firebaseAi.analyzeUserState(
        userAnswers: userAnswers,
      );
      final String? jsonString = response.text;
      if (jsonString == null || jsonString.isEmpty) {
        return Left(CustomException(message: "AI returned an empty response."));
      }
      final Map<String, dynamic> decodedJson = jsonDecode(jsonString);
      final userAssessment = UserAssessmentModel.fromJson(decodedJson);
      return Right(userAssessment);
    } on FirebaseException catch (e) {
      return Left(
        CustomException(message: e.message ?? "Firebase Error occurred"),
      );
    } catch (e) {
      return Left(CustomException(message: e.toString()));
    }
  }
}
