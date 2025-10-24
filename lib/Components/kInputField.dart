import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:here_for_you_app/resources/app_resources/app_colors.dart';

class kInputField extends StatefulWidget {
  final String title;
  final String hint;
  final Function(String)? onChanged;
  final TextInputType inputType;
  final TextEditingController? controller;
  final bool isPasswordField;
  final String? Function(String?)? validator;

  const kInputField({
    super.key,
    required this.title,
    required this.hint,
    this.onChanged,
    this.inputType = TextInputType.text,
    this.controller,
    this.isPasswordField = false,
    this.validator,
  });

  @override
  State<kInputField> createState() => kInputFieldState();
}

class kInputFieldState extends State<kInputField> {
  bool isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.title,
            style: GoogleFonts.urbanist(
              fontWeight: FontWeight.w800,
              fontSize: 14.86.sp,
              letterSpacing: -0.3,
            ),
          ),
          SizedBox(height: 5.h),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30.r),
              boxShadow: const [
                BoxShadow(
                  color: AppColors.genericShadow,
                  offset: Offset(0, 0),
                  blurRadius: 11.9,
                  spreadRadius: 0,
                ),
              ],
            ),
            child: TextFormField(
              validator: widget.validator,
              obscureText: widget.isPasswordField && !isPasswordVisible,
              controller: widget.controller,
              keyboardType: widget.inputType,
              onChanged: widget.onChanged,
              style: GoogleFonts.urbanist(
                decoration: TextDecoration.none,
                fontWeight: FontWeight.w700,
                fontSize: 14.sp,
                color: AppColors.black,
              ),
              decoration: InputDecoration(
                suffixIcon: widget.isPasswordField
                    ? IconButton(
                        icon: Icon(isPasswordVisible
                            ? Icons.visibility_off
                            : Icons.visibility),
                        onPressed: () {
                          setState(() {
                            isPasswordVisible = !(isPasswordVisible);
                          });
                        },
                      )
                    : null,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.r),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: AppColors.white,
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 22.w,
                  vertical: 13.h,
                ),
                hintText: widget.hint,
                hintStyle: GoogleFonts.urbanist(
                  fontWeight: FontWeight.w700,
                  fontSize: 14.sp,
                  color: AppColors.textHintMuted,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
