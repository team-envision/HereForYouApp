import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget kContainer(
    {required Color color, required String text, required Widget icon,  dynamic? onTap}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      decoration:
      BoxDecoration(color: color, borderRadius: BorderRadius.circular(22)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              text,
              style: Get.theme.textTheme.titleLarge
                  ?.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
          icon
        ],
      ),
    ),
  );
}