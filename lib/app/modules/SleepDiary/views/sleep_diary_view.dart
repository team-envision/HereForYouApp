import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:here_for_you_app/app/modules/SleepDiary/views/sleepDiaryHomeView.dart';
import 'package:here_for_you_app/app/routes/app_pages.dart';
import 'package:here_for_you_app/resources/app_resources/app_colors.dart';
import '../../../../common/Components/kElevatedButton.dart';
import '../controllers/sleep_diary_controller.dart';

class SleepDiaryView extends GetView<SleepDiaryController> {
  const SleepDiaryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: const Text("Sleep Diary"),
        titleTextStyle: GoogleFonts.urbanist(
          fontSize: 24.95.sp,
          fontWeight: FontWeight.w800,
          letterSpacing: -0.3,
          color: AppColors.black,
        ),
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
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: Stack(
        children: [
          Positioned(
            top: 254.h,
            left: 35.w,
            width: 324.w,
            child: Text(
              textAlign: TextAlign.center,
              "Fill out the sleep diary daily, ideally within an hour of waking and before bed. Note anything that affects your sleep or wakefulness. If you miss a day, leave it blank. Exact times aren’t necessary—your best recall will do, and reflecting on your sleep won’t keep you awake.",
              style: GoogleFonts.urbanist(
                fontWeight: FontWeight.w500,
                fontSize: 18.sp,
                height: 33 / (18.sp),
              ),
            ),
          ),
          Positioned(
            top: 655.h,
            width: 275.w,
            left: 59.w,
            child: SizedBox(
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
                        height: 20 / (13.sp),
                      ),
                    ),
                    TextSpan(
                      text:
                          "There are no right or wrong answers. Answer honestly without overthinking..",
                      style: GoogleFonts.urbanist(
                        fontWeight: FontWeight.w500,
                        fontSize: 13.sp,
                        color: AppColors.black,
                        height: 20 / (13.sp),
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
            child: SizedBox(
              width: 345.99.w,
              height: 56.49.h,
              child: kElevatedButton(
                trailingIcon: "assets/images/forward.svg",
                text: "Start",
                onPressed: () => Get.off(() => const SleepDiaryHomeView()),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
