import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';

import '../../../../Components/kElevatedButton.dart';
import '../../../../Components/kOutlinedButton.dart';
import '../controllers/gender_page_controller.dart';

class GenderPageView extends GetView<GenderPageController> {
  const GenderPageView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 18,right: 18),
            child: Text('what is your official ',style: TextStyle(fontSize: 35,color: Colors.black,fontWeight: FontWeight.w900,fontFamily:'fontmain'),),
          ),
          Text(' gender ?',style: TextStyle(fontSize: 35,color: Colors.black,fontWeight: FontWeight.w900,fontFamily: 'fontmain'),),
          SizedBox(height: 13,),
         OutLinedGender(text: 'I am male', svgPic: 'lib/assets/images/Solidarrowrightm.svg', backColor: Color.fromRGBO(30, 240, 250, 1), borderColor:   Color.fromRGBO(60, 124, 188, 1),),

          SizedBox(height: 13,),
          OutLinedGender(text: 'I am female', svgPic: 'lib/assets/images/Solidarrowrightsm.svg',backColor: Color.fromRGBO(238, 233, 247, 1), borderColor:   Color.fromRGBO(112, 78, 175, 1),),
          SizedBox(height: 20,),
          OutLinedGender(text: 'Others', svgPic: 'lib/assets/images/Solidarrowrightsm.svg',backColor: Color.fromRGBO(232, 255, 189, 1), borderColor:   Color.fromRGBO(145, 187, 67, 1),),
          SizedBox(height: 21),
          kElevatedButton(text: 'Next', onPressed: () {  },)

        ],
      )
    );
  }
}
