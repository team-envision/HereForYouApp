import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';

import '../../../../Components/featureContainers.dart';
import '../controllers/get_started_controller.dart';

class GetStartedView extends GetView<GetStartedController> {
  const GetStartedView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body:  Stack(alignment: Alignment.bottomCenter,
        children:[ Container(
          width: double.infinity,  // Full width of the screen
          height: double.infinity, // Full height of the screen
          child: SvgPicture.asset(
            "lib/assets/images/GetStarted.svg",
            fit: BoxFit.cover, // Ensures the SVG covers the entire screen
          ),
        ),
          Padding(
            padding: const EdgeInsets.only(top: 15,bottom: 20,left: 12,right: 12),
            child: kCard(backGroundColor: Colors.white, borderColor: Colors.black, text: 'Get Started', IsSvg: true
                , ImagePath: 'lib/assets/images/GetStartedCard.svg' ,iconPath: "lib/assets/icons/signInIcon.png",alignment: Alignment(1.3,0)),
          )
      ]
      )
    );
  }
}
