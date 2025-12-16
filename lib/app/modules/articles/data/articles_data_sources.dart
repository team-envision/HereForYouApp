import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fpdart/fpdart.dart';
import 'package:here_for_you_app/common/exceptions/custom_exception.dart';
import 'package:here_for_you_app/common/firebase/firebase_firestore.dart';
import 'package:here_for_you_app/common/models/article.dart';

class ArticlesDataSources {
  FirebaseFirestoreService firebaseFirestoreService;

  ArticlesDataSources({required this.firebaseFirestoreService});

  Future<Either<CustomException, List<ArticleModel>>> getData() async {
    try {
      final response = await firebaseFirestoreService.getCollection(
        collection: "articles",
      );
      if (response.docs.isEmpty) {
        return Left(CustomException(message: "No articles found"));
      } else {
        final articles = response.docs
            .map((e) => ArticleModel.fromFirestore(e))
            .toList();
        return Right(articles);
      }
    } on FirebaseException catch (e) {
      return Left(
        CustomException(message: e.message ?? "Firebase error occurred"),
      );
    } catch (e) {
      return Left(CustomException(message: e.toString()));
    }
  }
}
