import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:nyaya_tech/add_hearing_summary/add_hearing_summary_model.dart';
import 'package:nyaya_tech/cases/cases_widget.dart';
import 'package:nyaya_tech/pages/login_page/home_page/home_widget.dart';
import 'package:nyaya_tech/services_screens/service_widget.dart';
import 'package:nyaya_tech/user_profile/user_profile_widget.dart';

class BottomBarWidget extends StatefulWidget {
  const BottomBarWidget({super.key});

  @override
  State<BottomBarWidget> createState() => _BottomBarWidgetState();
}

class _BottomBarWidgetState extends State<BottomBarWidget> {
  int index = 0;
  List<Widget> pages = [
    const HomeWidget(),
    const ServiceWidget(),
    const CasesWidget(),
    const UserProfileWidget()
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
            fixedColor: const Color(0XFFFFFFFF),
            unselectedItemColor: const Color(0XFF676D75),
            currentIndex: index,
            backgroundColor: Colors.black,
            type: BottomNavigationBarType.fixed,
            onTap: (i) {
              setState(() {
                if (i == 0 || i == 1 || i == 2 || i == 3) {
                  index = i;
                } else {}
              });
            },
            items: [
              BottomNavigationBarItem(
                  icon: index == 0
                      ? SvgPicture.asset('assets/images/Home.svg',
                          height: 24, width: 24, color: const Color(0xFFFFFFFF))
                      : SvgPicture.asset('assets/images/Home.svg',
                          height: 24,
                          width: 24,
                          color: const Color(0xFF676D75)),
                  label: "Home"),
              BottomNavigationBarItem(
                  icon: index == 1
                      ? SvgPicture.asset('assets/images/Services.svg',
                          height: 24, width: 24, color: const Color(0XFFFFFFFF))
                      : SvgPicture.asset('assets/images/Services.svg',
                          height: 24,
                          width: 24,
                          color: const Color(0XFF676D75)),
                  label: 'Services'),
              BottomNavigationBarItem(
                  icon: index == 2
                      ? SvgPicture.asset('assets/images/Cases.svg',
                          height: 24, width: 24, color: const Color(0XFFFFFFFF))
                      : SvgPicture.asset('assets/images/Cases.svg',
                          height: 24,
                          width: 24,
                          color: const Color(0XFF676D75)),
                  label: 'Cases'),
              BottomNavigationBarItem(
                icon: index == 3
                    ? SvgPicture.asset('assets/images/Profile.svg',
                        height: 24, width: 24, color: const Color(0XFFFFFFFF))
                    : SvgPicture.asset('assets/images/Profile.svg',
                        height: 24, width: 24, color: const Color(0XFF676D75)),
                label: 'Profile',
              )
            ],
          ),
        ),
      ),
    );
  }
}
