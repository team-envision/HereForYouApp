import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../resources/app_resources/app_colors.dart';
import '../controllers/ai_chat_bot_screen_controller.dart';
import '../widgets/snap_scroll_physics.dart';

class AiChatBotScreenView extends GetView<AiChatBotScreenController> {
  const AiChatBotScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      body: NestedScrollView(
        physics: const SnapScrollPhysics(),
        controller: controller.state.scrollController,
        floatHeaderSlivers: true,
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: Get.height * 0.835,
              title: Text(
                "A.I Chat Bot",
                style: GoogleFonts.urbanist(
                  fontSize: 24.95.sp,
                  fontWeight: FontWeight.w800,
                  letterSpacing: -0.3,
                ),
              ),
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Image.asset(
                  "assets/images/backward_arrow.png",
                  height: 22.43.h,
                  width: 17.5.w,
                ),
              ),
              floating: true,
              snap: true,
              pinned: true,
              centerTitle: true,
              backgroundColor: Colors.white,
              surfaceTintColor: Colors.white,
              titleTextStyle: Get.theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
              flexibleSpace: FlexibleSpaceBar(
                background: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      child: Stack(
                        children: [
                          Positioned(
                            height: 360.h,
                            width: 416.94.w,
                            top: 113.h,
                            left: -11.w,
                            child: Image.asset(
                              "assets/images/AiChatBotImage.png",
                            ),
                          ),
                          Positioned(
                            top: 485.h,
                            left: -295.w,
                            child: Container(
                              width: 984.w,
                              height: 947.h,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(1265.27.r),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Color(0x0D4B3425),
                                    offset: Offset(0, 0),
                                    blurRadius: 0,
                                    spreadRadius: 0,
                                  ),
                                  BoxShadow(
                                    color: Color(0x0D4B3425),
                                    offset: Offset(0, -17.43),
                                    blurRadius: 38.96,
                                    spreadRadius: 0,
                                  ),
                                  BoxShadow(
                                    color: Color(0x0A4B3425),
                                    offset: Offset(0, -70.75),
                                    blurRadius: 70.75,
                                    spreadRadius: 0,
                                  ),
                                  BoxShadow(
                                    color: Color(0x084B3425),
                                    offset: Offset(0, -157.9),
                                    blurRadius: 95.36,
                                    spreadRadius: 0,
                                  ),
                                  BoxShadow(
                                    color: Color(0x034B3425),
                                    offset: Offset(0, -280.94),
                                    blurRadius: 112.79,
                                    spreadRadius: 0,
                                  ),
                                  BoxShadow(
                                    color: Color(0x004B3425),
                                    offset: Offset(0, -438.85),
                                    blurRadius: 123.04,
                                    spreadRadius: 0,
                                  ),
                                ],
                              ),
                              child: Column(
                                children: [
                                  SizedBox(height: 50.h),
                                  Text(
                                    "Your Mental Health Companion",
                                    style: GoogleFonts.urbanist(
                                      fontWeight: FontWeight.w800,
                                      fontSize: 20.sp,
                                      letterSpacing: 0.02 * 2.sp,
                                    ),
                                  ),
                                  SizedBox(height: 20.h),
                                  SizedBox(
                                    width: 340.w,
                                    child: Text(
                                      textAlign: TextAlign.center,
                                      "Our AI Chatbot is here to help you navigate through mental health challenges with instant support, guidance, and resources. Whether you're feeling stressed, anxious, or just need someone to talk to, our AI is ready to listen and provide helpful insights.",
                                      style: GoogleFonts.urbanist(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14.sp,
                                        letterSpacing: 0.07 * 14.sp,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ];
        },
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 22.w, vertical: 13.h),
          child: Column(
            children: [
              Expanded(
                child: Obx(
                      () => DashChat(
                    currentUser: controller.state.user,
                    typingUsers: controller.state.isGeminiTyping.value
                        ? [controller.state.geminiUser]
                        : [],
                    onSend: controller.onSend,
                    messages: controller.state.messages.toList(),
                    inputOptions: InputOptions(
                      inputTextStyle: GoogleFonts.urbanist(
                        fontWeight: FontWeight.w600,
                        fontSize: 15.sp,
                        color: AppColors.black,
                      ),
                      inputToolbarStyle: BoxDecoration(
                        borderRadius: BorderRadius.circular(30.r),
                        boxShadow: const <BoxShadow>[
                          BoxShadow(
                            color: AppColors.genericShadow,
                            offset: Offset(0, 0),
                            blurRadius: 11,
                            spreadRadius: -10,
                          ),
                        ],
                      ),
                      inputDecoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.r),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor: AppColors.white,
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 22.w,
                          vertical: 13.h,
                        ),
                        hintText: "Ask your question",
                        hintStyle: GoogleFonts.urbanist(
                          fontWeight: FontWeight.w700,
                          fontSize: 14.sp,
                          color: AppColors.textHintMuted,
                        ),
                      ),
                      sendButtonBuilder: (onSend) {
                        return IconButton(
                          onPressed: onSend,
                          icon: Container(
                            padding: EdgeInsets.all(12.w),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.white,
                            ),
                            child: Icon(Icons.send_rounded),
                          ),
                        );
                      },
                    ),
                    messageOptions: MessageOptions(
                      showTime: false,
                      showOtherUsersName: true,
                      showOtherUsersAvatar: false,
                      currentUserContainerColor: Colors.black,
                      messagePadding: EdgeInsets.symmetric(
                        horizontal: 16.w,
                        vertical: 12.h,
                      ),
                      messageTextBuilder:
                          (message, previousMessage, nextMessage) {
                        return Text(
                          message.text,
                          style: GoogleFonts.urbanist(
                            fontWeight: FontWeight.w600,
                            fontSize: 15.sp,
                            color:
                            message.user.id == controller.state.user.id
                                ? AppColors.white
                                : AppColors.black,
                          ),
                        );
                      },
                      userNameBuilder: (user) {
                        return Text(
                          user.getFullName(),
                          style: GoogleFonts.urbanist(
                            fontWeight: FontWeight.w500,
                            fontSize: 12.sp,
                            color: AppColors.black,
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ArcClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0.0, size.height);
    path.quadraticBezierTo(
      size.width / 2,
      size.height * 0.7,
      size.width,
      size.height,
    );
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}