import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

Widget kCard({required Color backGroundColor,required Color borderColor,required String text, required bool IsSvg,required String ImagePath,required String iconPath, String? subText,  Alignment? alignment, dynamic? onTap}){
  return  GestureDetector(
    onTap: onTap,
    child: Container(
      height: 200,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: BoxDecoration(
          color: backGroundColor,
          border:
          Border.all(color: borderColor),
          borderRadius: BorderRadius.circular(22)),
      child: Stack(
          fit: StackFit.expand,
          alignment: Alignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Wrap(direction: Axis.vertical,
                children: [
                  Text(
                    text,
                    style: Get.theme.textTheme.titleLarge?.copyWith(
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subText!=null?Text(
                    subText,
                    style: Get.theme.textTheme.labelMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ):const SizedBox()
                ],
              ),
            ),
            IsSvg? SvgPicture.asset(
              ImagePath!,
              alignment: alignment??const Alignment(2, 1),
            ) : Image.asset(ImagePath!,alignment:  alignment??const Alignment(2, 1),),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Image.asset(
                iconPath,
                alignment: Alignment.bottomLeft,
              ),
            ),
          ]),
    ),
  );
}