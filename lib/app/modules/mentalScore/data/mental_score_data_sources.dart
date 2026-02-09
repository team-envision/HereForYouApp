import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fpdart/fpdart.dart';
import 'package:here_for_you_app/common/exceptions/custom_exception.dart';
import 'package:here_for_you_app/common/firebase/firebase_ai.dart';
import 'package:here_for_you_app/common/local_storage/class%20LocalStorage.dart';
import 'package:here_for_you_app/common/models/user_assessment.dart';
import 'package:here_for_you_app/core/dio_client.dart';
import 'package:logger/logger.dart';

class MentalScoreDataSources {
  LocalStorage localStorage;
  FirebaseAi firebaseAi;
  DioClient dioClient;
  Logger logger = Logger();

  MentalScoreDataSources({
    required this.localStorage,
    required this.firebaseAi,
    required this.dioClient,
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
      logger.d("Analyzed User response ${response.text}");
      final Map<String, dynamic> jsonMap = jsonDecode(response.text!);
      return Right(UserAssessmentModel.fromJson(jsonMap));
    } on FirebaseException catch (e) {
      return Left(
        CustomException(message: e.message ?? "Firebase Error occurred"),
      );
    } catch (e) {
      return Left(CustomException(message: e.toString()));
    }
  }
}
