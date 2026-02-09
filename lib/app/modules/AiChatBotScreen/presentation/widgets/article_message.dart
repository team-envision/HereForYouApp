import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:here_for_you_app/app/modules/AiChatBotScreen/presentation/widgets/markdown_messages.dart';

import '../../../../../common/utils/helpers.dart';

class ArticleMessage extends StatelessWidget {
  final ChatMessage message;

  const ArticleMessage({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MarkdownMessage(text: message.text),

        SizedBox(height: 12.h),
        Material(
          color: const Color(0xFFF5F5F5),
          // Light grey or use AppColors.primary.withOpacity(0.1)
          borderRadius: BorderRadius.circular(12.r),
          clipBehavior: Clip.hardEdge,
          // Ensures ink splash stays inside corners
          child: InkWell(
            onTap: () {
              Helpers.openUrl(url: message.customProperties?["link"]);
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
              decoration: BoxDecoration(
                // Optional: Add a subtle border if you want more definition
                border: Border.all(color: Colors.black.withOpacity(0.05)),
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.article_rounded,
                    color: Colors.black87,
                    size: 20.sp,
                  ),

                  SizedBox(width: 10.w),

                  // Label Text
                  Expanded(
                    child: Text(
                      message.customProperties?['label'] ?? "Read Article",
                      style: GoogleFonts.urbanist(
                        fontWeight: FontWeight.w700,
                        fontSize: 14.sp,
                        color: Colors.black87,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),

                  // Navigation Arrow (Affordance)
                  Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 14.sp,
                    color: Colors.grey,
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
