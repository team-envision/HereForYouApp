import 'package:get/get.dart';
import 'package:here_for_you_app/common/services/location_service.dart';

import '../controllers/edit_profile_controller.dart';
import '../states/edit_profile_state.dart';

class EditProfileViewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditProfileViewController>(
      () => EditProfileViewController(
        state: EditProfileState(),
        locationService: LocationService(),
      ),
    );
  }
}
