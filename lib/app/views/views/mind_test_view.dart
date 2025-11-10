import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:here_for_you_app/Components/kElevatedButton.dart';

import '../../modules/QuestionScreen/views/DASS21_question_screen_view.dart';

class MindTestScreenView extends GetView {
  const MindTestScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Image.asset(
            "assets/images/backward_arrow.png",
            width: 21.w,
            height: 26.93.h,
          ),
        ),
        actions: [
          Container(
            margin: EdgeInsets.only(right: 5.w),
            child: IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(
                "assets/icons/home.svg",
                height: 19.12.h,
                width: 19.12.w,
              ),
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          Positioned(
            height: 147.h,
            width: 147.w,
            top: 143.h,
            left: 123.w,
            child: SvgPicture.asset("assets/images/ClockImage.svg"),
          ),
          Positioned(
            top: 316.h,
            left: 35.w,
            width: 324.w,
            child: Text(
              textAlign: TextAlign.center,
              "Kudos on taking a step towards improving your mental health!",
              style: GoogleFonts.urbanist(
                fontWeight: FontWeight.w800,
                fontSize: 21.sp,
              ),
            ),
          ),
          Positioned(
            top: 417.h,
            left: 35.w,
            width: 324.w,
            child: Text(
              textAlign: TextAlign.center,
              "Before you start answering the Questions, Read each statement and select based on how much the statement applied to you over the past week.",
              style: GoogleFonts.urbanist(
                fontWeight: FontWeight.w500,
                fontSize: 18.sp,
                height: 33 / 18,
              ),
            ),
          ),
          Positioned(
            top: 655.h,
            left: 59.w,
            width: 275.w,
            child: Text(
              textAlign: TextAlign.center,
              "Note: There are no right or wrong answers. Answer honestly without overthinking..",
              style: GoogleFonts.urbanist(
                fontWeight: FontWeight.w700,
                fontSize: 13.sp,
                height: 20 / 13,
              ),
            ),
          ),
          Positioned(
            top: 711.51.h,
            left: 24.05.w,
            height: 56.49.h,
            width: 345.99.w,
            child: kElevatedButton(
              text: "Start",
              onPressed: () => Get.off(() => DASS21QuestionView()),
              trailingIcon: "assets/images/forward.svg",
            ),
          ),
        ],
      ),
    );
  }
}
