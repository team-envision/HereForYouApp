import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:here_for_you_app/app/routes/app_pages.dart';
import 'package:here_for_you_app/resources/app_resources/app_colors.dart';

import '../../../views/views/mind_test_view.dart';
import '../../ProfilePage/views/profile_page_view.dart';
import '../../home/views/home_view.dart';
import '../controllers/main_controller.dart';

class MainView extends GetView<MainController> {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Navigator(
        key: Get.nestedKey(1),
        initialRoute: Routes.HOME,
        onGenerateRoute: (settings) {
          return GetPageRoute(
            settings: settings,
            page: () => _getPage(settings.name ?? Routes.HOME),
          );
        },
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.only(bottom: 10.h,left: 10.w, right: 10.w),
        width: 375.w,
        height: 75.h,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(44.r),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              blurRadius: 17.94,
              spreadRadius: 0,
              offset: Offset(0, 0),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(44.r),
          child: Obx(
            () => BottomNavigationBar(
              onTap: controller.changePage,
              unselectedLabelStyle: GoogleFonts.urbanist(fontWeight: FontWeight.w800, fontSize: 10.59.sp, letterSpacing: -0.3),
              selectedLabelStyle: GoogleFonts.urbanist(fontWeight: FontWeight.w800, fontSize: 10.59.sp, letterSpacing: -0.3),
              backgroundColor: Colors.white,
              currentIndex: controller.currentIndex.value,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: "Home",
                  backgroundColor: Colors.blue,
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: "Person",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _getPage(String route) {
    switch (route) {
      case Routes.HOME:
        return HomeView();
      case Routes.MIND_TEST:
        return MindTestScreenView();
      case Routes.PROFILE_PAGE:
        return ProfilePageView();
      default:
        return HomeView();
    }
  }
}
