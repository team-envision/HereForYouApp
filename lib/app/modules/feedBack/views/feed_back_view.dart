import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../Components/kTextField.dart';
import '../controllers/feed_back_controller.dart';

class FeedBackView extends GetView<FeedBackController> {
  const FeedBackView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back,weight: 23,),
        title: const Text('FeedBack',style: TextStyle(fontSize: 25,color: Colors.black,fontWeight: FontWeight.w900,fontFamily:'fontmain',)),

      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(right:121 ,top: 30),
            child: Text(
              'Got Any Feedback for us ?',
                style: TextStyle(fontSize: 15,color: Colors.black,fontWeight: FontWeight.w900,fontFamily:'fontmain',)
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 10
    ),
            child: CustomTextField1(hintText: 'Write your feedback here', obscureText: false,maxLines: 7,),
          )

        ],
      ),
    );
  }
}
