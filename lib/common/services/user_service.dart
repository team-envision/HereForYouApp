import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fpdart/fpdart.dart';
import 'package:get/get.dart';
import 'package:here_for_you_app/common/exceptions/custom_exception.dart';
import 'package:here_for_you_app/common/firebase/firebase_firestore.dart';
import 'package:here_for_you_app/common/models/user.dart';

class UserService extends GetxController {
  final FirebaseFirestoreService firebaseFirestoreService;

  static UserService get to => Get.find();

  UserService({required this.firebaseFirestoreService});

  final userModel = UserModel.empty().obs;

  Future<Either<CustomException, UserModel>> get({
    bool forceRefresh = false,
  }) async {
    try {
      if (!forceRefresh && userModel.value.email.isNotEmpty) {
        return Right(userModel.value);
      }

      final response = await firebaseFirestoreService.getDocument(
        collection: "profile",
      );

      if (response.exists) {
        final fetchedUser = UserModel.fromFirestore(response);
        userModel.value = fetchedUser;

        return Right(fetchedUser);
      } else {
        return Left(CustomException(message: "User not found"));
      }
    } on FirebaseException catch (e) {
      return Left(
        CustomException(message: e.message ?? "Firebase error occurred"),
      );
    } catch (e) {
      return Left(CustomException(message: e.toString()));
    }
  }

  Future<Either<CustomException, void>> set({
    required UserModel newUserModel,
  }) async {
    try {
      await firebaseFirestoreService.updateDocument(
        collection: "profile",
        data: newUserModel.toJson(),
      );
      userModel.value = newUserModel;

      return const Right(null);
    } on FirebaseException catch (e) {
      return Left(
        CustomException(message: e.message ?? "Firebase error occurred"),
      );
    } catch (e) {
      return Left(CustomException(message: e.toString()));
    }
  }

  void clear() {
    userModel.value = UserModel.empty();
  }
}
