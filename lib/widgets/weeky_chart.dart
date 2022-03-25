import 'package:feness2flutter/constrains.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class WeekeyChartWidget extends StatelessWidget {
  final List<int> weekkyData;
  final double maximunvalue;
  const WeekeyChartWidget(
      {required this.weekkyData, required this.maximunvalue});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 3,
      child: Card(
        color: Colors.white,
        elevation: 0,
        child: Container(
          child: BarChart(
            mainBarData(),
          ),
        ),
      ),
    );
  }

  BarChartGroupData makeGroupData(int x, double y) {
    return BarChartGroupData(x: x, barRods: [
      BarChartRodData(
        toY: y,
        colors: [CustomColors.kCyanColor],
        width: 15,
        backDrawRodData: BackgroundBarChartRodData(show: true, colors: [
          CustomColors.kCyanColor.withOpacity(0.2),
        ],
         toY : maximunvalue,
        ),
      )
    ]);
  }

  List<BarChartGroupData> showingroups() {
    return List.generate(weekkyData.length, (index) {
      return makeGroupData(index, weekkyData[index].toDouble());
    });
  }

  FlTitlesData _buildAxes() {
    return FlTitlesData(
      show: true, 
      leftTitles: SideTitles(
          showTitles: false,
          
          ),
      rightTitles: SideTitles(
       showTitles: false,
       ),
       topTitles: SideTitles(
       showTitles: false,
       ),

         bottomTitles: SideTitles(
           showTitles: true,
                 getTitles: (double value) {
            switch (value.toInt()) {
              case 0:
                return 'Mon';
              case 1:
                return 'Tues';
              case 2:
                return 'Wed';
              case 3:
                return 'Thur';
              case 4:
                return 'Fri';
              case 5:
                return 'Sat';
              case 6:
                return 'Sun';
              default:
                return '';
            }
          }),
    );
       
    
  }

  BarChartData mainBarData() {
    return BarChartData(
      maxY: maximunvalue,
      borderData: FlBorderData(
        show: false,
      ),
      
      groupsSpace: 30,

      titlesData: _buildAxes(),
      alignment: BarChartAlignment.center,
      barGroups: showingroups(),
    );
  }
}
