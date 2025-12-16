import 'package:get/get.dart';

import '../modules/AiChatBotScreen/presentation/bindings/ai_chat_bot_screen_binding.dart';
import '../modules/AiChatBotScreen/presentation/views/ai_chat_bot_screen_view.dart';
import '../modules/MindAnchorMainScreen/bindings/mind_anchor_main_screen_binding.dart';
import '../modules/MindAnchorMainScreen/views/mind_anchor_main_screen_view.dart';
import '../modules/ProfilePage/bindings/profile_page_binding.dart';
import '../modules/ProfilePage/views/profile_page_view.dart';
import '../modules/QuestionCountDown/presentation/bindings/question_count_down_binding.dart';
import '../modules/QuestionCountDown/presentation/views/question_count_down_view.dart';
import '../modules/QuestionScreen/bindings/question_screen_binding.dart';
import '../modules/QuestionScreen/views/question_screen_view.dart';
import '../modules/SleepDiary/bindings/sleep_diary_binding.dart';
import '../modules/SleepDiary/views/sleep_diary_view.dart';
import '../modules/articles/presentation/bindings/articles_binding.dart';
import '../modules/articles/presentation/views/articles_view.dart';
import '../modules/basicInfoPage/presentation/bindings/basic_info_page_binding.dart';
import '../modules/basicInfoPage/presentation/views/basic_info_page_view.dart';
import '../modules/changePassword/bindings/change_password_binding.dart';
import '../modules/changePassword/views/change_password_view.dart';
import '../modules/editProfileView/presentation/bindings/edit_profile_view_binding.dart';
import '../modules/editProfileView/presentation/views/edit_profile_view.dart';
import '../modules/emergency_contact/presentation/bindings/emergency_contact_binding.dart';
import '../modules/emergency_contact/presentation/views/emergency_contact_view.dart';
import '../modules/emergency_count_down/bindings/emergency_count_down_binding.dart';
import '../modules/emergency_count_down/views/emergency_count_down_view.dart';
import '../modules/faceLoading/bindings/face_loading_binding.dart';
import '../modules/faceLoading/views/face_loading_view.dart';
import '../modules/feedBack/bindings/feed_back_binding.dart';
import '../modules/feedBack/views/feed_back_view.dart';
import '../modules/forgotPassword/bindings/forgot_password_binding.dart';
import '../modules/forgotPassword/views/forgot_password_view.dart';
import '../modules/genderPage/presentation/bindings/gender_page_binding.dart';
import '../modules/genderPage/presentation/views/gender_page_view.dart';
import '../modules/getStarted/bindings/get_started_binding.dart';
import '../modules/getStarted/views/get_started_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/presentation/bindings/login_binding.dart';
import '../modules/login/presentation/views/login_view.dart';
import '../modules/main/bindings/main_binding.dart';
import '../modules/main/views/main_view.dart';
import '../modules/mentalScore/bindings/mental_score_binding.dart';
import '../modules/mentalScore/views/mental_score_view.dart';
import '../modules/moodQuality/bindings/mood_quality_binding.dart';
import '../modules/moodQuality/views/mood_quality_view.dart';
import '../modules/signup/presentation/bindings/signup_binding.dart';
import '../modules/signup/presentation/views/signup_view.dart';
import '../modules/splashScreen/presentation/bindings/splash_screen_binding.dart';
import '../modules/splashScreen/presentation/views/splash_screen_view.dart';
import '../modules/stressIndicator/bindings/stress_indicator_binding.dart';
import '../modules/stressIndicator/views/stress_indicator_view.dart';
import '../modules/stressLevel/bindings/stress_level_binding.dart';
import '../modules/stressLevel/views/stress_level_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH_SCREEN;

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
      name: _Paths.FORGOT_PASSWORD,
      page: () => const ForgotPasswordView(),
      binding: ForgotPasswordBinding(),
    ),
    GetPage(
      name: _Paths.QUESTION_SCREEN,
      page: () => const QuestionView(),
      binding: QuestionBinding(),
    ),
    GetPage(
      name: _Paths.MENTAL_SCORE,
      page: () => const MentalScoreView(),
      binding: MentalScoreBinding(),
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
      page: () => const QuestionCountdownView(),
      binding: QuestionCountDownBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_PROFILE_VIEW,
      page: () => EditProfileView(),
      binding: EditProfileViewBinding(),
    ),
    GetPage(
      name: _Paths.EMERGENCY_CONTACT,
      page: () => const EmergencyContactView(),
      binding: EmergencyContactBinding(),
    ),
    GetPage(
      name: _Paths.SLEEP_DIARY,
      page: () => const SleepDiaryView(),
      binding: SleepDiaryBinding(),
    ),
    GetPage(
      name: _Paths.CHANGE_PASSWORD,
      page: () => const ChangePasswordView(),
      binding: ChangePasswordBinding(),
    ),
    GetPage(
      name: _Paths.SIGNUP,
      page: () => const SignupView(),
      binding: SignupBinding(),
    ),
    GetPage(
      name: _Paths.STRESS_LEVEL,
      page: () => const StressLevelView(),
      binding: StressLevelBinding(),
    ),
    GetPage(
      name: _Paths.MAIN,
      page: () => const MainView(),
      binding: MainBinding(),
    ),
    GetPage(
      name: _Paths.FACE_LOADING,
      page: () => const FaceLoadingView(),
      binding: FaceLoadingBinding(),
    ),
    GetPage(
      name: _Paths.STRESS_INDICATOR,
      page: () => const StressIndicatorView(),
      binding: StressIndicatorBinding(),
    ),
    GetPage(
      name: _Paths.EMERGENCY_COUNT_DOWN,
      page: () => const EmergencyCountDownView(),
      binding: EmergencyCountDownBinding(),
    ),
    GetPage(
      name: _Paths.ARTICLES,
      page: () => const ArticlesView(),
      binding: ArticlesBinding(),
    ),
  ];
}
