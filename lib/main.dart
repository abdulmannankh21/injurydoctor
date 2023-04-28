import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:injurydoctor/Screens/HomeScreen.dart';
import 'package:injurydoctor/Screens/SetReminderScreen.dart';
import 'package:injurydoctor/Screens/TodayScreen.dart';
import 'package:injurydoctor/routes/route_names.dart';
import 'package:injurydoctor/routes/routes.dart';

import 'Screens/WhatHurtingScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: WhatsHurting(),
      // initialRoute: RouteNames.splash,
      // getPages: AppRoutes.getPage,
    );
  }
}
