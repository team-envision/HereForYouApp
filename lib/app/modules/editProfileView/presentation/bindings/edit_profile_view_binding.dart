import 'package:get/get.dart';
import 'package:here_for_you_app/app/modules/editProfileView/data/edit_profile_data_sources.dart';
import 'package:here_for_you_app/common/firebase/firebase_firestore.dart';

import '../controllers/edit_profile_controller.dart';
import '../states/edit_profile_state.dart';

class EditProfileViewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditProfileViewController>(
      () => EditProfileViewController(
        state: EditProfileState(),
        dataSources: EditProfileDataSources(
          firebaseFirestoreService: FirebaseFirestoreService(),
        ),
      ),
    );
  }
}
