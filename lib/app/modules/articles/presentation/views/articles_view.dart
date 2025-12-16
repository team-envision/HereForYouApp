import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:here_for_you_app/app/modules/articles/presentation/widgets/article.dart';
import 'package:here_for_you_app/common/Components/loading_overlay.dart';

import '../../../../../resources/app_resources/app_colors.dart';
import '../controllers/articles_controller.dart';

class ArticlesView extends GetView<ArticlesController> {
  const ArticlesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => LoadingOverlay(
        isLoading: controller.state.isDataLoading.value,
        loadingAnimation: "assets/animations/loadingFace.gif",
        size: 92,
        child: content(),
      ),
    );
  }

  Widget content() {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        scrolledUnderElevation: 0,
        titleSpacing: 0,
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
          'Articles',
          style: GoogleFonts.urbanist(
            fontWeight: FontWeight.w800,
            fontSize: 24.95.sp,
            letterSpacing: -0.3,
          ),
        ),
      ),
      body: Obx(
        () => ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: controller.state.articles.length,

          itemBuilder: (context, index) {
            return Article(
              image: controller.state.articles[index].image,
              label: controller.state.articles[index].label,
              link: controller.state.articles[index].link,
              onTap: () =>
                  controller.onTap(controller.state.articles[index].link),
            );
          },
        ),
      ),
    );
  }
}
