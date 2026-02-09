import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:here_for_you_app/common/models/results.dart';
import 'package:intl/intl.dart';

class CustomGraph extends StatelessWidget {
  final List<String> leftLabel;
  final List<DailyScore> values;
  final Color barColor;
  final int Function(DailyScore) valueMapper;

  const CustomGraph({
    super.key,
    required this.leftLabel,
    required this.values,
    required this.barColor,
    required this.valueMapper, // Require it in the constructor
  });

  @override
  Widget build(BuildContext context) {
    // Logic to get latest 7 items reversed (Oldest -> Newest)
    final List<DailyScore> displayData = values.length > 7
        ? values.take(7).toList().reversed.toList()
        : values.reversed.toList();

    return BarChart(
      BarChartData(
        alignment: BarChartAlignment.spaceAround,
        maxY: 105,
        minY: 0,
        gridData: FlGridData(
          show: true,
          drawVerticalLine: false,
          horizontalInterval: 20,
          checkToShowHorizontalLine: (value) => value <= 100,
          getDrawingHorizontalLine: (value) {
            if (value == 0) {
              return const FlLine(
                color: Colors.black,
                strokeWidth: 1,
                dashArray: null,
              );
            }
            return const FlLine(
              color: Color(0xA8000000),
              strokeWidth: 1.0,
              dashArray: [6, 6],
            );
          },
        ),
        borderData: FlBorderData(
          show: true,
          border: const Border(
            bottom: BorderSide(color: Colors.black, width: 1),
            left: BorderSide(color: Colors.transparent),
            right: BorderSide(color: Colors.transparent),
            top: BorderSide(color: Colors.transparent),
          ),
        ),
        titlesData: FlTitlesData(
          show: true,
          topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
          rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 35.w,
              interval: 20,
              getTitlesWidget: (value, meta) {
                int index = (value / 20).toInt();
                if (value == 0 || value > 100 || index >= leftLabel.length) {
                  return const SizedBox.shrink();
                }
                return Text(
                  leftLabel[index],
                  style: GoogleFonts.raleway(
                    fontWeight: FontWeight.w700,
                    fontSize: 14.1.sp,
                    letterSpacing: -0.4,
                    color: Colors.black,
                  ),
                );
              },
            ),
          ),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 30.h,
              getTitlesWidget: (value, meta) {
                final index = value.toInt();
                if (index < 0 || index >= displayData.length) {
                  return const SizedBox.shrink();
                }

                String dateStr = DateFormat('dd/MM').format(displayData[index].date);

                return SideTitleWidget(
                  axisSide: meta.axisSide,
                  space: 8.h,
                  child: Text(
                    dateStr,
                    style: GoogleFonts.raleway(
                      fontWeight: FontWeight.w700,
                      fontSize: 14.1.sp,
                      letterSpacing: -0.4,
                      color: Colors.black,
                    ),
                  ),
                );
              },
            ),
          ),
        ),
        barGroups: List.generate(
          displayData.length,
          // 👇 Use the valueMapper here instead of hardcoding .mentalScore
              (index) => _buildGroup(index, valueMapper(displayData[index])),
        ),
      ),
    );
  }

  BarChartGroupData _buildGroup(int x, int y) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: y.toDouble(),
          color: barColor,
          width: 18.w,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
            bottomLeft: Radius.zero,
            bottomRight: Radius.zero,
          ),
        ),
      ],
    );
  }
}