import 'package:feness2flutter/constrains.dart';
import 'package:feness2flutter/models/days.dart';
import 'package:feness2flutter/sizeconform.dart';
import 'package:feness2flutter/widgets/heading-widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ActivityScreen extends StatelessWidget {
  final int currentDay = 4;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig.blockSizeVertical * 99,
      width: double.infinity,
      child: Column(
        children: [
          _buildateSection(),
          _builActivitySection(),
        ],
      ),
    );
  }

  Container _buildateSection() {
    return Container(
      height: SizeConfig.blockSizeVertical * 12,
      // color: Colors.red.withOpacity(0.7),
      child: ListView.builder(
          itemCount: days.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            int DayValue = int.parse(days[index].dayNumber);
            return Container(
              padding: EdgeInsets.all(6),
              margin: EdgeInsets.symmetric(horizontal: 4),
              child: Column(
                children: [
                  Expanded(flex: 1, child: Container()),
                  Text(
                    days[index].dayName,
                    style: TextStyle(
                        color: DayValue == currentDay
                            ? CustomColors.kPrimaryColor
                            : currentDay < DayValue
                                ? CustomColors.kLightColor
                                : Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                  Expanded(flex: 2, child: Container()),
                  CircleAvatar(
                      backgroundColor: DayValue == currentDay
                          ? CustomColors.kPrimaryColor
                          : Colors.transparent,
                      child: Text(
                        days[index].dayNumber,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: DayValue >= currentDay
                                ? CustomColors.kLightColor
                                : Colors.black),
                      )),
                  Expanded(flex: 1, child: Container()),
                ],
              ),
            );
          }),
    );
  }

  Widget _builActivitySection() {
    return Expanded(
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: CustomColors.kBackgroundColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          )),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                HeadingWidget(text1: "ACTIVITY", text2: "show all"),
                Center(
                  child: 
                  builCard(
                    color: CustomColors.kYellowColor,
                    iconPath: 'assets/icons/running.svg',
                    time: '6:00 AM',
                    title: 'Running',
                    subtitle: '5KM Hard Run'
                  ),
                ),
                builCard(
                    color: CustomColors.kCyanColor,
                    iconPath: 'assets/icons/bike.svg',
                    time: '10:00 AM',
                    title: 'Cycling',
                    subtitle: '5KM Cycling'
                    ),
               HeadingWidget(text1: "MEAL", text2: "show all"),
               builCard(
                  color: CustomColors.kLightPinkColor,
                  iconPath: 'assets/icons/coffee.svg',
                  time: '10:00 AM',
                  title: 'Breakfast',
                  subtitle: 'Tea and Bread'),
              builCard(
                  color: CustomColors.kPrimaryColor,
                  iconPath: 'assets/icons/food.svg',
                  time: '02:00 PM',
                  title: 'Lunch',
                  subtitle: 'Hamburger'),
              builCard(
                  color: CustomColors.kCyanColor,
                  iconPath: 'assets/icons/food.svg',
                  time: '10:00 PM',
                  title: 'Dinner',
                  subtitle: 'Chicken and Waffles'),
              builCard(
                  color: CustomColors.kCyanColor,
                  iconPath: 'assets/icons/bike.svg',
                  time: '10:00 AM',
                  title: 'Cycling',
                  subtitle: '5KM Cycling'),
              builCard(
                  color: CustomColors.kCyanColor,
                  iconPath: 'assets/icons/bike.svg',
                  time: '10:00 AM',
                  title: 'Cycling',
                  subtitle: '5KM Cycling'),
              ],
            ),
          ),
      ),
      );
  }

  Container builCard(
    {required Color color,
      required String iconPath,
      required String title,
      required String subtitle,
      required String time}
  ) {
    return Container(
                width: SizeConfig.blockSizeHorizontal*90,
                margin: EdgeInsets.symmetric(vertical: SizeConfig.blockSizeVertical*2),
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: color,
                        borderRadius: BorderRadius.circular(13),

                      ),
                      child: Padding(
                        padding: EdgeInsets.all(SizeConfig.blockSizeVertical *1.2),
                        child: SvgPicture.asset(
                          iconPath,
                          height: SizeConfig.blockSizeVertical*5,),
                      ),
                    ),
                    SizedBox(width: 15,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(title,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 25),),
                        SizedBox(height: SizeConfig.blockSizeVertical*1,),
                        Text(subtitle,style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize: 15)),
                      ],
                    ),
                    Expanded(
                      child: Container(),
                      ),
                      Text(time,style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize: 15),)
                  ],
                ),
              );
  }
}
