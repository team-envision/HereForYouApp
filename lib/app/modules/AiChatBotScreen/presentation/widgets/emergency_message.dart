import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:here_for_you_app/app/modules/AiChatBotScreen/presentation/widgets/markdown_messages.dart';
import 'package:here_for_you_app/common/utils/helpers.dart';

class EmergencyMessage extends StatelessWidget {
  final ChatMessage message;

  const EmergencyMessage({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 1. The Message Text
        MarkdownMessage(text: message.text),

        SizedBox(height: 12.h),

        // 2. The Emergency Action Card
        Material(
          color: const Color(0xFFFEF2F2),
          // Very light red background (Safety Red)
          borderRadius: BorderRadius.circular(12.r),
          clipBehavior: Clip.hardEdge,
          child: InkWell(
            splashColor: Colors.red.withOpacity(0.1), // Red ripple effect
            onTap: () {
              Helpers.openUrl(
                url: "tel:${message.customProperties?['number']}",
              );
              // Logic: launchUrl(Uri.parse("tel:${message.customProperties?['number']}"));
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.r),
                border: Border.all(
                  color: const Color(0xFFFECACA),
                ), // Subtle red border
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                // Center the content for emphasis
                children: [
                  // Pulsing Icon feel (static for now, but distinct)
                  Container(
                    padding: EdgeInsets.all(6.w),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.phone_in_talk_rounded,
                      color: Colors.red,
                      size: 20.sp,
                    ),
                  ),

                  SizedBox(width: 12.w),

                  // Bold Action Text
                  Text(
                    message.customProperties?['label'] ?? "Call Helpline",
                    style: GoogleFonts.urbanist(
                      fontWeight: FontWeight.w800,
                      fontSize: 16.sp, // Slightly larger for importance
                      color: const Color(0xFFDC2626), // Stronger red text
                      letterSpacing: 0.5,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(height: 4.h),
      ],
    );
  }
}
