import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:logger/logger.dart';

import '../exceptions/custom_exception.dart';
import '../firebase/firebase_firestore.dart';
import '../models/results.dart';

class ResultService extends GetxController {
  final FirebaseFirestoreService firebaseFirestoreService;
  Logger logger = Logger();

  static ResultService get to => Get.find();

  ResultService({required this.firebaseFirestoreService});

  final RxList<DailyScore> results = <DailyScore>[].obs;

  /// Fetches all DailyScore documents from the assessments sub-collection
  Future<Either<CustomException, List<DailyScore>>> fetchAll({
    bool forceRefresh = false,
  }) async {
    try {
      if (!forceRefresh && results.isNotEmpty) {
        return Right(results);
      }

      final querySnapshot = await firebaseFirestoreService.getAssessments();

      final fetchedResults = querySnapshot.docs.map((doc) {
        return DailyScore.fromJson(doc.data() as Map<String, dynamic>);
      }).toList();

      fetchedResults.sort((a, b) => b.date.compareTo(a.date));

      results.assignAll(fetchedResults);
      return Right(results);
    } on FirebaseException catch (e) {
      return Left(CustomException(message: e.message ?? "Firebase error"));
    } catch (e) {
      return Left(CustomException(message: e.toString()));
    }
  }

  /// Saves today's score and updates local state
  Future<Either<CustomException, void>> saveDailyScore(
    DailyScore dailyScore,
  ) async {
    try {
      final String docId = DateFormat('yyyy-MM-dd').format(dailyScore.date);

      await firebaseFirestoreService.firestore
          .collection('profile')
          .doc(firebaseFirestoreService.auth.currentUser!.uid)
          .collection("assessments")
          .doc(docId)
          .set(dailyScore.toJson(), SetOptions(merge: true));
      Logger().d("Rsults updated");
      final index = results.indexWhere(
        (item) => DateUtils.isSameDay(item.date, dailyScore.date),
      );
      if (index != -1) {
        results[index] = dailyScore;
      } else {
        results.insert(0, dailyScore);
      }
      results.refresh();

      return const Right(null);
    } catch (e) {
      return Left(CustomException(message: e.toString()));
    }
  }

  void clear() {
    results.clear();
  }
}
