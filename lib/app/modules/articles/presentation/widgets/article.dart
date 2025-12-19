import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:here_for_you_app/resources/app_resources/app_colors.dart';

class Article extends StatelessWidget {
  final String image;
  final String label;
  final String link;
  final VoidCallback onTap;

  const Article({
    super.key,
    required this.image,
    required this.label,
    required this.link,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 61.h,
      margin: EdgeInsets.symmetric(vertical: 15.h, horizontal: 25.w),
      decoration: BoxDecoration(
        // We keep the shadow here on the container
        borderRadius: BorderRadius.circular(10.r),
        boxShadow: const [
          BoxShadow(
            color: Color(0x2B000000),
            offset: Offset(0, 0),
            blurRadius: 6.3,
            spreadRadius: 0,
          ),
        ],
      ),
      child: Material(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(10.r),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(10.r),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 11.w),
            child: Row(
              children: [
                Container(
                  height: 39.h,
                  width: 67.w,
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(4.r),
                    boxShadow: const [
                      BoxShadow(
                        color: Color(0x40000000),
                        offset: Offset(0, 0),
                        blurRadius: 3.5,
                        spreadRadius: 0,
                      ),
                    ],
                  ),
                  child: CachedNetworkImage(
                    imageUrl: image,
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                    fit: BoxFit.scaleDown,
                  ),
                ),
                SizedBox(width: 10.w),
                Expanded(
                  child: Text(
                    label,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.urbanist(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w700,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
