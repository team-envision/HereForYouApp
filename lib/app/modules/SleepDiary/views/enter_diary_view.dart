import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:here_for_you_app/app/modules/SleepDiary/views/reminderview_view.dart';
import '../../../../Components/custom_widgets.dart';
import '../controllers/sleep_diary_controller.dart';


class EnterDiaryView extends StatelessWidget {
  final SleepDiaryController controller = Get.put(SleepDiaryController());

  EnterDiaryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Enter Diary',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Get.back();
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.home, color: Colors.black),
            onPressed: () {
              Get.offNamed('/home');
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 10),
            const Text(
              "Continue your sleep diary entry.....",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: CustomCard(
                    title: "Morning",
                    icon: Icons.wb_sunny_outlined,
                    onTap: () {
                      Get.toNamed('/morningEntry');
                    },
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: CustomCard(
                    title: "Evening",
                    icon: Icons.nightlight_round_outlined,
                    onTap: () {
                      Get.toNamed('/eveningEntry');
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            WideCard(
              title: "Set Reminder",
              icon: Icons.access_time,
              onTap: () {
                Get.to(() => const SleepDiaryReminderView());
              },
            ),

            const Spacer(),

            Padding(
              padding: const EdgeInsets.only(bottom: 60),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                  ),
                  onPressed: () {
                    Get.back();
                  },
                  child: const Text("Back", style: TextStyle(color: Colors.white, fontSize: 16)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
