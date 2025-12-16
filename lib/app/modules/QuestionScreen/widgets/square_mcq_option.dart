import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:here_for_you_app/resources/app_resources/app_colors.dart';

class SquareMcqOption extends StatelessWidget {
  final bool isSelected;
  final String label;
  final VoidCallback? onTap;
  final String icon;

  const SquareMcqOption({
    super.key,
    this.isSelected = false,
    required this.onTap,
    required this.label,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 152.h,
        width: 152.w,
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFEBFFC4) : AppColors.white,
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: isSelected
                  ? const Color(0xFFB1D472)
                  : const Color(0x1F000000),
              offset: const Offset(0, 0),
              blurRadius: 9.8,
              spreadRadius: 1,
            ),
          ],
          borderRadius: BorderRadius.circular(24.r),
          border: BoxBorder.all(
            color: isSelected ? const Color(0xFFB1D472) : AppColors.transparent,
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              top: 18.h,
              left: 18.w,
              width: 112.w,
              child: Text(
                label,
                style: GoogleFonts.urbanist(
                  fontWeight: FontWeight.w800,
                  fontSize: 20.sp,
                  letterSpacing: -0.06,
                  height: 1.00,
                ),
              ),
            ),
            icon != ""?
            Positioned(
              top: 116.h,
              left: 116.w,
              width: 18.w,
              height: 18.h,
              child: CachedNetworkImage(imageUrl: icon),
            ):const SizedBox(),
          ],
        ),
      ),
    );
  }
}
