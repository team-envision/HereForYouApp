import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';

import '../controllers/get_started_controller.dart';

class GetStartedView extends GetView<GetStartedController> {
  const GetStartedView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body:  Stack(
        children:[ Container(
          width: double.infinity,  // Full width of the screen
          height: double.infinity, // Full height of the screen
          child: SvgPicture.asset(
            "lib/assets/images/GetStarted.svg",
            fit: BoxFit.cover, // Ensures the SVG covers the entire screen
          ),
        ),

      ]
      )
    );
  }
}