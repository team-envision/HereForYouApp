import 'package:get/get.dart';
import 'package:here_for_you_app/app/modules/basicInfoPage/data/basic_info_page_data_source.dart';
import 'package:here_for_you_app/common/firebase/firebase_firestore.dart';
import 'package:here_for_you_app/common/services/location_service.dart';

import '../controllers/basic_info_page_controller.dart';
import '../states/basic_info_page_state.dart';

class BasicInfoPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BasicInfoPageController>(
      () => BasicInfoPageController(
        state: BasicInfoPageState(),
        dataSource: BasicInfoPageDataSource(
          firebaseFirestoreService: FirebaseFirestoreService(),
        ),
        locationService: LocationService(),
      ),
    );
  }
}
