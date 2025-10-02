import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 18.0.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 70.h),
              SvgPicture.asset(
                width: 230.75.w,
                height: 248.43.h,
                'lib/assets/images/loginBanner.svg',
              ),
              SizedBox(height: 10.h),
              Text(
                "Welcome Back",
                textAlign: TextAlign.center,
                style: GoogleFonts.urbanist(
                  fontWeight: FontWeight.w700,
                  fontSize: 36.sp,
                ),
              ),
              SizedBox(height: 12.h),
              SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Email",
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
                            color: Color(0x2B000000),
                            offset: Offset(0, 0),
                            blurRadius: 11.9,
                            spreadRadius: 0,
                          ),
                        ],
                      ),
                      child: TextFormField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.r),
                              borderSide: BorderSide.none,
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 22.w,
                              vertical: 13.h,
                            ),
                            hintText: 'Enter email',
                            hintStyle: GoogleFonts.urbanist(
                              fontWeight: FontWeight.w700,
                              fontSize: 14.sp,
                              color: Color(0x7D201A25),
                            )),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 18.h),
              SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Password",
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
                            color: Color(0x2B000000),
                            offset: Offset(0, 0),
                            blurRadius: 11.9,
                            spreadRadius: 0,
                          ),
                        ],
                      ),
                      child: TextFormField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.r),
                              borderSide: BorderSide.none,
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 22.w,
                              vertical: 13.h,
                            ),
                            hintText: 'Enter password',
                            hintStyle: GoogleFonts.urbanist(
                              fontWeight: FontWeight.w700,
                              fontSize: 14.sp,
                              color: Color(0x7D201A25),
                            )),
                      ),
                    )
                  ],
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    "Forgot password?",
                    textAlign: TextAlign.right,
                    style: GoogleFonts.urbanist(
                      color: Colors.black,
                      fontWeight: FontWeight.w800,
                      fontSize: 12.63.sp,
                      letterSpacing: -0.3,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10.h),
              SizedBox(
                height: 47.h,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                  ),
                  child: Text(
                    "Sign in",
                    style: GoogleFonts.urbanist(
                      fontWeight: FontWeight.w800,
                      fontSize: 19.sp,
                      letterSpacing: -0.4,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 18.h),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 30.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Divider(
                        thickness: 1.5.h,
                      ),
                    ),
                    SizedBox(width: 10.w),
                    Text(
                      "OR",
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: 11.43.sp,
                      ),
                    ),
                    SizedBox(width: 10.w),
                    Expanded(
                      child: Divider(
                        thickness: 1.5.h,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 18.h),
              SizedBox(
                height: 47.h,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                    side: BorderSide(color: Colors.black, width: 1.h),
                  ),
                  child: Text(
                    "Sign in",
                    style: GoogleFonts.urbanist(
                      fontWeight: FontWeight.w800,
                      fontSize: 19.sp,
                      letterSpacing: -0.4,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
