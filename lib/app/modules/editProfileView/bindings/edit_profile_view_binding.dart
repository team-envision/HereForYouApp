import 'package:get/get.dart';

import '../controllers/edit_profile_controller.dart';


class EditProfileViewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditProfileController>(() => EditProfileController());
  }
}
