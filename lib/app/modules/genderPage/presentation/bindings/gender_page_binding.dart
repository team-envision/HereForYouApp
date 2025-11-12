import 'package:get/get.dart';
import 'package:here_for_you_app/common/firebase/firebase_firestore.dart';

import '../../data/gender_page_data_source.dart';
import '../controllers/gender_page_controller.dart';
import '../states/gender_page_state.dart';

class GenderPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GenderPageController>(
      () => GenderPageController(
        state: GenderPageState(),
        dataSource: GenderPageDataSource(
          firebaseFirestoreService: FirebaseFirestoreService(),
        ),
      ),
    );
  }
}
