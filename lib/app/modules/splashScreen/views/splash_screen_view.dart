import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../controllers/splash_screen_controller.dart';

class SplashScreenView extends GetView<SplashScreenController> {
  const SplashScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,  // Full width of the screen
        height: double.infinity, // Full height of the screen
        child: SvgPicture.asset(
          "lib/assets/images/landingpage.svg",
          fit: BoxFit.cover, // Ensures the SVG covers the entire screen
        ),
      ),
    );
  }
}
