import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MenuPopup extends StatelessWidget {
  const MenuPopup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min, // Ensure the sheet fits its content
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.topRight,
            child: IconButton(
              icon: const Icon(Icons.close),
              onPressed: () => Get.back(),
            ),
          ),
          // Menu options
          const SizedBox(height: 0),
          _buildMenuItem("Articles", Icons.article),
          _buildMenuItem("Change Password", Icons.lock),
          _buildMenuItem("Emergency Contact", Icons.phone),
          _buildMenuItem("Feedback", Icons.feedback),
          _buildMenuItem("Delete Account", Icons.delete, color: Colors.red),
        ],
      ),
    );
  }

  Widget _buildMenuItem(String title, IconData icon, {Color? color}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: GestureDetector(
        onTap: () {
          Get.back();
        },
        child: Text(
          title,
          style: Get.textTheme.titleLarge?.copyWith(
            color: color ?? Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
