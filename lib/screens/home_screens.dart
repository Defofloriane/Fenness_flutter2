import 'package:feness2flutter/constrains.dart';
import 'package:feness2flutter/screens/activity_screens.dart';
import 'package:feness2flutter/screens/dasbord_screnns.dart';
import 'package:feness2flutter/screens/metric.dart';
import 'package:feness2flutter/sizeconform.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeSreens extends StatefulWidget {
  const HomeSreens({Key? key}) : super(key: key);

  @override
  State<HomeSreens> createState() => _HomeSreensState();
}

class _HomeSreensState extends State<HomeSreens> {
  int currentIndex = 0;
  final tabs = [
   DabordScreens(),
    ActivityScreen(),
    MetricScreen(),
    Center(
      child: Text("profile"),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.menu,
            color: CustomColors.kPrimaryColor,
            size: 30,
          ),
        ),
        title: SvgPicture.asset(
          'assets/icons/dumbell.svg',
          height: SizeConfig.blockSizeHorizontal * 10,
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: Icon(
              Icons.notifications,
              color: CustomColors.kPrimaryColor,
              size: 30,
            ),
          ),
        ],
      ),
      body: tabs[currentIndex],
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        child: Icon(Icons.add),
        backgroundColor: CustomColors.kPrimaryColor,
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            currentIndex = index;
            
          });
        },
        items: [
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/icons/apps.svg',

               color: Colors.grey,
                height: 30,
              ),
              title: Container(),
              activeIcon: SvgPicture.asset(
                'assets/icons/apps.svg',
                height: 30,
                color: CustomColors.kPrimaryColor,
              )),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/icons/clock.svg',
                //color: currentIndex == 0 ? CustomColors.kPrimaryColor : Colors.grey,
               color: Colors.grey,
                height: 30,
              ),
              title: Container(),
              activeIcon: SvgPicture.asset(
                'assets/icons/clock.svg',
                height: 30,
                color: CustomColors.kPrimaryColor,
              )),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/icons/stats.svg',
                color: Colors.grey,
                height: 30,
              ),
              title: Container(),
              activeIcon: SvgPicture.asset(
                'assets/icons/stats.svg',
                height: 30,
                color: CustomColors.kPrimaryColor,
              )),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/icons/user.svg',
                color: Colors.grey,
                height: 30,
              ),
              title: Container(),
              activeIcon: SvgPicture.asset(
                'assets/icons/user.svg',
                height: 30,
                color: CustomColors.kPrimaryColor,
              )),
        ],
      ),
    );
  }
}
