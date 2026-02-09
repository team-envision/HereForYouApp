import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ErrorMessage extends StatelessWidget {
  final ChatMessage message;
  final VoidCallback? onRetry;

  const ErrorMessage({
    super.key,
    required this.message,
    this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 10.h),
          decoration: BoxDecoration(
            color: const Color(0xFFFEF2F2), // Light Warning Red
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(color: const Color(0xFFFCA5A5)), // Border Red
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Error Icon
              Padding(
                padding: EdgeInsets.only(top: 2.h),
                child: Icon(
                  Icons.error_outline_rounded,
                  color: const Color(0xFFEF4444), // Icon Red
                  size: 20.sp,
                ),
              ),
              SizedBox(width: 10.w),

              // Error Text & Retry
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      message.text,
                      style: GoogleFonts.urbanist(
                        color: const Color(0xFF7F1D1D), // Dark Red Text
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        height: 1.3,
                      ),
                    ),

                    // Optional Retry Button
                    if (onRetry != null) ...[
                      SizedBox(height: 8.h),
                      GestureDetector(
                        onTap: onRetry,
                        child: Row(
                          children: [
                            Icon(Icons.refresh, size: 14.sp, color: Colors.red),
                            SizedBox(width: 4.w),
                            Text(
                              "Tap to Retry",
                              style: GoogleFonts.urbanist(
                                color: Colors.red,
                                fontSize: 13.sp,
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.underline,
                                decorationColor: Colors.red,
                              ),
                            ),
                          ],
                        ),
                      )
                    ]
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 4.h), // Spacing
      ],
    );
  }
}