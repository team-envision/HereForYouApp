import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:here_for_you_app/app/modules/ProfilePage/views/profile_page_view.dart';
import 'package:here_for_you_app/app/modules/home/views/home_view.dart';
import 'package:here_for_you_app/app/views/views/mind_test_view.dart';

class bottomNavigation extends StatelessWidget {
  bottomNavigation({super.key});

  final RxInt _selectedIndex = 0.obs;

  final RxList<Widget> _screens =
      [const HomeView(), const MindTestScreenView(), const ProfilePageView()].obs;
  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
        extendBody: true,
        body: _screens[_selectedIndex.value],
        bottomNavigationBar: BottomAppBar(
            shadowColor: Colors.transparent,
            color: Colors.transparent,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            shape: const CircularNotchedRectangle(),
            child: Container(
              padding: EdgeInsets.zero,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(50)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _selectedIndex.value == 0
                      ? IconButton(
                          padding: EdgeInsets.zero,
                          onPressed: () {
                            _selectedIndex.value = 0;
                          },
                          icon: Container(
                            width: 65,
                            height: 65,
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color.fromRGBO(238, 229, 255, 1)),
                            child: SvgPicture.asset(
                              "lib/assets/icons/homeIcon.svg",
                              fit: BoxFit.scaleDown,
                            ),
                          ),
                        )
                      : IconButton(
                          padding: EdgeInsets.zero,
                          onPressed: () {
                            _selectedIndex.value = 0;
                          },
                          icon: Container(
                            width: 65,
                            height: 65,
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.transparent),
                            child: SvgPicture.asset(
                              "lib/assets/icons/homeIcon.svg",
                              fit: BoxFit.scaleDown,
                            ),
                          ),
                        ),


                  _selectedIndex.value == 1
                      ? IconButton(
                          padding: EdgeInsets.zero,
                          onPressed: () {
                            _selectedIndex.value = 1;
                          },
                          icon: Container(
                            width: 65,
                            height: 65,
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color.fromRGBO(238, 229, 255, 1)),
                            child: SvgPicture.asset(
                              "lib/assets/icons/MindTestIcon.svg",
                              fit: BoxFit.scaleDown,
                            ),
                          ),
                        )
                      : IconButton(
                          padding: EdgeInsets.zero,
                          onPressed: () {
                            _selectedIndex.value = 1;
                          },
                          icon: Container(
                            width: 65,
                            height: 65,
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.transparent),
                            child: SvgPicture.asset(
                              "lib/assets/icons/MindTestIcon.svg",
                              fit: BoxFit.scaleDown,
                            ),
                          ),
                        ),


                  _selectedIndex.value == 2
                      ? IconButton(
                          padding: EdgeInsets.zero,
                          onPressed: () {
                            _selectedIndex.value = 2;
                          },
                          icon: Container(
                            width: 65,
                            height: 65,
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color.fromRGBO(238, 229, 255, 1)),
                            child: SvgPicture.asset(
                              "lib/assets/icons/profileIcon.svg",
                              fit: BoxFit.scaleDown,
                            ),
                          ),
                        )
                      : IconButton(
                          padding: EdgeInsets.zero,
                          onPressed: () {
                            _selectedIndex.value = 2;
                          },
                          icon: Container(
                            width: 65,
                            height: 65,
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.transparent),
                            child: SvgPicture.asset(
                              "lib/assets/icons/profileIcon.svg",
                              fit: BoxFit.scaleDown,
                            ),
                          ),
                        ),
                ],
              ),
            ))));
  }
}
