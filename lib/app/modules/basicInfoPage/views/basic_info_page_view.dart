import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:here_for_you_app/Components/kElevatedButton.dart';
import 'package:here_for_you_app/Components/kInputField.dart';
import 'package:here_for_you_app/resources/app_resources/app_colors.dart';

import '../controllers/basic_info_page_controller.dart';

class BasicInfoView extends GetView<BasicInfoPageController> {
  const BasicInfoView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        leading: IconButton(
          icon: Transform.flip(
            flipX: true,
            child: SvgPicture.asset(
              "assets/images/forward.svg",
              height: 20.h,
            ),
          ),
          onPressed: () => Get.back(),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 125.h),
            Center(
              child: Text(
                'Some Basic Info',
                style: GoogleFonts.urbanist(
                  fontWeight: FontWeight.w800,
                  fontSize: 37.5.sp,
                ),
              ),
            ),
            const SizedBox(height: 40),

            // Age Input
            kInputField(
              title: 'Age',
              hint: 'Enter your age',
              onChanged: (value) => controller.age.value = value,
            ),
            const SizedBox(height: 20),

            // Weight Input
            kInputField(
              title: 'Weight (in kg)',
              hint: 'Enter your weight in kilograms',
              onChanged: (value) => controller.weight.value = value,
            ),
            const SizedBox(height: 20),

            // Height Input
            kInputField(
              title: 'Height (in metres)',
              hint: 'Enter your height in metres',
              onChanged: (value) => controller.height.value = value,
            ),
            const SizedBox(height: 80),

            SizedBox(
              height: 47.h,
              width: double.infinity,
              child: kElevatedButton(
                onPressed: () {},
                text: "Next",
                trailingIcon: "assets/images/forward.svg",
              ),
            )
          ],
        ),
      ),
    );
  }
}
