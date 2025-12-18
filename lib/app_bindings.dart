import 'package:get/get.dart';
import 'package:here_for_you_app/common/firebase/firebase_firestore.dart';
import 'package:here_for_you_app/common/services/result_service.dart';

import 'common/services/user_service.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<UserService>(
      UserService(firebaseFirestoreService: FirebaseFirestoreService()),
      permanent: true,
    );
    Get.put<ResultService>(
      ResultService(firebaseFirestoreService: FirebaseFirestoreService()),
      permanent: true,
    );
  }
}
