import 'package:get/get.dart';

import '../modules/AiChatBotScreen/bindings/ai_chat_bot_screen_binding.dart';
import '../modules/AiChatBotScreen/views/ai_chat_bot_screen_view.dart';
import '../modules/QuestionScreen/bindings/question_screen_binding.dart';
import '../modules/QuestionScreen/views/question_screen_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/mentalScore/bindings/mental_score_binding.dart';
import '../modules/mentalScore/views/mental_score_view.dart';
import '../modules/password_view/bindings/password_view_binding.dart';
import '../modules/password_view/views/password_view_view.dart';
import '../views/views/mind_test_screen_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.AI_CHAT_BOT_SCREEN;

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
      page: () => QuestionView(),
      binding: QuestionBinding(),
    ),
    GetPage(
      name: _Paths.MENTAL_SCORE,
      page: () => const MentalScoreView(),
      binding: MentalScoreBinding(),
    ),
    GetPage(
      name: _Paths.MindTestScreenView,
      page: () => const MindTestScreenView(),
    ),
    GetPage(
      name: _Paths.AI_CHAT_BOT_SCREEN,
      page: () => const AiChatBotScreenView(),
      binding: AiChatBotScreenBinding(),
    ),
  ];
}
