import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:here_for_you_app/Components/featureContainers.dart';
import 'package:here_for_you_app/resources/app_resources/app_colors.dart';

import '../../../routes/app_pages.dart';
import '../controllers/get_started_controller.dart';

class GetStartedView extends GetView<GetStartedController> {
  const GetStartedView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundScaffold,
      body: Stack(
        children: [
          Positioned(
            width: 131.w,
            height: 56.h,
            left: -26.w,
            top: 78.h,
            child: Transform.flip(
              flipX: true,
              child: SvgPicture.asset("assets/images/getStarted_cloud.svg"),
            ),
          ),
          Positioned(
            width: 158.29.w,
            height: 66.7.h,
            left: -44.w,
            top: 309.h,
            child: Transform.flip(
              flipX: true,
              child: SvgPicture.asset("assets/images/getStarted_cloud.svg"),
            ),
          ),
          Positioned(
            width: 168.w,
            height: 71.h,
            left: 225.w,
            top: 88.h,
            child: SvgPicture.asset("assets/images/getStarted_cloud.svg"),
          ),
          Positioned(
            width: 248.w,
            height: 105.h,
            left: 230.w,
            top: 218.h,
            child: SvgPicture.asset("assets/images/getStarted_cloud.svg"),
          ),
          Positioned(
            width: 370.65.w,
            height: 363.03.h,
            top: 142.97.h,
            left: 11.w,
            child: SvgPicture.asset("assets/images/getStarted_figure.svg"),
          ),
          Positioned(
            top: 461.h,
            left: -295.17.w,
            child: Container(
              width: 984.33.w,
              height: 971.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(1265.27.r),
                color: AppColors.white,
                boxShadow: const [
                  BoxShadow(
                    color: AppColors.shadowCloudLevel1, // #4B34250D
                    offset: Offset(0, 0),
                    blurRadius: 0,
                    spreadRadius: 0,
                  ),
                  BoxShadow(
                    color: AppColors.shadowCloudLevel1, // #4B34250D
                    offset: Offset(0, -17.43),
                    blurRadius: 38.96,
                    spreadRadius: 0,
                  ),
                  BoxShadow(
                    color: AppColors.shadowCloudLevel3, // #4B34250A
                    offset: Offset(0, -70.75),
                    blurRadius: 70.75,
                    spreadRadius: 0,
                  ),
                  BoxShadow(
                    color: AppColors.shadowCloudLevel4, // #4B342508
                    offset: Offset(0, -157.9),
                    blurRadius: 95.36,
                    spreadRadius: 0,
                  ),
                  BoxShadow(
                    color: AppColors.shadowCloudLevel5, // #4B342503
                    offset: Offset(0, -280.94),
                    blurRadius: 112.79,
                    spreadRadius: 0,
                  ),
                  BoxShadow(
                    color: AppColors.shadowCloudLevel6, // #4B342500
                    offset: Offset(0, -438.85),
                    blurRadius: 123.04,
                    spreadRadius: 0,
                  ),
                ],
              ),
              child: Column(
                children: [
                  SizedBox(height: 45.h),
                  Text(
                    "Here For You",
                    style: GoogleFonts.urbanist(
                      fontWeight: FontWeight.w700,
                      fontSize: 37.49.sp,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  Text(
                    "&",
                    style: GoogleFonts.urbanist(
                      fontWeight: FontWeight.w600,
                      fontSize: 14.18.sp,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  Text(
                    "“The thoughts in your head”",
                    style: GoogleFonts.urbanist(
                      fontWeight: FontWeight.w600,
                      fontSize: 14.18.sp,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  SizedBox(height: 25.h),
                  SizedBox(
                    width: 351.71.w,
                    height: 169.42.h,
                    child: kCard(
                      onTap: () => Get.toNamed(Routes.LOGIN),
                      backGroundColor: AppColors.white,
                      borderColor: AppColors.black,
                      text: "Get Started",
                      IsSvg: true,
                      ImagePath: "assets/images/GetStartedCard.svg",
                      bottomText: "Sign in",
                    ),
                  ),
                  SizedBox(height: 5.h),
                  TextButton(
                    onPressed: () => Get.toNamed(Routes.SIGNUP),
                    child: Text(
                      "Don't have an account. Sign up",
                      style: GoogleFonts.urbanist(
                        color: AppColors.black,
                        fontWeight: FontWeight.w800,
                        fontSize: 13.33.sp,
                        letterSpacing: -0.3,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
