import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:here_for_you_app/resources/app_resources/app_colors.dart';

class LoadingOverlay extends StatelessWidget {
  final bool isLoading;
  final Widget child;
  final String loadingAnimation;
  final double size;

  const LoadingOverlay({
    super.key,
    required this.isLoading,
    required this.child,
    required this.loadingAnimation,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        if (isLoading)
          Container(
            width: double.infinity,
            height: double.infinity,
            color: AppColors.white,
            child: Center(
              child: Image.asset(
                loadingAnimation,
                width: size.w,
                height: size.h,
              ),
            ),
          ),
      ],
    );
  }
}
