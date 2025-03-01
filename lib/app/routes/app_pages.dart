import 'package:get/get.dart';

import '../modules/AiChatBotScreen/bindings/ai_chat_bot_screen_binding.dart';
import '../modules/AiChatBotScreen/views/ai_chat_bot_screen_view.dart';
import '../modules/MindAnchorMainScreen/bindings/mind_anchor_main_screen_binding.dart';
import '../modules/MindAnchorMainScreen/views/mind_anchor_main_screen_view.dart';
import '../modules/ProfilePage/bindings/profile_page_binding.dart';
import '../modules/ProfilePage/views/profile_page_view.dart';
import '../modules/QuestionCountDown/bindings/question_count_down_binding.dart';
import '../modules/QuestionCountDown/views/question_count_down_view.dart';
import '../modules/QuestionScreen/bindings/question_screen_binding.dart';
import '../modules/QuestionScreen/views/DASS21_question_screen_view.dart';
import '../modules/SleepDiary/bindings/sleep_diary_binding.dart';
import '../modules/SleepDiary/views/sleep_diary_view.dart';
import '../modules/basicInfoPage/bindings/basic_info_page_binding.dart';
import '../modules/basicInfoPage/views/basic_info_page_view.dart';
import '../modules/editProfileView/bindings/edit_profile_view_binding.dart';
import '../modules/editProfileView/views/edit_profile_view.dart';
import '../modules/emergency_contact/bindings/emergency_contact_binding.dart';
import '../modules/emergency_contact/views/emergency_contact_view.dart';
import '../modules/feedBack/bindings/feed_back_binding.dart';
import '../modules/feedBack/views/feed_back_view.dart';
import '../modules/genderPage/bindings/gender_page_binding.dart';
import '../modules/genderPage/views/gender_page_view.dart';
import '../modules/getStarted/bindings/get_started_binding.dart';
import '../modules/getStarted/views/get_started_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/mentalScore/bindings/mental_score_binding.dart';
import '../modules/mentalScore/views/mental_score_view.dart';
import '../modules/moodQuality/bindings/mood_quality_binding.dart';
import '../modules/moodQuality/views/mood_quality_view.dart';
import '../modules/password_view/bindings/password_view_binding.dart';
import '../modules/password_view/views/password_view_view.dart';
import '../modules/splashScreen/bindings/splash_screen_binding.dart';
import '../modules/splashScreen/views/splash_screen_view.dart';
import '../views/views/mind_test_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SLEEP_DIARY;

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
      page: () => DASS21QuestionView(),
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
    GetPage(
      name: _Paths.BASIC_INFO_PAGE,
      page: () => const BasicInfoView(),
      binding: BasicInfoPageBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE_PAGE,
      page: () => const ProfilePageView(),
      binding: ProfilePageBinding(),
    ),
    GetPage(
      name: _Paths.MOOD_QUALITY,
      page: () => const MoodQualityView(),
      binding: MoodQualityBinding(),
    ),
    GetPage(
      name: _Paths.GENDER_PAGE,
      page: () => const GenderPageView(),
      binding: GenderPageBinding(),
    ),
    GetPage(
      name: _Paths.FEED_BACK,
      page: () => const FeedBackView(),
      binding: FeedBackBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH_SCREEN,
      page: () => const SplashScreenView(),
      binding: SplashScreenBinding(),
    ),
    GetPage(
      name: _Paths.GET_STARTED,
      page: () => const GetStartedView(),
      binding: GetStartedBinding(),
    ),
    GetPage(
      name: _Paths.MIND_ANCHOR_MAIN_SCREEN,
      page: () => const MindAnchorMainScreenView(),
      binding: MindAnchorMainScreenBinding(),
    ),
    GetPage(
      name: _Paths.QUESTION_COUNT_DOWN,
      page: () => QuestionCountdownView(),
      binding: QuestionCountDownBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_PROFILE_VIEW,
      page: () => EditProfile(),
      binding: EditProfileViewBinding(),
    ),
    GetPage(
      name: _Paths.EMERGENCY_CONTACT,
      page: () => EmergencyContactView(),
      binding: EmergencyContactBinding(),
    ),
    GetPage(
      name: _Paths.SLEEP_DIARY,
      page: () => const SleepDiaryView(),
      binding: SleepDiaryBinding(),
    ),
  ];
}
