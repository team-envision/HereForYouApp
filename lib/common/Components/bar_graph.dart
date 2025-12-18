import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomBarGrpah extends StatelessWidget {
  final List<String> leftLabel;
  final List<double> values;
  final Color barColor;

  const CustomBarGrpah({
    super.key,
    required this.leftLabel,
    required this.values,
    required this.barColor,
  });

  @override
  Widget build(BuildContext context) {
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
          topTitles: const AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          rightTitles: const AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 25.w,
              interval: 20,
              getTitlesWidget: (value, meta) {
                if (value == 0 || value > 100) {
                  return const SizedBox.shrink();
                }

                return Text(
                  leftLabel[(value / 20).toInt()],
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
                const days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
                if (value.toInt() < 0 || value.toInt() >= days.length) {
                  return const SizedBox.shrink();
                }
                return SideTitleWidget(
                  axisSide: meta.axisSide,
                  space: 8.h,
                  child: Text(
                    days[value.toInt()],
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

        barGroups: [
          _buildGroup(0, values[0]),
          _buildGroup(1, values[1]),
          _buildGroup(2, values[2]),
          _buildGroup(3, values[3]),
          _buildGroup(4, values[4]),
          _buildGroup(5, values[5]),
          _buildGroup(6, values[6]),
        ],
      ),
    );
  }

  BarChartGroupData _buildGroup(int x, double y) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: y,
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
