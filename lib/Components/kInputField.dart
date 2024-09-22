import 'package:flutter/material.dart';

class kInputField extends StatelessWidget {
  final String title;
  final String hint;
  final Function(String) onChanged;
  final TextInputType inputType;

  const kInputField({
    Key? key,
    required this.title,
    required this.hint,
    required this.onChanged,
    this.inputType = TextInputType.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: Theme.of(context).textTheme.labelLarge?.copyWith(fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        Material(shadowColor: Colors.black,borderRadius: BorderRadius.circular(30),elevation: 2,
          child: TextField(
            onChanged: onChanged,
            decoration: InputDecoration(
              hintText: hint,
              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide.none,
              ),
              filled: true,
              fillColor: Colors.grey[100],
            ),
            keyboardType: inputType,
          ),
        ),
      ],
    );
  }
}
