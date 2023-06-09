import 'package:flutter/material.dart';
import 'package:injurydoctor/Screens/SetReminderScreen.dart';
import 'package:injurydoctor/Screens/TodayScreen.dart';
import 'package:injurydoctor/Screens/WhatHurtingScreen.dart';
import 'package:injurydoctor/res/colors.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import 'HomeScreen.dart';

class MyNavBar extends StatefulWidget {
  const MyNavBar({Key? key}) : super(key: key);

  @override
  State<MyNavBar> createState() => _MyNavBarState();
}

class _MyNavBarState extends State<MyNavBar> {
  final PersistentTabController _controller =
      PersistentTabController(initialIndex: 0);

  List<Widget> _buildScreens() {
    return [
       HomeScreen(),
      SelectAlarm(),
       TodayScreen(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(Icons.home),
        activeColorPrimary: AppColors.primaryColor,
        inactiveColorPrimary: AppColors.textfieldcolor,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.alarm_rounded),
        activeColorPrimary: AppColors.primaryColor,
        inactiveColorPrimary: AppColors.textfieldcolor,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.workspace_premium_outlined),
        activeColorPrimary: AppColors.primaryColor,
        inactiveColorPrimary: AppColors.textfieldcolor,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: Colors.white,
      // Default is Colors.white.
      handleAndroidBackButtonPress: true,
      // Default is true.
      resizeToAvoidBottomInset: true,
      // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
      stateManagement: true,
      // Default is true.
      hideNavigationBarWhenKeyboardShows: true,
      // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10.0),
        colorBehindNavBar: Colors.white,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: const ItemAnimationProperties(
        // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: const ScreenTransitionAnimation(
        // Screen transition animation on change of selected tab.
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle:
          NavBarStyle.style3, // Choose the nav bar style with this property.
    );
  }
}
