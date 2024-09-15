import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';


class CircleChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Firewall detail

    return SizedBox(
      height: 200,
      child: Stack(
        children:[ PieChart(
          PieChartData(
            sectionsSpace: 0,
            startDegreeOffset: -90,
            centerSpaceRadius: 70,
          sections: [
          PieChartSectionData(
            value: 1,
                // If  OK => green
                // If NOT=>Red
            color: Colors.greenAccent,
            showTitle: false,
            ),
        ]
        )
        ),
        Positioned.fill(
          child:
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Safe",style: Theme.of(context).textTheme.headlineSmall,),
            const Text("WAF is ON!")
          ],
        ) )
        ]
      ),
    );
  }
}
