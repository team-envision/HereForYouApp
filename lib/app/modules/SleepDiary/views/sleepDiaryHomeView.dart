import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'enter_diary_view.dart';

class SleepDiaryHomeView extends StatelessWidget {
  const SleepDiaryHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text("Sleep Diary"),
        titleTextStyle: Get.theme.textTheme.titleLarge?.copyWith(
          fontWeight: FontWeight.bold,
        ),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back_rounded,
            size: 36,
            color: Colors.black,
          ),
        ),
        leadingWidth: 90,
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Get.toNamed('/home'); // Ensure this route is properly registered
            },
            icon: const Icon(
              Icons.home,
              size: 28,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(height: 40),
          _buildSleepResultContainer("Sleep Results", const Icon(Icons.receipt)),
          const SizedBox(height: 20),
          _buildSleepResultContainer(
            "Enter Your Diary",
            const Icon(Icons.inventory_rounded),
            onTap: () {
              Get.to(() => EnterDiaryView()); // Navigate to EnterDiaryView
            },
          ),
        ],
      ),
    );
  }

  // Reusable widget for the sleep result container
  Widget _buildSleepResultContainer(String text, Icon icon, {VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap, // Makes the container tappable
      child: Container(
        height: 150,
        margin: const EdgeInsets.all(15),
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
                style: Get.textTheme.labelLarge?.copyWith(
                  fontWeight: FontWeight.w700,
                  fontSize: 23,
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: icon,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
