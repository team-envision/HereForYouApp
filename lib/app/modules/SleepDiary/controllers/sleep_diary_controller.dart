import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class SleepDiaryController extends GetxController {
  var selectedDate = DateTime.now().obs;
  var morningReminderTime = const TimeOfDay(hour: 6, minute: 45).obs;
  var eveningReminderTime = const TimeOfDay(hour: 20, minute: 0).obs;

  String get formattedDate => DateFormat('d of MMMM, yyyy').format(selectedDate.value);

  String formatTimeOfDay(TimeOfDay time) {
    final now = DateTime.now();
    final dt = DateTime(now.year, now.month, now.day, time.hour, time.minute);
    return DateFormat.jm().format(dt);
  }

  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate.value,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate.value) {
      selectedDate.value = picked;
    }
  }

  Future<void> selectMorningTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: morningReminderTime.value,
    );
    if (picked != null && picked != morningReminderTime.value) {
      morningReminderTime.value = picked;
    }
  }

  Future<void> selectEveningTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: eveningReminderTime.value,
    );
    if (picked != null && picked != eveningReminderTime.value) {
      eveningReminderTime.value = picked;
    }
  }

  void save() {
    Get.snackbar('Success', 'Sleep diary settings saved!');
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}



