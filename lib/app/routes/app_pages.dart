import 'package:get/get.dart';

import '../modules/QuestionScreen/bindings/question_screen_binding.dart';
import '../modules/QuestionScreen/views/question_screen_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/password_view/bindings/password_view_binding.dart';
import '../modules/password_view/views/password_view_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.QUESTION_SCREEN;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.PASSWORD_VIEW,
      page: () => const ChangePasswordView(),
      binding: PasswordViewBinding(),
    ),
    GetPage(
      name: _Paths.QUESTION_SCREEN,
      page: () =>  QuestionView(),
      binding: QuestionBinding(),
    ),
  ];
}
