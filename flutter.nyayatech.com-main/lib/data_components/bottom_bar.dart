import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:nyaya_tech/pages/login_page/Profile/profile_widget.dart';
import 'package:nyaya_tech/pages/login_page/logs/cases/cases_widget.dart';
import 'package:nyaya_tech/pages/login_page/hone_page/home_widget.dart';
import 'package:nyaya_tech/serives_screens/service_widget.dart';

class SalomonBottom extends StatefulWidget {
  const SalomonBottom({super.key});

  @override
  State<SalomonBottom> createState() => _SalomonBottomBarState();
}

class _SalomonBottomBarState extends State<SalomonBottom> {
  int index = 2;
  List<Widget> pages = [
    HomeWidget(),
    ServiceWidget(),
    CasesWidget(),
    UserProfileWidget()
  ];

  @override
  void initState() {
    super.initState();
    index = Get.arguments == null || !Get.arguments.containsKey('currentIndex')
        ? 2
        : Get.arguments['currentIndex'];
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        body: pages[index],
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(0, 3)),
            ],
          ),
          child: BottomNavigationBar(
            fixedColor: Color(0XFFFFFFFF),
            unselectedItemColor: Color(0XFF676D75),
            currentIndex: index,
            backgroundColor: Colors.black,
            type: BottomNavigationBarType.fixed,
            onTap: (i) {
              setState(() {
                if (i == 2 || i == 3) {
                  index = i;
                } else {}
              });
            },
            items: [
              BottomNavigationBarItem(
                  icon: index == 0
                      ? SvgPicture.asset('assets/images/house.svg',
                          height: 24, width: 24, color: Color(0xFFFFFFFF))
                      : SvgPicture.asset('assets/images/house.svg',
                          height: 24, width: 24, color: Color(0xFF676D75)),
                  label: "Home"),
              BottomNavigationBarItem(
                  icon: index == 1
                      ? SvgPicture.asset('assets/images/li_pie-chart.svg',
                          height: 24, width: 24, color: Color(0XFFFFFFFF))
                      : SvgPicture.asset('assets/images/li_pie-chart.svg',
                          height: 24, width: 24, color: Color(0XFF676D75)),
                  label: 'Services'),
              BottomNavigationBarItem(
                  icon: index == 2
                      ? SvgPicture.asset('assets/images/clock.svg',
                          height: 24, width: 24, color: Color(0XFFFFFFFF))
                      : SvgPicture.asset('assets/images/clock.svg',
                          height: 24, width: 24, color: Color(0XFF676D75)),
                  label: 'Cases'),
              BottomNavigationBarItem(
                  icon: index == 3
                      ? SvgPicture.asset('assets/images/profile_icon.svg',
                          height: 24, width: 24, color: Color(0XFFFFFFFF))
                      : SvgPicture.asset('assets/images/profile_icon.svg',
                          height: 24, width: 24, color: Color(0XFF676D75)),
                  label: 'Profile')
            ],
          ),
        ),
      ),
    );
  }
}
