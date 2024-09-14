import 'package:get/get.dart';

import '../modules/emergency_contact/bindings/emergency_contact_binding.dart';
import '../modules/emergency_contact/views/emergency_contact_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.EMERGENCY_CONTACT;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.EMERGENCY_CONTACT,
      page: () =>EmergencyContactView(),
      binding: EmergencyContactBinding(),
    ),
  ];
}
