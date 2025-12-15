import 'package:get/get.dart';
import 'package:here_for_you_app/app/modules/editProfileView/data/edit_profile_data_sources.dart';
import 'package:here_for_you_app/common/models/user.dart';
import 'package:here_for_you_app/common/utils/snackbars.dart';
import 'package:logger/logger.dart';

import '../states/edit_profile_state.dart';

class EditProfileViewController extends GetxController {
  EditProfileState state;
  EditProfileDataSources dataSources;
  UserModel model = UserModel.empty();
  Logger logger = Logger();

  EditProfileViewController({required this.state, required this.dataSources});

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
    final result = await dataSources.update(model: model);
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

  Future<void> getData() async {
    final result = await dataSources.getData();
    result.fold(
      (error) {
        Snackbars.info(
          title: "Unable to load data, whatever you enter will be updated",
          message: error.message,
        );
      },
      (data) {
        model = data;
        state.nameController.text = model.name;
        state.phoneController.text = model.phone;
        state.emailController.text = model.email;
        state.ageController.text = model.age;
        state.weightController.text = model.weight;
        state.heightController.text = model.height;
        state.gender.value = model.gender;
      },
    );
    await Future.delayed(const Duration(seconds: 1));
    state.isDataLoading.value = false;
  }

  void onChanged(value) {
    state.gender.value = value;
  }

  @override
  void onInit() {
    super.onInit();
    state.isDataLoading = true.obs;
    getData();
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
