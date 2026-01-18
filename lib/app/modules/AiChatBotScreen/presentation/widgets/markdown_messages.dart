import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class MarkdownMessage extends StatelessWidget {
  final String text;
  final bool isCurrentUser;

  const MarkdownMessage({
    super.key,
    required this.text,
    this.isCurrentUser = false,
  });

  @override
  Widget build(BuildContext context) {
    final textColor = isCurrentUser ? Colors.white : Colors.black;
    final codeBgColor = isCurrentUser
        ? Colors.white.withOpacity(0.2)
        : Colors.grey.shade100;

    return MarkdownBody(
      data: text,
      selectable: true,
      fitContent: true,
      onTapLink: (text, href, title) async {
        if (href != null) {
          final uri = Uri.parse(href);
          if (await canLaunchUrl(uri)) {
            await launchUrl(uri);
          }
        }
      },

      styleSheet: MarkdownStyleSheet(
        p: GoogleFonts.urbanist(
          color: textColor,
          fontSize: 15.sp,
          fontWeight: FontWeight.w600,
          height: 1.4,
        ),

        // 2. Bold & Italic
        strong: GoogleFonts.urbanist(
          color: textColor,
          fontWeight: FontWeight.w900,
        ),
        em: GoogleFonts.urbanist(color: textColor, fontStyle: FontStyle.italic),

        // 3. Lists (Bullets)
        listBullet: GoogleFonts.urbanist(color: textColor, fontSize: 15.sp),

        // 4. Code Blocks
        code: GoogleFonts.sourceCodePro(
          color: textColor,
          backgroundColor: Colors.transparent,
          fontSize: 14.sp,
          fontWeight: FontWeight.w500,
        ),
        codeblockPadding: EdgeInsets.all(8.w),
        codeblockDecoration: BoxDecoration(
          color: codeBgColor,
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(
            color: isCurrentUser ? Colors.white30 : Colors.black12,
          ),
        ),

        // 5. Links
        a: GoogleFonts.urbanist(
          color: isCurrentUser ? Colors.white : Colors.blueAccent,
          decoration: TextDecoration.underline,
          decorationColor: isCurrentUser
              ? Colors.white70
              : Colors.blueAccent.withOpacity(0.5),
          fontWeight: FontWeight.bold,
        ),

        blockSpacing: 8.h,
      ),
    );
  }
}
