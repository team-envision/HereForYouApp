import 'package:any_link_preview/any_link_preview.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class ArticlesView extends GetView {
  const ArticlesView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Articles'),
        backgroundColor: Colors.white,
        titleTextStyle: Get.textTheme.displaySmall
            ?.copyWith(fontSize: 30, fontWeight: FontWeight.w500),
        centerTitle: true,
      ),
      body: Center(
          child: ListView(
        children: [
          linkPreview(link: "https://www.psychiatry.org/patients-families/depression/what-is-depression"),
          linkPreview(link: "https://www.nimh.nih.gov/health/topics/anxiety-disorders"),
          linkPreview(link: "https://www.apa.org/topics/stress/health"),
          linkPreview(link: "https://www.healthline.com/health/natural-ways-to-reduce-anxiety"),
          linkPreview(link: "https://www.helpguide.org/mental-health/stress/quick-stress-relief"),
          linkPreview(link: "https://www.nhs.uk/mental-health/self-help/tips-and-support/how-to-be-happier/"),
        ],
      )),
    );
  }
}

Widget linkPreview({required String link}) {
  return Padding(padding: EdgeInsets.all(12),
    child: AnyLinkPreview(
      link: link,
      showMultimedia: true,
      displayDirection: UIDirection.uiDirectionHorizontal,
      backgroundColor: Colors.white,
    ),
  );
}
