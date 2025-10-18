import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:here_for_you_app/resources/app_resources/app_colors.dart';

import '../../../../Components/kElevatedButton.dart';
import '../../../../Components/kTextField.dart';
import '../controllers/feed_back_controller.dart';

class FeedBackView extends GetView<FeedBackController> {
  const FeedBackView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Get.back();
          },
        ),
        title: const Text('FeedBack',
            style: TextStyle(
              fontSize: 25,
              color: AppColors.black,
              fontWeight: FontWeight.w900,
              fontFamily: 'fontmain',
            )),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Padding(
            padding: EdgeInsets.only(right: 121, top: 30),
            child: Text('Got Any Feedback for us ?',
                style: TextStyle(
                  fontSize: 15,
                  color: AppColors.black,
                  fontWeight: FontWeight.w900,
                  fontFamily: 'fontmain',
                )),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            child: CustomTextField1(
              hintText: 'Write your feedback here',
              obscureText: false,
              maxLines: 7,
            ),
          ),
          const Spacer(),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 25.w),
            width: double.infinity,
            height: 49.h,
            child: kElevatedButton(
              fontSize: 21.07.sp,
              text: 'Save Details',
              onPressed: () {},
            ),
          )
        ],
      ),
    );
  }
}
