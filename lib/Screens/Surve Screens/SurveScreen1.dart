import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:injurydoctor/Screens/SetReminderScreen.dart';
import 'package:injurydoctor/Screens/Surve%20Screens/SurveScreen2.dart';
import 'package:injurydoctor/Screens/TodayScreen.dart';
import 'package:injurydoctor/Screens/Widgets/CustomButton.dart';
import 'package:injurydoctor/res/colors.dart';
import 'package:injurydoctor/routes/route_names.dart';

class SurveScreen1Controller extends GetxController {
  RxBool isPainful = RxBool(false);

  void setPainful(bool value) {
    isPainful.value = value;
  }
}

class SurveScreen1 extends StatelessWidget {
  final controller = Get.put(SurveScreen1Controller());

  SurveScreen1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double ht = MediaQuery.of(context).size.height;
    double wt = MediaQuery.of(context).size.width;
    final arguments = Get.arguments as Map<String, dynamic>;
    final name = arguments['name'] as String;
    final image = arguments['image'] as String;
    return Scaffold(
      body: Center(
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(
                height: ht * 0.1,
              ),
              SizedBox(
                height: ht * 0.1,
                width: wt * 0.2,
                child: Image.asset(image),
              ),
              Text(
                name,
                style: TextStyle(
                  fontSize: 16,
                  color: AppColors.textfieldcolor,
                ),
              ),
              SizedBox(
                height: ht * 0.06,
              ),
               Text(
                'Does poking or pressing the tendons\nor muscles around the ' + name + ' causes\npain?',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: AppColors.textfieldcolor,
                ),
              ),
              SizedBox(
                height: ht * 0.3,
              ),
              SizedBox(
                height: ht * 0.11,
                width: wt * 0.9,
                child: CustomButton(
                  title: 'Yes',
                  ontap: () {
                    controller.setPainful(true);
                    Get.toNamed(RouteNames.servey2, arguments: arguments);
                  },
                ),
              ),
              SizedBox(
                height: ht * 0.11,
                width: wt * 0.9,
                child: CustomButton(
                  title: 'No',
                  ontap: () {
                    controller.setPainful(false);
                    Get.toNamed(RouteNames.hurting);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
