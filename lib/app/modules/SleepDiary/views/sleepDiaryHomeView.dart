import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SleepDiaryHomeView extends StatelessWidget {
  const SleepDiaryHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white,
      appBar: AppBar(backgroundColor: Colors.white,
        title: const Text("Sleep Diary"),
        titleTextStyle: Get.theme.textTheme.titleLarge?.copyWith(
          fontWeight: FontWeight.bold,
        ),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back_rounded,
            size: 32,
          ),
        ),
        leadingWidth: 90,
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(height: 40),
          _buildSleepResultContainer("Sleep Results",const Icon(Icons.receipt)),
          const SizedBox(height: 20),
          _buildSleepResultContainer("Enter Your Diary",const Icon(Icons.inventory_rounded)), // Reusable container
        ],
      ),
    );
  }

  // Reusable widget for the sleep result container
  Widget _buildSleepResultContainer(String text,Icon icon) {
    return Container(
      height: 150,margin: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(
          color: Colors.grey.shade400,
          width: 2,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              text,
              style: Get.textTheme.labelLarge?.copyWith(fontWeight: FontWeight.w700,fontSize: 23),
            ),
             Align(
              alignment: Alignment.bottomRight,
              child: icon,
            ),
          ],
        ),
      ),
    );
  }
}