import 'package:feness2flutter/constrains.dart';
import 'package:feness2flutter/sizeconform.dart';
import 'package:feness2flutter/widgets/activity_chart.dart';
import 'package:feness2flutter/widgets/heading-widget.dart';
import 'package:feness2flutter/widgets/holy_chart_widget.dart';
import 'package:feness2flutter/widgets/weeky_chart.dart';
import 'package:flutter/material.dart';


class MetricScreen extends StatelessWidget {

   final List<int> weeklyData = [10, 12, 4, 16, 20, 16, 14];
  final List<int> hourlyData = [
    5,7,10,11,17,18,14,15,12,11,8,7,11,19,6,8,10,12,18,16,14,17,11,13
  ];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Container(
        height: SizeConfig.blockSizeVertical*82,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft:  Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          color: CustomColors.kBackgroundColor
        ),
        child: Column(
          children: [
            HeadingWidget(text1: "EXERCICES", text2: ''),
            ActivityChartWidget(),
            HeadingWidget(text1: "GOAL COMPILANCE", text2: ''),
            WeekeyChartWidget(weekkyData: weeklyData, maximunvalue: 25),
            HeadingWidget(text1: "EXERCICES AVG", text2: ''),
            HolyChartWidget(holyData: hourlyData, maximunvalue: 22),
          ],
        ),
      ),
    );
  }
}