import 'package:feness2flutter/constrains.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class HolyChartWidget extends StatelessWidget {
  final List<int> holyData;
  final double maximunvalue;
  const HolyChartWidget(
      {required this.holyData, required this.maximunvalue});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 10,
      child: Card(
        color: Colors.white,
        elevation: 0,
        child: Container(
          margin: EdgeInsets.only(top: 15),
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
        colors: [CustomColors.kLightColor],
        width: 7,
        
      )
    ]);
  }

  List<BarChartGroupData> showingroups() {
    return List.generate(holyData.length, (index) {
      return makeGroupData(index, holyData[index].toDouble());
    });
  }

  FlTitlesData _buildAxes() {
    return FlTitlesData(
      show: true,
      leftTitles: SideTitles(
          showTitles: false,),
         bottomTitles: SideTitles(
           showTitles: true,
                 getTitles: (double value) {
            switch (value.toInt()) {
              case 1:
                return '12 AM';
              case 2:
                return '6 AM ';
              case 5:
                return '12 PM';
              case 7:
                return '6 PM';
              case 8:
                return '11 PM';
              
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
      groupsSpace: 4.5,

      titlesData: _buildAxes(),
      alignment: BarChartAlignment.center,
      barGroups: showingroups(),
    );
  }
}
