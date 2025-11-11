import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:here_for_you_app/app/modules/emergency_contact/views/emergency_contact_view.dart';
import 'package:here_for_you_app/app/modules/feedBack/views/feed_back_view.dart';
import 'package:here_for_you_app/app/routes/app_pages.dart';
import 'package:here_for_you_app/app/views/views/articles_view.dart';

import '../../resources/app_resources/app_colors.dart';
import 'customPopup.dart';

class MenuPopup extends StatelessWidget {
  const MenuPopup({super.key});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      onSelected: (value) {
        switch (value) {
          case 'Close':
            Get.back();
            break;
          case 'Articles':
            Get.to(() => ArticlesView());
            break;
          case 'Feedback':
            Get.to(() => FeedBackView());
            break;
          case 'Emergency Contact':
            Get.to(() => EmergencyContactView());
            break;
          case 'Change Password':
            Get.toNamed(Routes.CHANGE_PASSWORD);
            break;
          case 'Delete Account':
            CustomPopup.show(
                title:
                    "Are you sure you want to permanently delete your account?",
                onAccept: () => Get.offAllNamed(Routes.GET_STARTED),
                onCancel: () => Get.back());
            break;
        }
      },
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(23.r)),
      color: AppColors.white,
      menuPadding: EdgeInsets.zero,
      icon: const Icon(Icons.menu),
      itemBuilder: (context) => [
        PopupMenuItem(
          value: "Close",
          enabled: false,
          textStyle: GoogleFonts.urbanist(
              fontWeight: FontWeight.w700,
              fontSize: 16.68.sp,
              letterSpacing: 16.68.sp * 0.02),
          padding: EdgeInsets.zero,
          child: Align(
            alignment: Alignment.topRight,
            child: IconButton(
              iconSize: 20,
              padding: EdgeInsets.zero,
              constraints: BoxConstraints(),
              onPressed: () {
                Get.back();
              },
              icon: const Icon(Icons.close, color: AppColors.black),
            ),
          ),
        ),
        _buildMenuItem(title: "Articles"),
        _buildMenuItem(title: "Change Password"),
        _buildMenuItem(title: "Emergency Contact"),
        _buildMenuItem(title: "Feedback"),
        _buildMenuItem(title: "Delete Account")
      ],
    );
  }

  PopupMenuItem _buildMenuItem({required String title}) {
    return PopupMenuItem(
      value: title,
      height: 31.h,
      child: Center(
        child: Text(title,
            style: GoogleFonts.urbanist(
                fontSize: 16.68.sp,
                fontWeight: FontWeight.w700,
                letterSpacing: 16.68.sp * 0.02)),
      ),
    );
  }
}
