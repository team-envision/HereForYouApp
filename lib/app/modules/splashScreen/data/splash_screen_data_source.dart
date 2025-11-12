import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fpdart/fpdart.dart';
import 'package:here_for_you_app/common/exceptions/custom_exception.dart';
import 'package:here_for_you_app/common/firebase/firebase_firestore.dart';

class SplashScreenDataSource {
  FirebaseFirestoreService firebaseFirestoreService;

  SplashScreenDataSource({required this.firebaseFirestoreService});

  Future<Either<CustomException, String>> status() async {
    try {
      final response = await firebaseFirestoreService.getProfileDocument();
      if (response.exists) {
        String status = response.get('status');
        return Right(status);
      } else {
        return Left(
          CustomException(
            message:
                'We are unable to fetch your data. Please try again later.',
          ),
        );
      }
    } on FirebaseException catch (e) {
      return Left(CustomException(message: e.message.toString()));
    } catch (e) {
      return Left(CustomException(message: e.toString()));
    }
  }
}
