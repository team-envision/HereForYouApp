import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../Components/kElevatedButton.dart';
import '../../../../Components/kOutlinedButton.dart';
import '../controllers/gender_page_controller.dart';

class GenderPageView extends GetView<GenderPageController> {
  const GenderPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          const OutLinedGender(
            text: 'I am male',
            svgPic: 'lib/assets/images/Solidarrowrightm.svg',
            backColor: Color(0xFFE6F0FA),
            borderColor: Color(0xFF3C7CBC),
          ),
          SizedBox(height: 30.h),
          const OutLinedGender(
            text: 'I am female',
            svgPic: 'lib/assets/images/Solidarrowrightsm.svg',
            backColor: Color(0xFFEEE9F7),
            borderColor: Color(0xFF704EAF),
          ),
          SizedBox(height: 30.h),
          const OutLinedGender(
            text: 'Others',
            svgPic: 'lib/assets/images/Solidarrowrightsm.svg',
            backColor: Color(0xFFE8FFBD),
            borderColor: Color(0xFF91BB43),
          ),
          SizedBox(height: 70.h),
          SizedBox(
            height: 56.49.h,
            width: double.infinity,
            child: kElevatedButton(
              leadingIcon: "lib/assets/images/forward.svg",
              text: 'Next',
              onPressed: () {},
            ),
          )
        ],
      ),
    ));
  }
}
