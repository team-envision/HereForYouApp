import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:here_for_you_app/app/modules/emergency_contact/views/emergency_contact_view.dart';
import 'package:here_for_you_app/app/modules/feedBack/views/feed_back_view.dart';
import 'package:here_for_you_app/app/views/views/articles_view.dart';

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
          _buildMenuItem("Articles", Icons.article,onTap: (){Get.to(()=>ArticlesView());}),
          _buildMenuItem("Change Password", Icons.lock),
          _buildMenuItem("Emergency Contact", Icons.phone, onTap: (){Get.to(()=>EmergencyContactView());}),
          _buildMenuItem("Feedback", Icons.feedback,onTap: (){Get.to(()=>FeedBackView());}),
          _buildMenuItem("Delete Account", Icons.delete, color: Colors.red),
        ],
      ),
    );
  }

  Widget _buildMenuItem(String title, IconData icon, {Color? color,dynamic? onTap}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: GestureDetector(
        onTap: onTap,
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
