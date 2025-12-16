import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../resources/app_resources/app_colors.dart';

class LinearMcqOption extends StatelessWidget {
  final bool isSelected;
  final String label;
  final VoidCallback? onTap;

  const LinearMcqOption({
    super.key,
    required this.isSelected,
    required this.label,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFEBFFC4) : AppColors.white,
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: isSelected
                  ? const Color(0xFFB1D472)
                  : const Color(0x1F000000),
              offset: const Offset(0, 0),
              blurRadius: isSelected ? 9.1 : 9.8,
              spreadRadius: 1,
            ),
          ],
          border: BoxBorder.all(
            color: isSelected ? const Color(0xFFB1D472) : AppColors.transparent,
          ),
          borderRadius: BorderRadius.circular(14.r),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: GoogleFonts.urbanist(
                fontWeight: FontWeight.w800,
                fontSize: 20.sp,
                letterSpacing: -0.06,
              ),
            ),
            Container(
              height: 18.h,
              width: 18.w,
              decoration: BoxDecoration(
                color: AppColors.white,
                shape: BoxShape.circle,
                border: Border.all(color: AppColors.black, width: 1.8),
              ),
              child: Center(
                child: Container(
                  height: 10.h,
                  width: 10.w,
                  decoration: BoxDecoration(
                    color: isSelected ? AppColors.black : AppColors.transparent,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
