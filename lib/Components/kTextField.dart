import 'package:flutter/material.dart';

class CustomTextField1 extends StatelessWidget {
  const CustomTextField1({
    super.key,
    required this.hintText,
    required this.obscureText,
    this.maxLines = 1,
  });

  final String hintText;
  final bool obscureText;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5), // Shadow color with opacity
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3), // Horizontal and vertical shadow offset
          ),
        ],
      ),
      child: Material(
        borderOnForeground: false,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: TextFormField(
          maxLines: maxLines,
          controller: nameController,
          decoration: InputDecoration(
            hintText: hintText,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(7.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: const BorderSide(
                color: Colors.black12,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
              borderSide: const BorderSide(
                color: Colors.black12,
              ),
            ),
          ),
          obscureText: obscureText,
        ),
      ),
    );
  }
}
