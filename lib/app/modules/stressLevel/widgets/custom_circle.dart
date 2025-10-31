import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PositionedCircle extends StatelessWidget {
  final double top;
  final double left;
  final double radius;
  final Color color;

  const PositionedCircle({
    super.key,
    required this.top,
    required this.left,
    required this.radius,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      left: left,
      height: radius.h,
      width: radius.w,
      child: Container(
        decoration: BoxDecoration(shape: BoxShape.circle, color: color),
      ),
    );
  }
}

class Circle extends StatelessWidget {
  final double radius;
  final Color color;

  const Circle({super.key, required this.radius, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: radius.w,
      height: radius.h,
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
    );
  }
}
