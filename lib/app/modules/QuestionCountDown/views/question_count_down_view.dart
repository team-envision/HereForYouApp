import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:here_for_you_app/app/routes/app_pages.dart';

import '../../../../Components/kElevatedButton.dart';
import '../../../../resources/app_resources/app_colors.dart';
import '../controllers/question_count_down_controller.dart';

class QuestionCountdownView extends GetView {
  QuestionCountdownView({super.key});

  final controller = Get.put(QuestionCountDownController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
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
      body: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 143.h),
            SizedBox(
              height: 147.h,
              width: 147.w,
              child: SvgPicture.asset("assets/images/ClockImage.svg"),
            ),
            SizedBox(height: 43.h),
            Obx(
              () => Text(
                "${controller.TotalPage.value.toString()} more to go!",
                style: GoogleFonts.urbanist(
                  fontWeight: FontWeight.w800,
                  fontSize: 21.sp,
                ),
              ),
            ),
            SizedBox(height: 51.h),
            SizedBox(
              width: 340.w,
              child: Text(
                textAlign: TextAlign.center,
                getText(nextPage: Get.arguments["next"] ?? "SDRS"),
                style: GoogleFonts.urbanist(
                  height: 33 / (18.sp),
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Spacer(),

            getNote(nextPage: Get.arguments["next"] ?? "SDRS") != null
                ? SizedBox(
                    width: 333.w,
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                            text: "Note: ",

                            style: GoogleFonts.urbanist(
                              fontWeight: FontWeight.w700,
                              fontSize: 13.sp,
                              color: AppColors.black,
                            ),
                          ),
                          TextSpan(
                            text: getNote(
                              nextPage: Get.arguments["next"] ?? "SDRS",
                            )!,
                            style: GoogleFonts.urbanist(
                              fontWeight: FontWeight.w500,
                              fontSize: 13.sp,
                              color: AppColors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                : const SizedBox(),
            SizedBox(height: 16.51.h),

            SizedBox(
              width: 345.99.w,
              height: 56.49.h,
              child: kElevatedButton(
                trailingIcon: "assets/images/forward.svg",
                text: "Start",
                onPressed: () {
                  controller.handleNavigation();
                },
              ),
            ),
            SizedBox(height: 91.h),
          ],
        ),
      ),
    );
  }

  String getText({required String nextPage}) {
    String text = "";
    if (nextPage == "") {
      nextPage = "SDRS";
    }

    if (nextPage == "GAD7") {
      text =
          "To help us screen for Anxiety Disorder.(Keep in mind, this is just a screening test!)";
    } else if (nextPage == "PHQ9") {
      text =
          "To help us screen for Depression.(Keep in mind, this is just a screening test!)";
    } else if (nextPage == "SDRS") {
      text =
          "Select how much the following statements apply to you, this will help us understand you better.";
    } else if (nextPage == "BACE") {
      text =
          "Next, you’ll see a list of factors that can delay or discourage people from seeking or continuing professional mental health care, such as from a GP, psychiatrist, counselor, or psychologist.";
    }
    return text;
  }

  String? getNote({required String nextPage}) {
    String? text;
    if (nextPage == "") {
      nextPage = "SDRS";
    }

    if (nextPage == "GAD7") {
      text =
          "Select how often you’ve been bothered by these problems in the last 2 weeks.";
    } else if (nextPage == "PHQ9") {
      text =
          "Select how often you’ve been bothered by these problems in the last 2 weeks.";
    } else if (nextPage == "BACE") {
      text =
          "Answer the following questions based on how much these issues have stopped, delayed, or discouraged you from seeking or continuing mental health care.";
    }
    return text;
  }
}
