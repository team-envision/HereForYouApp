import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:here_for_you_app/app/modules/AiChatBotScreen/presentation/widgets/markdown_messages.dart';

class McqMessage extends StatelessWidget {
  final ChatMessage message;
  final Function(String) onOptionSelected;

  const McqMessage({
    super.key,
    required this.message,
    required this.onOptionSelected,
  });

  @override
  Widget build(BuildContext context) {
    final List<dynamic> options = message.customProperties?['options'] ?? [];

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MarkdownMessage(text: message.text),

        SizedBox(height: 12.h),
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: options.map((option) {
            return Padding(
              padding: EdgeInsets.only(bottom: 8.h),
              child: _buildOptionButton(option.toString()),
            );
          }).toList(),
        ),

        SizedBox(height: 4.h),
      ],
    );
  }

  Widget _buildOptionButton(String text) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12.r),
      child: InkWell(
        onTap: () {
          onOptionSelected(text);
        },
        borderRadius: BorderRadius.circular(12.r),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(color: Colors.black, width: 0.4),
          ),
          child: Center(
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: GoogleFonts.urbanist(
                fontWeight: FontWeight.w600,
                fontSize: 15.sp,
                color: Colors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
