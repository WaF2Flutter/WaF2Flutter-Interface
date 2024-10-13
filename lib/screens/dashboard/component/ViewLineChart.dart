import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import '../../../utills/colorconfig.dart';

class ViewLineChart extends StatefulWidget {
  const ViewLineChart({Key? key}) : super(key: key);

  @override
  _ViewLineChartState createState() => _ViewLineChartState();
}

class _ViewLineChartState extends State<ViewLineChart> {
  List<Color> gradientColors = [
    primaryColor,
    secondryColor,
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16), 
      child: LineChart(
        LineChartData(
          gridData: FlGridData(show: false),
          titlesData: FlTitlesData(
            show: true,
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 22,
                getTitlesWidget: (value, meta) {
                  switch (value.toInt()) {
                    case 0:
                      return Text('Sun', style: TextStyle(color: Colors.white));
                    case 4:
                      return Text('Mon', style: TextStyle(color: Colors.white));
                    case 7:
                      return Text('Tue', style: TextStyle(color: Colors.white));
                    case 10:
                      return Text('Wed', style: TextStyle(color: Colors.white));
                    case 13:
                      return Text('Thu', style: TextStyle(color: Colors.white));
                    case 16:
                      return Text('Fri', style: TextStyle(color: Colors.white));
                    case 19:
                      return Text('Sat', style: TextStyle(color: Colors.white));
                  }
                  return Container();
                },
              ),
            ),
            leftTitles: AxisTitles( 
              sideTitles: SideTitles(showTitles: false),
            ),
          ),
          borderData: FlBorderData(show: false),
          minX: 0,
          maxX: 20,
          minY: 0,
          maxY: 6,
          lineBarsData: [
            LineChartBarData(
              spots: [
                FlSpot(0, 3),
                FlSpot(4, 2),
                FlSpot(9, 4),
                FlSpot(12, 3),
                FlSpot(15, 5),
                FlSpot(18, 3),
                FlSpot(20, 4),
              ],
              isCurved: true,
              color: primaryColor,
              barWidth: 5,
              isStrokeCapRound: true,
              dotData: FlDotData(show: false),
              belowBarData: BarAreaData(
                show: true,
                gradient: LinearGradient(
                  colors: gradientColors.map((e) => e.withOpacity(0.3)).toList(),
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
