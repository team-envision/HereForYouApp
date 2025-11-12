import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:here_for_you_app/app/routes/app_pages.dart';
import 'package:here_for_you_app/resources/app_resources/app_colors.dart';

import '../../ProfilePage/bindings/profile_page_binding.dart';
import '../../ProfilePage/views/profile_page_view.dart';
import '../../home/bindings/home_binding.dart';
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
          // Use the route configuration from AppPages
          final routeConfig = _getRouteConfig(settings.name ?? Routes.HOME);


          return GetPageRoute(
            settings: settings,
            page: routeConfig.page,
            binding: routeConfig.binding,
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

  // Get route configuration with proper bindings
  _RouteConfig _getRouteConfig(String route) {
    switch (route) {
      case Routes.HOME:
        return _RouteConfig(
          page: () => const HomeView(),
          binding: HomeBinding(),
        );
      case Routes.PROFILE_PAGE:
        return _RouteConfig(
          page: () => const ProfilePageView(),
          binding: ProfilePageBinding(),
        );
      default:
        return _RouteConfig(
          page: () => const HomeView(),
          binding: HomeBinding(),
        );
    }
  }
}

// Helper class to hold page and binding configuration
class _RouteConfig {
  final Widget Function() page;
  final Bindings? binding;

  _RouteConfig({required this.page, this.binding});
}