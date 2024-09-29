import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:here_for_you_app/app/modules/home/views/home_view.dart';
import 'package:here_for_you_app/app/views/views/articles_view.dart';
import '../controllers/mental_score_controller.dart';

class MentalScoreView extends GetView<MentalScoreController> {
  const MentalScoreView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MentalScoreController());
    return Scaffold(
        backgroundColor: Colors.white,
        body: NotificationListener(
          onNotification: (scrollNotification) {
            controller.scrollListener();
            return true;
          },
          child: NestedScrollView(
            controller: controller.scrollController,
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  expandedHeight: Get.height * 0.5,
                  title: const Text("Mental Score"),
                  leading: IconButton(
                    onPressed: () {
                      Get.off(()=>HomeView());
                    },
                    icon: const Icon(Icons.arrow_back),
                  ),
                  floating: true,
                  titleTextStyle: Get.theme.textTheme.titleLarge
                      ?.copyWith(fontWeight: FontWeight.bold),
                  backgroundColor: Colors.white,
                  surfaceTintColor: Colors.white,
                  pinned: true,
                  centerTitle: true,
                  flexibleSpace: FlexibleSpaceBar(
                    background: ClipPath(
                      clipper: ArcClipper(),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            color: const Color.fromRGBO(237, 222, 212, 1),
                            child: SvgPicture.asset(
                              "lib/assets/images/mentalScorepageBgrnd.svg",
                              fit: BoxFit.fitWidth,
                              alignment: const Alignment(0, -0.9),
                            ),
                          ),
                          Container(
                            width: 200,
                            alignment: Alignment.center,
                            decoration: const BoxDecoration(
                              color: Color.fromRGBO(118, 90, 72, 1),
                              shape: BoxShape.circle,
                            ),
                            child: Obx(()=>Image.asset(controller.imgUrl.value,fit: BoxFit.contain)),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ];
            },
            body: Padding(
              padding: const EdgeInsets.only(top: 16.0, right: 16, left: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Center(
                    child: Text(
                      "Mental Assessment",
                      style: Get.theme.textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Obx(()=>Text(
                    (controller.msg.value+"\n"+controller.endMsg.value),
                    style: Get.theme.textTheme.bodyLarge?.copyWith(
                      fontSize: 16,
                      height: 1.4,
                    ),
                    textAlign: TextAlign.center,
                  )),
                  const SizedBox(height: 16),
                  Obx(
                    () => controller.isScrollingUp.value
                        ? Flexible(
                          child: Wrap(alignment: WrapAlignment.start,crossAxisAlignment: WrapCrossAlignment.start,runSpacing: 32,
                              children: [
                                Text(
                                  "Previous Results",
                                  style:
                                      Get.theme.textTheme.titleMedium?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 22,
                                  ),
                                ),
                                SizedBox(height: 200,width: Get.width-50,
                                  child: BarChart(
                                    BarChartData(
                                      alignment: BarChartAlignment.spaceAround,
                                      barTouchData: BarTouchData(enabled: true),
                                      titlesData: FlTitlesData(
                                        show: true,
                                        topTitles: const AxisTitles(),
                                        rightTitles: const AxisTitles(),
                                        bottomTitles: AxisTitles(
                                          sideTitles: SideTitles(
                                            showTitles: true,
                                            interval: 1,
                                            getTitlesWidget:
                                                (double value, TitleMeta meta) {
                                              const style = TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14,
                                              );
                                              switch (value.toInt()) {
                                                case 0:
                                                  return const Text('Mon',
                                                      style: style);
                                                case 1:
                                                  return const Text('Tue',
                                                      style: style);
                                                case 2:
                                                  return const Text('Wed',
                                                      style: style);
                                                case 3:
                                                  return const Text('Thu',
                                                      style: style);
                                                case 4:
                                                  return const Text('Fri',
                                                      style: style);
                                                case 5:
                                                  return const Text('Sat',
                                                      style: style);
                                                case 6:
                                                  return const Text('Sun',
                                                      style: style);
                                                default:
                                                  return const SizedBox();
                                              }
                                            },
                                          ),
                                        ),
                                        leftTitles: AxisTitles(
                                          sideTitles: SideTitles(
                                            showTitles: true,
                                            interval: 20,
                                            getTitlesWidget:
                                                (double value, TitleMeta meta) {
                                              return value % 20 == 0
                                                  ? Text(value.toInt().toString(),
                                                      style: const TextStyle(
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ))
                                                  : const SizedBox();
                                            },
                                          ),
                                        ),
                                      ),
                                      borderData: FlBorderData(
                                        border: const Border(
                                          bottom: BorderSide(color: Colors.brown),
                                        ),
                                      ),
                                      barGroups: _buildBarGroups(),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                        )
                        : const SizedBox.shrink(),
                  ),
                  Flexible(
                    child: TextButton(
                      onPressed: () {
                        Get.to(()=>const ArticlesView());
                      },
                      child: Text(
                        "Need Help? Refer to our Articles",
                        style: Get.theme.textTheme.bodyLarge?.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }

  List<BarChartGroupData> _buildBarGroups() {
    return [
      BarChartGroupData(
        x: 0,
        barRods: [BarChartRodData(toY: 30, color: Colors.brown)],
      ),
      BarChartGroupData(
        x: 1,
        barRods: [BarChartRodData(toY: 40, color: Colors.brown)],
      ),
      BarChartGroupData(
        x: 2,
        barRods: [BarChartRodData(toY: 80, color: Colors.brown)],
      ),
      BarChartGroupData(
        x: 3,
        barRods: [BarChartRodData(toY: 50, color: Colors.brown)],
      ),
      BarChartGroupData(
        x: 4,
        barRods: [BarChartRodData(toY: 40, color: Colors.brown)],
      ),
      BarChartGroupData(
        x: 5,
        barRods: [BarChartRodData(toY: 70, color: Colors.brown)],
      ),
      BarChartGroupData(
        x: 6,
        barRods: [BarChartRodData(toY: 20, color: Colors.brown)],
      ),
    ];
  }
}

class ArcClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0.0, size.height); // Start at bottom left
    path.quadraticBezierTo(
        size.width / 2, 380.0, size.width, size.height); // Create arc
    path.lineTo(size.width, 0.0); // Draw right side
    path.close(); // Close the path
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
