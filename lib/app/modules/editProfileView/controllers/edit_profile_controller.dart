import 'package:get/get.dart';
import 'package:here_for_you_app/common/models/user.dart';
import 'package:here_for_you_app/common/services/user_service.dart';
import 'package:here_for_you_app/common/utils/snackbars.dart';

import '../states/edit_profile_state.dart';

class EditProfileViewController extends GetxController {
  EditProfileState state;
  UserModel model = UserService.to.userModel.value;

  EditProfileViewController({required this.state});

  Future<void> saveDetails() async {
    if (state.isLoading.value) {
      Snackbars.info(
        title: "Please wait",
        message: "Hold on while we update your details",
      );
    }
    if (!state.formKey.currentState!.validate()) {
      return;
    }
    state.isLoading.value = true;
    model = model.copyWith(
      name: state.nameController.text.trim(),
      phone: state.phoneController.text.trim(),
      gender: state.gender.value,
      age: state.ageController.text.trim(),
      weight: state.weightController.text.trim(),
      height: state.heightController.text.trim(),
    );
    final result = await UserService.to.set(newUserModel: model);
    result.fold(
      (error) {
        state.isLoading.value = false;
        Snackbars.error(
          title: "Could not update details",
          message: error.message,
        );
      },
      (data) {
        state.isLoading.value = false;
        Get.back();
        Snackbars.success(
          message: "Details updated successfully",
          title: 'Success',
        );
      },
    );
  }

  void onChanged(value) {
    state.gender.value = value;
  }

  @override
  void onInit() {
    super.onInit();
    state.nameController.text = model.name;
    state.phoneController.text = model.phone;
    state.emailController.text = model.email;
    state.ageController.text = model.age;
    state.weightController.text = model.weight;
    state.heightController.text = model.height;
    state.gender.value = model.gender;
  }

  @override
  void onClose() {
    state.nameController.dispose();
    state.phoneController.dispose();
    state.emailController.dispose();
    state.ageController.dispose();
    state.weightController.dispose();
    state.heightController.dispose();
    super.onClose();
  }
}
