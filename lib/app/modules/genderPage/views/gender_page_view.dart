import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:here_for_you_app/app/routes/app_pages.dart';
import 'package:here_for_you_app/resources/app_resources/app_colors.dart';
import '../../../../common/Components/kElevatedButton.dart';
import '../../../../common/Components/kOutlinedButton.dart';
import '../controllers/gender_page_controller.dart';

class GenderPageView extends GetView<GenderPageController> {
  const GenderPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "What's your official gender?",
              style: GoogleFonts.urbanist(
                fontWeight: FontWeight.w800,
                fontSize: 37.5.sp,
                letterSpacing: -1,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 80.h),
            Obx(
              () => OutLinedGender(
                isSelected: controller.state.selected.value == "I am male",
                onPressed: () => controller.state.selected.value = "I am male",
                text: 'I am male',
                svgPic: 'assets/images/Solidarrowrightm.svg',
                backColor: AppColors.maleBg,
                borderColor: AppColors.maleBorder,
              ),
            ),
            SizedBox(height: 30.h),
            Obx(
              () => OutLinedGender(
                isSelected: controller.state.selected.value == "I am female",
                onPressed: () =>
                    controller.state.selected.value = "I am female",
                text: 'I am female',
                svgPic: 'assets/images/Solidarrowrightsm.svg',
                backColor: AppColors.femaleBg,
                borderColor: AppColors.femaleBorder,
              ),
            ),
            SizedBox(height: 30.h),
            Obx(
              () => OutLinedGender(
                isSelected: controller.state.selected.value == "Others",
                onPressed: () => controller.state.selected.value = "Others",
                text: 'Others',
                svgPic: 'assets/images/Solidarrowrightsm.svg',
                backColor: AppColors.otherBg,
                borderColor: AppColors.otherBorder,
              ),
            ),
            SizedBox(height: 70.h),
            SizedBox(
              height: 56.49.h,
              width: double.infinity,
              child: kElevatedButton(
                trailingIcon: "assets/images/forward.svg",
                text: 'Next',
                onPressed: controller.handleNext,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
