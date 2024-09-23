import 'package:flutter/material.dart';
import 'package:get/get.dart';

class kElevatedButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const kElevatedButton({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: const StadiumBorder(),
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 110),
          backgroundColor: Colors.black,
        ),
        onPressed: onPressed,
        child: Wrap(
          alignment: WrapAlignment.center,
          spacing: 5,
          children: [
            Text(
              text,
              style: Get.theme.textTheme.titleLarge?.copyWith(
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Icon(
              Icons.arrow_forward,
              color: Colors.white,
              size: 23,
            )
          ],
        ));
  }
}
