

import 'package:feness2flutter/constrains.dart';
import 'package:feness2flutter/sizeconform.dart';
import 'package:feness2flutter/widgets/heading-widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DabordScreens extends StatelessWidget {
  const DabordScreens({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return Container(
      height: SizeConfig.blockSizeVertical * 99,
      child: Column(
        children: [
          _buildDaysBar(),
          _builDasboardCards(),
        ],
      ),
    );
  }

  Container _buildDaysBar() {
    return Container(
      margin: EdgeInsets.only(
          top: SizeConfig.blockSizeVertical * 2,
          bottom: SizeConfig.blockSizeVertical * 2),
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            "Today",
            style: CustomTextStyle.dayTabBarStyleActive,
          ),
          Text(
            "Week",
            style: CustomTextStyle.dayTabBarStyleInactive,
          ),
          Text(
            "Month",
            style: CustomTextStyle.dayTabBarStyleInactive,
          ),
          Text(
            "Year",
            style: CustomTextStyle.dayTabBarStyleInactive,
          ),
        ],
      ),
    );
  }

  Widget _builDasboardCards() {
    return Expanded(
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          width: double.infinity,
          
          decoration: BoxDecoration(
              color: CustomColors.kBackgroundColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              )),
          child: Column(
            children: [
              HeadingWidget(text1: 'ACTIVITY', text2: 'show all'),
              buildCard(
                  color1: CustomColors.kLightPinkColor,
                  color2: CustomColors.kCyanColor,
                  color3: CustomColors.kYellowColor,
                  color4: CustomColors.kPurpleColor,
                  value: 0.6,
                  iconPath: 'assets/icons/running.svg',
                  metricType: 'Running',
                  metricCount1: '2500',
                  metricCount2: '4000'),
              buildCard(
                  color1: CustomColors.kCyanColor,
                  color2: CustomColors.kYellowColor,
                  color3: CustomColors.kPurpleColor,
                  color4: CustomColors.kLightPinkColor,
                  value: 0.8,
                  iconPath: 'assets/icons/footprints.svg',
                  metricType: 'Steps',
                  metricCount1: '3500',
                  metricCount2: '860')
            ],
          ),
        ),
      ),
    );
  }
}

Container buildCard(
    {required Color color1,
    required Color color2,
    required Color color3,
    required Color color4,
    required String metricType,
    required String metricCount1,
    required String metricCount2,
    required double value,
    required String iconPath}) {
  return Container(
    height: SizeConfig.blockSizeVertical * 30,
    width: SizeConfig.blockSizeHorizontal * 90,
    margin: EdgeInsets.symmetric(vertical: SizeConfig.blockSizeVertical * 1),
    decoration: BoxDecoration(
      color: CustomColors.kPrimaryColor,
      borderRadius: BorderRadius.circular(20),
    ),
    child: Stack(
      children: [
        Align(
          alignment: Alignment.topRight,
          child: Container(
            height: SizeConfig.blockSizeVertical * 12,
            width: SizeConfig.blockSizeHorizontal * 23,
            decoration: BoxDecoration(
                color: color1,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(130),
                    topRight: Radius.circular(20))),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            margin: EdgeInsets.only(bottom: 20),
            child: CircleAvatar(
              backgroundColor: color2,
              radius: SizeConfig.blockSizeVertical * 5,
            ),
          ),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Container(
            height: SizeConfig.blockSizeVertical * 10,
            width: SizeConfig.blockSizeHorizontal * 10,
            decoration: BoxDecoration(
                color: color3,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(SizeConfig.blockSizeVertical * 5),
                  bottomRight:
                      Radius.circular(SizeConfig.blockSizeVertical * 5),
                )),
          ),
        ),
        Positioned(
            top: SizeConfig.blockSizeVertical * 10,
            left: SizeConfig.blockSizeHorizontal * 16,
            child: CircleAvatar(
              backgroundColor: color4,
              radius: SizeConfig.blockSizeHorizontal * 3,
            )),
        Positioned(
            bottom: SizeConfig.blockSizeVertical * 5,
            right: SizeConfig.blockSizeHorizontal * 10,
            child: CircleAvatar(
              backgroundColor: CustomColors.kPurpleColor,
              radius: SizeConfig.blockSizeHorizontal * 4,
            )),
        Positioned(
            top: SizeConfig.blockSizeVertical * 3,
            left: SizeConfig.blockSizeHorizontal * 6,
            child: Container(
              child: Row(
                children: [
                  SvgPicture.asset(
                    iconPath,
                    height: SizeConfig.blockSizeVertical * 5,
                  ),
                  SizedBox(
                    width: SizeConfig.blockSizeVertical * 1,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        metricType,
                        style: TextStyle(color: CustomColors.kLightColor),
                      ),
                      Text(metricCount1,
                          style: CustomTextStyle.metricTextStyle),
                    ],
                  ),
                ],
              ),
            )),
        Positioned(
            bottom: SizeConfig.blockSizeVertical * 5,
            left: SizeConfig.blockSizeHorizontal * 6,
            child: Container(
              child: Row(
                children: [
                  Text(metricCount2, style: CustomTextStyle.metricTextStyle),
                  Text(' m', style: TextStyle(color: CustomColors.kLightColor)),
                ],
              ),
            )),
        Align(
          alignment: Alignment.center,
          child: Container(
            height: SizeConfig.blockSizeVertical * 1,
            width: SizeConfig.blockSizeHorizontal * 75,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: LinearProgressIndicator(
                value: value,
                valueColor: AlwaysStoppedAnimation(Colors.white),
                backgroundColor: CustomColors.kLightColor.withOpacity(0.2),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
