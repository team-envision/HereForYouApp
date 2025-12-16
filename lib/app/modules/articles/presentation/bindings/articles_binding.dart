import 'package:get/get.dart';
import 'package:here_for_you_app/app/modules/articles/data/articles_data_sources.dart';
import 'package:here_for_you_app/app/modules/articles/presentation/states/articles_state.dart';
import 'package:here_for_you_app/common/firebase/firebase_firestore.dart';

import '../controllers/articles_controller.dart';

class ArticlesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ArticlesController>(
      () => ArticlesController(
        state: ArticlesState(),
        dataSources: ArticlesDataSources(
          firebaseFirestoreService: FirebaseFirestoreService(),
        ),
      ),
    );
  }
}
