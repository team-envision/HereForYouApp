import 'package:flutter/material.dart';

import 'package:get/get.dart';
import '../controllers/login_controller.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 30),
                SizedBox(
                  height: Get.height*0.4,
                  child:
                  SvgPicture.asset('lib/assets/images/loginImage.svg'),
                ),
                SizedBox(height: 10,),
                Text(
                  "Welcome Back",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.urbanist(
                    fontWeight: FontWeight.w700,
                    fontSize: 36,
                  )
                ),
                SizedBox(height: 10),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Email",
                      textAlign: TextAlign.left,
                      style: GoogleFonts.urbanist(
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    )
                    ),
                  ),
                ),
                Material(
                 borderRadius: BorderRadius.circular(30.0),
                  type: MaterialType.card,color: Colors.grey,elevation: 2.0,
                  child: TextField(
                    style: GoogleFonts.urbanist(textStyle: TextStyle(color: Colors.black),fontSize: 16,fontWeight: FontWeight.w400),
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      contentPadding: EdgeInsets.symmetric(horizontal: 20.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),borderSide: BorderSide.none,
                      ),
                      hintText: "Enter email",
                      hintStyle: GoogleFonts.urbanist(textStyle: TextStyle(color: Colors.grey),fontSize: 15,fontWeight: FontWeight.w600),
                  )
                  ),
                ),
            SizedBox(height: 14),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Password",
                  textAlign: TextAlign.left,
                  style: GoogleFonts.urbanist(
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                  )
                ),
              ),
            ),
                Material(
                  borderRadius: BorderRadius.circular(30.0),
                  type: MaterialType.card,color: Colors.grey,elevation: 2.0,
                  child: TextField(
                      style: GoogleFonts.urbanist(textStyle: TextStyle(color: Colors.black),fontSize: 16,fontWeight: FontWeight.w400),
                      obscureText: true,
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        contentPadding: EdgeInsets.symmetric(horizontal: 20.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),borderSide: BorderSide.none,
                        ),
                        hintText: "Enter password",
                        hintStyle: GoogleFonts.urbanist(textStyle: TextStyle(color: Colors.grey),fontSize: 15,fontWeight: FontWeight.w600),
                      ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(onPressed: (){},
                    child: Text(
                    "Forgot Password?",
                    textAlign: TextAlign.right,
                    style: GoogleFonts.urbanist(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                      fontSize: 10,
                    )
                    ),
                  ),
                ),
                Container(
                  height: Get.height*0.06,
                  width: Get.width,
                  decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0)
                      ),
                      color: Colors.black,
                  ),
                  child: TextButton(onPressed: (){},
                      child: Text(
                        "Sign in",
                        style: GoogleFonts.urbanist(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                        ),
                      )
                  ),
                ),
                SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:[
                    Container(
                      color: Colors.grey,
                      height: 2,width: Get.width*0.3,
                    ),
                    Text(
                      "  OR  ",
                      style: GoogleFonts.urbanist(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(
                      color: Colors.grey,
                      height: 2,width: Get.width*0.3,
                    ),
                  ]
                ),
                SizedBox(height: 8),
                Container(
                  height: Get.height*0.06,
                  width: Get.width,
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),side: BorderSide(color: Colors.black),
                    ),
                    color: Colors.white,
                  ),
                  child: TextButton(onPressed: (){},
                      child: Text(
                        "Sign up",
                        style: GoogleFonts.urbanist(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                        ),
                      )
                  ),
                )
              ],
            ),
          ),
        ),
      )
    );
  }
}
