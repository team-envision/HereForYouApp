import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class OutLinedGender extends StatelessWidget {
  const OutLinedGender({
    super.key,
    required this.text,
    required this.svgPic,
    required this.backColor,
    required this.borderColor,
  });

  final String text;
  final String svgPic;
  final Color backColor;
  final Color borderColor;


  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 45, vertical: 16),
        child: Container(
          height: 69,
          child: OutlinedButton(
            onPressed: () {
              // Define your action here
            },
            style: OutlinedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              backgroundColor: backColor, // Background color
              side: BorderSide(
                color:borderColor, // Outline color
                width: 2.0, // Outline width
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(32), // Rounded corners
              ),
            ),
            child: Row(
              children: [
                SvgPicture.asset(
                  svgPic,
                  fit: BoxFit.fitWidth,
                  alignment: const Alignment(0, -0.9),
                ),
                const SizedBox(width: 20),
                Text(
                  text,
                  style: const TextStyle(
                    color: Colors.black, // Text color
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'fontmain',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
