import 'package:feness2flutter/constrains.dart';
import 'package:feness2flutter/sizeconform.dart';
import 'package:feness2flutter/widgets/indicated_widget.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class ActivityChartWidget extends StatefulWidget {
  const ActivityChartWidget({Key? key}) : super(key: key);

  @override
  State<ActivityChartWidget> createState() => _ActivityChartWidgetState();
}

class _ActivityChartWidgetState extends State<ActivityChartWidget> {
  int _touchedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig.blockSizeVertical * 30 ,
      child: Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
        ),
        child: Row(
          children: [
            Container(
              width: SizeConfig.blockSizeHorizontal * 60,
              child: PieChart(
                PieChartData(
                  borderData: FlBorderData(show: false),
                  centerSpaceRadius: 50.0,
                  sectionsSpace: 0.0,
                  startDegreeOffset: 30,
                  sections: showingSections(),
                  pieTouchData: PieTouchData(
                    touchCallback: (FlTouchEvent, pieTouchResponse) {
                      setState(() {
                        if (pieTouchResponse is FlLongPressEnd) {
                          _touchedIndex = -1;
                        }
                      });
                    },
                  ),
                ),
              ),
            ),
            Expanded(child: Container(
              margin: EdgeInsets.symmetric(vertical: SizeConfig.blockSizeVertical*3),
              child: Column(
                mainAxisSize:MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IndicatedWidget(color: CustomColors.kPrimaryColor,
                   title: 'RUNNING',
                    subtitle: '10 km',
                     iconPath: 'assets/icons/running.svg'
                     ),
                     IndicatedWidget(color: CustomColors.kCyanColor,
                     title: 'CYCLING',
                      subtitle: '10 km',
                     iconPath: 'assets/icons/bike.svg'
                     ),
                      IndicatedWidget(color: CustomColors.kLightPinkColor,
                     title: 'SWIMMING',
                      subtitle: '10 km',
                     iconPath: 'assets/icons/swimmer.svg'
                     ),
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }

  List<PieChartSectionData> showingSections() {
    return List.generate(3, (index) {
      final isTouched = index == _touchedIndex;
      final double radius = isTouched ? 30 : 20;

      switch (index) {
        case 0:
          return PieChartSectionData(
            color: CustomColors.kLightPinkColor,
            value: 33.33,
            title: '',
            radius: radius,
          );
        case 1:
          return PieChartSectionData(
            color: CustomColors.kPrimaryColor,
            value: 33.33,
            title: '',
            radius: radius,
          );
        case 2:
          return PieChartSectionData(
            color: CustomColors.kCyanColor,
            value: 33.33,
            title: '',
            radius: radius,
          );
        default:
          return PieChartSectionData();
      }
    });
  }
}
