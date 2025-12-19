import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:here_for_you_app/app/routes/app_pages.dart';
import 'package:here_for_you_app/common/Components/kElevatedButton.dart';
import 'package:here_for_you_app/common/Components/loading_overlay.dart';
import 'package:here_for_you_app/resources/app_resources/app_colors.dart';

import '../controllers/question_count_down_controller.dart';

class QuestionCountdownView extends GetView<QuestionCountDownController> {
  const QuestionCountdownView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => LoadingOverlay(
        isLoading: controller.state.isLoading.value,
        loadingAnimation: "assets/animations/loadingFace.gif",
        size: 92,
        child: Scaffold(
          backgroundColor: AppColors.white,
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            backgroundColor: AppColors.white,
            centerTitle: true,
            leading: IconButton(
              onPressed: () => Get.back(),
              icon: Image.asset(
                "assets/images/backward_arrow.png",
                width: 21.w,
                height: 26.93.h,
              ),
            ),
            actions: [
              IconButton(
                onPressed: () => Get.offAllNamed(Routes.MAIN),
                icon: SvgPicture.asset(
                  "assets/icons/home.svg",
                  width: 19.12.w,
                  height: 19.12.h,
                ),
              ),
            ],
          ),
          body: Stack(
            children: [
              Positioned(
                top: 143.h,
                left: 123.w,
                height: 147.h,
                width: 147.w,
                child: SvgPicture.asset('assets/images/ClockImage.svg'),
              ),
              Positioned(
                top: 417.h,
                left: 35.w,
                width: 324.w,
                child: Obx(
                  () => Text(
                    textAlign: TextAlign.center,
                    controller.state.description.value,
                    style: GoogleFonts.urbanist(
                      fontWeight: FontWeight.w500,
                      fontSize: 18.sp,
                      height: 33 / 18,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 333.h,
                width: 324.w,
                left: 35.w,
                child: Obx(
                  () => Text(
                    textAlign: TextAlign.center,
                    controller.state.progressLabel.value,
                    style: GoogleFonts.urbanist(
                      fontWeight: FontWeight.w800,
                      fontSize: 21.sp,
                      height: 33 / 21,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 655.h,
                left: 59.w,
                width: 275.w,
                child: Obx(
                  () => Text.rich(
                    textAlign: TextAlign.center,
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'Note: ',
                          style: GoogleFonts.urbanist(
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w700,
                            height: 20 / 13,
                          ),
                        ),
                        TextSpan(
                          text: controller.state.note.value,
                          style: GoogleFonts.urbanist(
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w500,
                            height: 20 / 13,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 711.51.h,
                left: 24.05.w,
                width: 345.99.w,
                height: 56.49.h,
                child: kElevatedButton(
                  text: "Start",
                  onPressed: controller.start,
                  fontSize: 21.07.sp,
                  trailingIcon: "assets/images/forward.svg",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
