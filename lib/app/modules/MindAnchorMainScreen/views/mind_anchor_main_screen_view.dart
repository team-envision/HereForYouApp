import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';

import '../controllers/mind_anchor_main_screen_controller.dart';

class MindAnchorMainScreenView extends GetView<MindAnchorMainScreenController> {
  const MindAnchorMainScreenView({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MindAnchorMainScreenController());
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            // Handle back press
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        title: Text(
          "Mind Anchor",
          style: Theme.of(context)
              .textTheme
              .headlineSmall
              ?.copyWith(color: Colors.black),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.home, color: Colors.black),
            onPressed: () {
              // Handle home press
            },
          )
        ],
      ),
      body: Obx(()=>Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Display the current title
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Text(
              controller.titles[controller.currentIndex.value],
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 40),
          // Display the current image
          Image.asset(
            controller.imagePaths[controller.currentIndex.value],
            height: 200,
          ),
          const SizedBox(height: 40),
          // Display the timer
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.black.withOpacity(0.2)),
            ),
            child: Text(
              '00:${controller.remainingTime}',
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  color: Colors.black, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),)
    );
  }
}
