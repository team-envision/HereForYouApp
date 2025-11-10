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
        margin: EdgeInsets.only(bottom: 10.h, left: 10.w, right: 10.w),
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
            () => Container(
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildNavItem(
                    index: 0,
                    icon: "assets/icons/home.svg",
                    label: "Home",
                    isSvg: true,
                  ),
                  _buildNavItem(
                    index: 1,
                    icon: "assets/icons/BookIcon.png",
                    label: "Mind Test",
                    isSvg: false,
                  ),
                  _buildNavItem(
                    index: 2,
                    icon: "assets/icons/profile.svg",
                    label: "Profile",
                    isSvg: true,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem({
    required int index,
    required String icon,
    required String label,
    required bool isSvg,
  }) {
    final isSelected = controller.currentIndex.value == index;

    return GestureDetector(
      onTap: () => controller.changePage(index),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        decoration: BoxDecoration(
          color: isSelected
              ? const Color.fromRGBO(238, 229, 255, 1)
              : Colors.transparent,
          shape: BoxShape.circle,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            isSvg
                ? SvgPicture.asset(
                    icon,
                    height: 19.12.h,
                    width: 19.12.w,
                    colorFilter: ColorFilter.mode(
                      AppColors.black,
                      BlendMode.srcIn,
                    ),
                  )
                : Image.asset(
                    icon,
                    height: 19.12.h,
                    width: 19.12.w,
                    color: AppColors.black,
                  ),
            SizedBox(height: 4.h),
            Text(
              label,
              style: GoogleFonts.urbanist(
                fontWeight: FontWeight.w800,
                fontSize: 10.59.sp,
                letterSpacing: -0.3,
                color: AppColors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _getPage(String route) {
    switch (route) {
      case Routes.HOME:
        return HomeView();
      case Routes.PROFILE_PAGE:
        return ProfilePageView();
      default:
        return HomeView();
    }
  }
}
