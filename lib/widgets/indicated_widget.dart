import 'package:feness2flutter/constrains.dart';
import 'package:feness2flutter/sizeconform.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class IndicatedWidget extends StatelessWidget {
  final Color color;
  final String title;
  final String subtitle;
  final String iconPath;

  IndicatedWidget({required this.color, required this.title, required this.subtitle, required this.iconPath});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(iconPath,
        height: SizeConfig.blockSizeVertical*4,
        color: color,),
        SizedBox(width:SizeConfig.blockSizeHorizontal*1),
        Column(
          children: [
            Text(
              title,
              style: TextStyle(
                color: Colors.black,fontWeight: FontWeight.bold,
              ),
            ),
             Text(
              subtitle,
              style: TextStyle(
                color: CustomColors.kLightColor,fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ],
    );
  }
}