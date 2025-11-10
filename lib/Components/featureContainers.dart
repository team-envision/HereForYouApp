import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

Widget kCard(
    {required Color backGroundColor,
    required Color borderColor,
    required String text,
    required bool IsSvg,
    required String ImagePath,
    String? iconPath,
    Icon? bottomIcon,
    String? bottomText,
    String? subText,
    Alignment? alignment,
    dynamic? onTap}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      height: 200,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: BoxDecoration(
          color: backGroundColor,
          border: Border.all(color: borderColor),
          borderRadius: BorderRadius.circular(22)),
      child: Stack(
        fit: StackFit.expand,
        alignment: Alignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Wrap(
              direction: Axis.vertical,
              children: [
                Text(
                  text,
                  style: GoogleFonts.urbanist(
                    fontSize: 24.61.sp,
                    fontWeight: FontWeight.w800,
                    letterSpacing: -0.3,
                  ),
                ),
                subText != null
                    ? Text(
                        subText,
                        style: Get.theme.textTheme.labelMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    : const SizedBox()
              ],
            ),
          ),
          IsSvg
              ? SvgPicture.asset(
                  ImagePath,
                  alignment: alignment ?? const Alignment(2, 1),
                )
              : Image.asset(
                  ImagePath,
                  alignment: alignment ?? const Alignment(2, 1),
                ),
          iconPath == null
              ? Align(
                  alignment: Alignment.bottomLeft,
                  child: Container(
                    margin: EdgeInsets.only(left: 10.w, bottom: 10.h),
                    child: Row(
                      children: [
                        SizedBox(width: 10.47.w),
                        Text(
                          bottomText ?? "",
                          style: GoogleFonts.urbanist(
                            fontWeight: FontWeight.w800,
                            fontSize: 16.sp,
                            letterSpacing: -0.3,
                          ),
                        ),
                        SizedBox(width: 5.w),
                        SvgPicture.asset(
                          "assets/images/forward.svg",
                          width: 9.29.w,
                          height: 11.91.h,
                        )
                      ],
                    ),
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Image.asset(
                    iconPath,
                    alignment: Alignment.bottomLeft,
                  ),
                ),
        ],
      ),
    ),
  );
}
