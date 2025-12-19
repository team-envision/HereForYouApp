import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:here_for_you_app/common/Components/bar_graph.dart';
import 'package:here_for_you_app/common/Components/loading_overlay.dart';

import '../../../../../resources/app_resources/app_colors.dart';
import '../../../../routes/app_pages.dart';
import '../controllers/mental_score_controller.dart';

class MentalScoreView extends GetView<MentalScoreController> {
  const MentalScoreView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => LoadingOverlay(
        isLoading: controller.state.isDataLoading.value,
        loadingAnimation: "assets/animations/loadingHead.gif",
        size: 130,
        child: content(context),
      ),
    );
  }

  Widget content(BuildContext context) {
    const double minExtent = 0.43;
    const double maxExtent = 1.0;
    final double topPadding =
        MediaQuery.of(context).padding.top + kToolbarHeight;

    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: const Color(0xFFF4E5DB),
      appBar: AppBar(
        backgroundColor: AppColors.transparent,
        scrolledUnderElevation: 0,
        titleSpacing: 0,
        centerTitle: true,
        leadingWidth: 70.w,
        leading: Padding(
          padding: EdgeInsets.only(left: 8.w),
          child: IconButton(
            icon: Image.asset(
              "assets/images/backward_arrow.png",
              width: 34.18.w,
              height: 29.91.h,
            ),
            onPressed: () => Get.back(),
          ),
        ),
        title: Text(
          'Mind Score',
          style: GoogleFonts.urbanist(
            fontWeight: FontWeight.w800,
            fontSize: 24.95.sp,
            letterSpacing: -0.3,
          ),
        ),
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: 192.h,
            height: 230.h,
            width: 230.w,
            child: Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFF765A48),
              ),
              child: Center(
                child: Obx(
                  () => Text(
                    controller.resultsModel.value
                        .getTodayScore()
                        .mentalScore
                        .toString(),
                    style: GoogleFonts.urbanist(
                      fontWeight: FontWeight.w800,
                      fontSize: 128.07.sp,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),

          NotificationListener<DraggableScrollableNotification>(
            onNotification: (notification) {
              controller.updateExtent(notification.extent);
              return true;
            },
            child: DraggableScrollableSheet(
              initialChildSize: minExtent,
              minChildSize: minExtent,
              maxChildSize: maxExtent,
              builder:
                  (BuildContext context, ScrollController scrollController) {
                    return Obx(() {
                      double currentExtent = controller.sheetExtent.value;
                      double factor =
                          ((maxExtent - currentExtent) /
                                  (maxExtent - minExtent))
                              .clamp(0.0, 1.0);
                      double alignX = -1.0 * (1.0 - factor);
                      double topSpaceFactor = (1.0 - factor) * 0.9;

                      return Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.elliptical(
                              200 * factor,
                              50 * factor,
                            ),
                            topRight: Radius.elliptical(
                              200 * factor,
                              50 * factor,
                            ),
                          ),
                          boxShadow: const [
                            BoxShadow(
                              offset: Offset(0, -15),
                              blurRadius: 30,
                              color: Color(0x0D4B3425),
                            ),
                          ],
                        ),
                        child: SingleChildScrollView(
                          controller: scrollController,
                          physics: const ClampingScrollPhysics(),
                          child: Column(
                            children: [
                              SizedBox(height: topPadding * topSpaceFactor),
                              SizedBox(height: 42.h),

                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 24.w),
                                child: Align(
                                  alignment: Alignment(alignX, 0),
                                  child: Text(
                                    "Mental Assessment",
                                    style: GoogleFonts.urbanist(
                                      fontWeight: FontWeight.w800,
                                      fontSize: 20.sp,
                                    ),
                                  ),
                                ),
                              ),

                              SizedBox(height: 18.h),

                              SizedBox(
                                width: 340.w,
                                height: 209.h,
                                child: Text(
                                  controller.resultsModel.value
                                              .getTodayScore()
                                              .mentalScore ==
                                          0
                                      ? "You have not taken the test yet."
                                      : controller
                                            .resultsModel
                                            .value
                                            .mentalRecommendation,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 8,
                                  textAlign: factor > 0.8
                                      ? TextAlign.center
                                      : TextAlign.left,
                                  style: GoogleFonts.urbanist(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16.sp,
                                    height: 1.5,
                                  ),
                                ),
                              ),
                              SizedBox(height: 200 * (1 - topSpaceFactor)),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 26.5.w,
                                ),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "Previous Results",
                                    style: GoogleFonts.urbanist(
                                      fontWeight: FontWeight.w800,
                                      fontSize: 20.sp,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 20.h),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 26.5.w,
                                ),
                                child: SizedBox(
                                  height: 170.h,
                                  child: Obx(
                                    () => CustomBarGrpah(
                                      leftLabel: controller.state.leftLabels,
                                      values: controller
                                          .resultsModel
                                          .value
                                          .mentalScores,
                                      barColor: const Color(0xFF765A48),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 20.h),
                            ],
                          ),
                        ),
                      );
                    });
                  },
            ),
          ),
          Positioned(
            top: 800.h,
            child: TextButton(
              style: TextButton.styleFrom(
                overlayColor: const Color(0xFF765A48),
              ),
              onPressed: () => Get.toNamed(Routes.ARTICLES),
              child: Text(
                "Need Help? Refer to our Articles",
                style: GoogleFonts.urbanist(
                  color: AppColors.black,
                  fontWeight: FontWeight.w700,
                  fontStyle: FontStyle.italic,
                  fontSize: 14.33.sp,
                  letterSpacing: 0.02 * 14.33.sp,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
