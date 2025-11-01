import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:here_for_you_app/resources/app_resources/app_colors.dart';

import '../controllers/face_loading_controller.dart';

class FaceLoadingView extends GetView<FaceLoadingController> {
  const FaceLoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          "assets/animations/loadingFace.gif",
          height: 92.h,
          width: 92.w,
        ),
      ),
    );
  }
}
