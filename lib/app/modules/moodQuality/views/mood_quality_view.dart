import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';



import '../../AiChatBotScreen/views/ai_chat_bot_screen_view.dart';
import '../controllers/mood_quality_controller.dart';

class MoodQualityView extends GetView<MoodQualityController> {
  const MoodQualityView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body:  NestedScrollView(
        physics: const NeverScrollableScrollPhysics(),
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: Get.height * 0.5,
              title: const Text("Mood Quality"),
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
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
                        color: const Color(0xFFFFEBC2),
                        child: SvgPicture.asset(
                          "lib/assets/images/moodqualitypageBgrnd.svg",
                          fit: BoxFit.fitWidth,
                          alignment: const Alignment(0, -0.9),
                        ),
                      ),
                      Container(
                        height: 200,
                        width: 200,
                        alignment: Alignment.center,
                        decoration: const BoxDecoration(
                          color: Colors.transparent,
                          shape: BoxShape.circle,
                        ),
                        child: SvgPicture.asset(
                          "lib/assets/images/uiw_smile.svg",
                          fit: BoxFit.fitWidth,
                          alignment: const Alignment(0, -0.9),
                        ),

                      ),

                    ],
                  ),

                ),
              ),
            ),
          ];
        },
        body: Container(
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(topLeft:Radius.circular(34) ,topRight: Radius.circular(34) ),
              color: Colors.white
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 16.0, right: 16, left: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                const SizedBox(height: 16),

                Center(
                  child: Text(
                    "Previous Results",
                    style: Get.theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                SizedBox(height: 200,
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
                            getTitlesWidget: (double value, TitleMeta meta) {
                              const style = TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              );
                              switch (value.toInt()) {
                                case 0:
                                  return const Text('Mon', style: style);
                                case 1:
                                  return const Text('Tue', style: style);
                                case 2:
                                  return const Text('Wed', style: style);
                                case 3:
                                  return const Text('Thu', style: style);
                                case 4:
                                  return const Text('Fri', style: style);
                                case 5:
                                  return const Text('Sat', style: style);
                                case 6:
                                  return const Text('Sun', style: style);
                                default:
                                  return const SizedBox();
                              }
                            },
                          ),
                        ),
                        leftTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: true,minIncluded: true,
                            interval: 1,
                            getTitlesWidget: (double value, TitleMeta meta) {
                              switch (value) {
                                case 10:
                                  return const Text("🙁");
                                case 20:
                                  return const Text("😐",);
                                case 30:
                                  return const Text("🙂",);
                                case 40:
                                  return const Text("😃",);
                                case 50:
                                  return const Text("😆");
                                default:
                                  return const SizedBox();
                              }
                            },
                          ),
                        ),
                      ),
                      borderData: FlBorderData(
                        border: const Border(
                          bottom: BorderSide(color: Colors.grey),
                        ),
                      ),
                      barGroups: _buildBarGroups(),
                    ),
                  ),
                ),
                const SizedBox(height: 36),


              ],
            ),
          ),
        ),
      ),
    );
  }
  List<BarChartGroupData> _buildBarGroups() {
    return [
      BarChartGroupData(
        x: 0,
        barRods: [BarChartRodData(toY: 10,  color: const Color.fromRGBO(247, 206, 69, 1))],
      ),
      BarChartGroupData(
        x: 1,
        barRods: [BarChartRodData(toY: 20, color: const Color.fromRGBO(247, 206, 69, 1),)],
      ),
      BarChartGroupData(
        x: 2,
        barRods: [BarChartRodData(toY: 30,  color: const Color.fromRGBO(247, 206, 69, 1))],
      ),
      BarChartGroupData(
        x: 3,
        barRods: [BarChartRodData(toY: 40, color: const Color.fromRGBO(247, 206, 69, 1)),],
      ),
      BarChartGroupData(
        x: 4,
        barRods: [BarChartRodData(toY: 50, color: const Color.fromRGBO(247, 206, 69, 1))],
      ),
      BarChartGroupData(
        x: 5,
        barRods: [BarChartRodData(toY: 50,  color: const Color.fromRGBO(247, 206, 69, 1))],
      ),
      BarChartGroupData(
        x: 6,
        barRods: [BarChartRodData(toY: 20, color: const Color.fromRGBO(247, 206, 69, 1))],
      ),
    ];
  }
}