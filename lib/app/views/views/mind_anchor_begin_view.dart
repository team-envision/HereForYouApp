import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../modules/MindAnchorMainScreen/views/mind_anchor_main_screen_view.dart';

class MindAnchorBeginView extends GetView {
  const MindAnchorBeginView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mind Anchor'),
        titleTextStyle:
            Get.textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.w500),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Notice your Breathing",
              style: Get.textTheme.labelLarge?.copyWith(fontSize: 23),
            ),
            SizedBox(
              height: 50,
            ),
            SizedBox(
                height: 100,
                width: 100,
                child: MaterialButton(
                  onPressed: () {
                    Get.off(() => MindAnchorMainScreenView());
                  },
                  shape: CircleBorder(),
                  color: Color.fromRGBO(132, 100, 193, 1),
                  child: Text(
                    "Begin",
                    style:
                        Get.textTheme.titleLarge?.copyWith(color: Colors.white),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
