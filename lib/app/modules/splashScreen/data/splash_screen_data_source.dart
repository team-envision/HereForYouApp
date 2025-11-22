import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fpdart/fpdart.dart';
import 'package:here_for_you_app/common/exceptions/custom_exception.dart';
import 'package:here_for_you_app/common/firebase/firebase_firestore.dart';
import 'package:logger/logger.dart';

class SplashScreenDataSource {
  final FirebaseFirestoreService firebaseFirestoreService;
  final Logger logger = Logger();

  SplashScreenDataSource({required this.firebaseFirestoreService});

  Future<Either<CustomException, String>> status() async {
    try {
      final response = await firebaseFirestoreService.getProfileDocument();

      if (response.exists) {
        final status = response.get('status') as String?;

        if (status == null || status.isEmpty) {
          logger.e("Profile status is null or empty");
          return Left(
            CustomException(
              message: 'Profile status is missing. Please contact support.',
            ),
          );
        }

        return Right(status);
      } else {
        logger.e("Profile document does not exist");
        return Left(
          CustomException(
            message: 'Profile not found. Please complete registration.',
          ),
        );
      }
    } on FirebaseException catch (e) {
      logger.e("Firebase error fetching status: ${e.code} - ${e.message}");
      return Left(
        CustomException(
          message: e.message ?? "Failed to fetch profile data",
        ),
      );
    } catch (e) {
      logger.e("Unexpected error fetching status: $e");
      return Left(CustomException(message: e.toString()));
    }
  }
}