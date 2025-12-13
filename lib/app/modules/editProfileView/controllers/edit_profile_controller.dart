import 'package:get/get.dart';
import 'package:here_for_you_app/app/modules/editProfileView/states/edit_profile_state.dart';

class EditProfileViewController extends GetxController {
  EditProfileState state;

  EditProfileViewController({required this.state});

  void saveDetails() {
    //TODO: implement logic
  }

  void onChanged(value) => state.gender = value;

  @override
  void onClose() {
    state.nameController.dispose();
    state.phoneController.dispose();
    state.emailController.dispose();
    state.ageController.dispose();
    state.weightController.dispose();
    super.onClose();
  }
}
