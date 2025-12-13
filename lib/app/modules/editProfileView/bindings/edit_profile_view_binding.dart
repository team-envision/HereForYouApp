import 'package:get/get.dart';
import 'package:here_for_you_app/app/modules/editProfileView/states/edit_profile_state.dart';

import '../controllers/edit_profile_controller.dart';

class EditProfileViewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditProfileViewController>(
      () => EditProfileViewController(state: EditProfileState()),
    );
  }
}
