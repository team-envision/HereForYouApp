import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  // Neutrals
  static const Color white = Colors.white;
  static const Color black = Colors.black;
  static const Color transparent = Colors.transparent;

  // Backgrounds
  static const Color backgroundScaffold = Color(0xFFFDFBFF);

  // Shadows used on Get Started screen circle container
  static const Color shadowCloudLevel1 = Color(0x0D4B3425); // #4B34250D
  static const Color shadowCloudLevel3 = Color(0x0A4B3425); // #4B34250A
  static const Color shadowCloudLevel4 = Color(0x084B3425); // #4B342508
  static const Color shadowCloudLevel5 = Color(0x034B3425); // #4B342503
  static const Color shadowCloudLevel6 = Color(0x004B3425); // #4B342500

  // Common shadows and borders
  static const Color genericShadow = Color(0x2B000000);
  static const Color black12 = Colors.black12;
  static const Color popupShadow = Color(0x40000000); // Add this


  // Text
  static const Color textPrimaryDark = Color(0xFF3F3C36);
  static const Color textHintMuted = Color(0x7D201A25);

  // Gender page colors
  static const Color maleBg = Color(0xFFE6F0FA);
  static const Color maleBorder = Color(0xFF3C7CBC);
  static const Color femaleBg = Color(0xFFEEE9F7);
  static const Color femaleBorder = Color(0xFF704EAF);
  static const Color otherBg = Color(0xFFE8FFBD);
  static const Color otherBorder = Color(0xFF91BB43);

  // Home screen colors
  static const Color appBarBg = Color.fromRGBO(238, 229, 255, 1);
  static const Color avatarBg = Color.fromRGBO(155, 131, 200, 1);
  static const Color mindTestBg = Color.fromRGBO(223, 242, 186, 1);
  static const Color mindTestBorder = Color.fromRGBO(177, 212, 114, 1);
  static const Color moodBg = Color.fromRGBO(255, 241, 193, 1);
  static const Color moodBorder = Color.fromRGBO(255, 218, 95, 1);
  static const Color moodSelected = Colors.yellow;
  static const Color mentalScoreCard = Color.fromRGBO(118, 90, 72, 1);
  static const Color mindAnchorCard = Color.fromRGBO(140, 108, 201, 1);
  static const Color moodQualityCard = Color.fromRGBO(255, 148, 76, 1);
  static const Color aiChatBg = Color.fromRGBO(229, 229, 228, 1);
  static const Color aiChatBorder = Color.fromRGBO(131, 131, 131, 1);

  // Mental score screen colors
  static const Color mentalScoreBg = Color.fromRGBO(237, 222, 212, 1);
  static const Color chartBorder = Colors.brown;

  // Common UI colors
  static const Color grey = Colors.grey;

  // Profile page colors
  static const Color profileBg = Color.fromRGBO(235, 255, 196, 1);
  static const Color profileCard4 = Color.fromRGBO(255, 216, 193, 1);

  // Stress level screen colors
  static const Color stressBgLight = Color(0xFFE8EDDF);
  static const Color stressPrimary = Color(0xFF4E7309);
  static const Color stressSecondary = Color(0xFF7D984A);
  static const Color stressLight = Color(0xFFC6D2B0);
  static const Color stressText = Color(0xFF618C10);
  static const Color stressSecondaryTransparent = Color(0xD17D984A);
  
  // Stress level circle colors (opacity variants of stressPrimary)
  static const Color stressCircleSemiTransparent = Color.fromRGBO(78, 115, 9, 0.61);
  static const Color stressCircleTransparent = Color.fromRGBO(78, 115, 9, 0.32);
}