import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/password_view_controller.dart';

class OTPView extends GetView<PasswordViewController> {
  const OTPView({super.key});

  @override
  Widget build(BuildContext context) {
    final scaffoldBackgroundColor = Colors.white;

    return Scaffold(
      backgroundColor: scaffoldBackgroundColor,
      appBar: AppBar(
        titleSpacing: -10,
        title: Text(
          'Forgot Password',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Get.back();
          },
        ),
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            Text(
              'OTP',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                color: scaffoldBackgroundColor,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 3,
                    blurRadius: 6,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: TextField(
                controller: controller.otpController,
                decoration: InputDecoration(
                  hintText: 'Enter OTP sent on mail and phone',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  contentPadding: EdgeInsets.all(16),
                  filled: true,
                  fillColor: scaffoldBackgroundColor,
                ),
              ),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 40.0),
              child: ElevatedButton(
                onPressed: () {
                  Get.toNamed('/changePassword');
                },
                child: Text(
                  'Continue',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 50),
                  backgroundColor: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
