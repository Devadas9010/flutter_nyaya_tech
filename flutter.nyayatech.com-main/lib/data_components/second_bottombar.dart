import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:nyaya_tech/data_components/get_routing.dart';

class BottomNavigation extends StatefulWidget {
  final int activeIndex;
  const BottomNavigation({super.key, required this.activeIndex});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int index = 2;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      radius: 100,
      child: Stack(children: [
        BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          fixedColor: Color(0XFFFFFFFF),
          unselectedItemColor: Color(0XFF676D75),
          currentIndex: widget.activeIndex,
          backgroundColor: Colors.black,
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
          onTap: (index) async {
            switch (index) {
              case 0:
              case 1:
              case 2:
                if (widget.activeIndex != 2) {
                  Get.toNamed(Routes.bottombar, arguments: {'currentIndex': 2});
                }
              case 3:
                if (widget.activeIndex != 3) {
                  Get.toNamed(Routes.profile, arguments: {'currentIndex': 3});
                }
            }
          },
        )
      ]),
    );
  }
}
