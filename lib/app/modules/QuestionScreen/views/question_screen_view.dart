import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:here_for_you_app/app/modules/QuestionScreen/controllers/question_screen_controller.dart';
import 'package:here_for_you_app/app/modules/QuestionScreen/widgets/mcq_option.dart';
import 'package:here_for_you_app/common/Components/kElevatedButton.dart';
import 'package:here_for_you_app/resources/app_resources/app_colors.dart';

class QuestionView extends GetView<QuestionController> {
  const QuestionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          Positioned(
            top: 88.h,
            left: 327.3.w,
            child: Obx(
              () => Text(
                "${controller.state.questionNo.value + 1}/${controller.state.questions.length}",
                style: GoogleFonts.urbanist(
                  fontWeight: FontWeight.w800,
                  fontSize: 19.33.sp,
                  height: 29 / 21,
                ),
              ),
            ),
          ),
          Positioned(
            height: 22.47.h,
            width: 74.w,
            top: 92.h,
            left: 160.w,
            child: TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                padding: EdgeInsets.zero,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(23.62.r),
                  side: const BorderSide(color: AppColors.black, width: 1.57),
                ),
              ),
              child: Text(
                "Go Home",
                style: GoogleFonts.urbanist(
                  fontWeight: FontWeight.w800,
                  fontSize: 14.92.sp,
                  letterSpacing: -0.3,
                  color: AppColors.black,
                ),
              ),
            ),
          ),
          Positioned(
            top: 145.h,
            left: 35.w,
            width: 324.w,
            child: Obx(
              () => Text(
                textAlign: TextAlign.center,
                controller.state.questions[controller.state.questionNo.value],
                style: GoogleFonts.urbanist(
                  fontWeight: FontWeight.w800,
                  fontSize: 29.sp,
                  height: 33 / 29,
                ),
              ),
            ),
          ),
          Positioned(
            top: 284.h,
            left: 35.w,
            width: 324.w,
            height: 324.h,
            child: Obx(
              () => Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      McqOption(
                        label: controller.state.options[0],
                        onTap: () => controller.selectOption(0),
                        isSelected: controller.state.selected.value == 0,
                      ),
                      McqOption(
                        label: controller.state.options[1],
                        onTap: () => controller.selectOption(1),
                        isSelected: controller.state.selected.value == 1,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      McqOption(
                        label: controller.state.options[2],
                        onTap: () => controller.selectOption(2),
                        isSelected: controller.state.selected.value == 2,
                      ),
                      McqOption(
                        label: controller.state.options[3],
                        onTap: () => controller.selectOption(3),
                        isSelected: controller.state.selected.value == 3,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 711.51.h,
            left: 24.05.w,
            width: 345.99.w,
            height: 56.49.h,
            child: kElevatedButton(
              text: "Next",
              onPressed: controller.next,
              fontSize: 21.07.sp,
              trailingIcon: "assets/images/forward.svg",
            ),
          ),
        ],
      ),
    );
  }
}
