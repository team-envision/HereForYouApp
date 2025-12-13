import 'package:get/get.dart';
import 'package:here_for_you_app/app/modules/emergency_contact/data/emergency_contact_data_sources.dart';
import 'package:here_for_you_app/app/modules/emergency_contact/presentation/states/emergency_contact_state.dart';

import '../../../../../common/models/emergency_contact.dart';
import '../../../../../common/utils/snackbars.dart';

class EmergencyContactController extends GetxController {
  EmergencyContactState state;
  EmergencyContactDataSources dataSources;
  EmergencyContactModel model = EmergencyContactModel.empty();

  EmergencyContactController({required this.state, required this.dataSources});

  Future<void> getData() async {
    final result = await dataSources.get();
    result.fold((error) {}, (data) {
      model = data;
      state.nameController.text = data.name;
      state.phoneController.text = data.number;
      state.emailController.text = data.email;
      state.relationController.text = data.relation;
    });
  }

  @override
  void onInit() {
    super.onInit();
    getData();
  }

  Future<void> save() async {
    if (!state.formKey.currentState!.validate()) {
      return;
    }
    model = model.copyWith(
      name: state.nameController.text.trim(),
      number: state.phoneController.text.trim(),
      email: state.emailController.text.trim(),
      relation: state.relationController.text.trim(),
    );
    state.isLoading.value = true;
    final result = await dataSources.update(model: model);
    result.fold(
      (error) {
        Snackbars.error(
          title: "Sorry, could not update",
          message: error.message,
        );
      },
      (data) {
        Get.back();
        Snackbars.success(
          title: "Success",
          message: "Emergency contact updated successfully",
        );

      },
    );
    state.isLoading.value = false;
  }
}
