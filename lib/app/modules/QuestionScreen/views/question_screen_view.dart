import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:here_for_you_app/app/modules/QuestionScreen/controllers/question_screen_controller.dart';
import 'package:here_for_you_app/app/modules/QuestionScreen/widgets/linear_mcq_option.dart';
import 'package:here_for_you_app/app/modules/QuestionScreen/widgets/square_mcq_option.dart';
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
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
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
            left: 36.w,
            height: 324.h,
            width: 324.w,
            child: controller.state.options.length == 4
                ? squareMcq()
                : linearMcq(),
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

  Widget linearMcq() {
    return Obx(
      () => Stack(
        children: [
          Positioned(
            height: 48.h,
            width: 324.w,
            top: 0,
            child: LinearMcqOption(
              isSelected: controller.state.selected.value == 0,
              label: controller.state.options[0].label,
              onTap: () => controller.selectOption(0),
            ),
          ),
          Positioned(
            height: 48.h,
            width: 324.w,
            top: 69.h,
            child: LinearMcqOption(
              isSelected: controller.state.selected.value == 1,
              label: controller.state.options[1].label,
              onTap: () => controller.selectOption(1),
            ),
          ),
          Positioned(
            height: 48.h,
            width: 324.w,
            top: 138.h,
            child: LinearMcqOption(
              isSelected: controller.state.selected.value == 2,
              label: controller.state.options[2].label,
              onTap: () => controller.selectOption(2),
            ),
          ),
          Positioned(
            height: 48.h,
            width: 324.w,
            top: 207.h,
            child: LinearMcqOption(
              isSelected: controller.state.selected.value == 3,
              label: controller.state.options[3].label,
              onTap: () => controller.selectOption(3),
            ),
          ),
          Positioned(
            height: 48.h,
            width: 324.w,
            top: 276.h,
            child: LinearMcqOption(
              isSelected: controller.state.selected.value == 4,
              label: controller.state.options[4].label,
              onTap: () => controller.selectOption(4),
            ),
          ),
        ],
      ),
    );
  }

  Widget squareMcq() {
    return Obx(() => Stack(
      children: [
        Positioned(
          top: 0.h,
          left: 0.w,
          width: 152.w,
          height: 152.h,
          child: SquareMcqOption(
            label: controller.state.options[0].label,
            icon: controller.state.options[0].icon,
            onTap: () => controller.selectOption(0),
            isSelected: controller.state.selected.value == 0,
          ),
        ),
        Positioned(
          top: 0.h,
          left: 172.w,
          width: 152.w,
          height: 152.h,
          child: SquareMcqOption(
            label: controller.state.options[1].label,
            icon: controller.state.options[1].icon,
            onTap: () => controller.selectOption(1),
            isSelected: controller.state.selected.value == 1,
          ),
        ),
        Positioned(
          top: 172.h,
          left: 0.w,
          width: 152.w,
          height: 152.h,
          child: SquareMcqOption(
            label: controller.state.options[2].label,
            icon: controller.state.options[2].icon,
            onTap: () => controller.selectOption(2),
            isSelected: controller.state.selected.value == 2,
          ),
        ),
        Positioned(
          top: 172.h,
          left: 172.w,
          width: 152.w,
          height: 152.h,
          child: SquareMcqOption(
            label: controller.state.options[3].label,
            icon: controller.state.options[3].icon,
            onTap: () => controller.selectOption(3),
            isSelected: controller.state.selected.value == 3,
          ),
        ),
      ],
    ));
  }
}
