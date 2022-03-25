

// This will be used to create responsive UI. Check out the link in description for medium article for more details after the video :)

import 'package:flutter/material.dart';

class SizeConfig { 

 static double  screenWidth =0;
 static double screenHeight =0;
 static double blockSizeHorizontal =0;
 static double blockSizeVertical =0;
 
 void init(BuildContext context) {
 MediaQueryData _mediaQueryData = MediaQuery.of(context);
  screenWidth = _mediaQueryData.size.width;
  screenHeight = _mediaQueryData.size.height;
  blockSizeHorizontal = screenWidth / 100;
  blockSizeVertical = screenHeight / 100;
 }
}