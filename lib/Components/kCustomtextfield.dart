import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final String hintText;
  final TextInputType keyboardType;
  final TextStyle hintStyle;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;

  const CustomTextField({
    required this.label,
    required this.hintText,
    this.keyboardType = TextInputType.text,
    this.hintStyle = const TextStyle(fontSize: 15, fontFamily: 'Urbanist'),
    this.controller,
    this.validator,
    this.onSaved,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontFamily: 'fontmain',
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 7),
        Material( shadowColor: Colors.black, borderRadius: BorderRadius.circular(30), elevation: 5,
          child: TextFormField(
            decoration: InputDecoration(
              hintText: hintText,
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(35),
                borderSide: BorderSide.none
              ),
              contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
              hintStyle: hintStyle,
            ),
            keyboardType: keyboardType,
            style: const TextStyle(fontFamily: 'Urbanist'),
            controller: controller,
            validator: validator,
            onSaved: onSaved,
          ),
        ),
      ],
    );
  }
}
