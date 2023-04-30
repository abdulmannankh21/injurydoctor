import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:injurydoctor/Screens/SetReminderScreen.dart';
import 'package:injurydoctor/Screens/Surve%20Screens/SurveScreen2.dart';
import 'package:injurydoctor/Screens/TodayScreen.dart';
import 'package:injurydoctor/Screens/Widgets/CustomButton.dart';
import 'package:injurydoctor/res/colors.dart';

class SurveScreen1Controller extends GetxController {
  RxBool isHipPainful = RxBool(false);

  void setHipPainful(bool value) {
    isHipPainful.value = value;
  }
}

class SurveScreen1 extends StatelessWidget {
  final controller = Get.put(SurveScreen1Controller());

   SurveScreen1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double ht = MediaQuery.of(context).size.height;
    double wt = MediaQuery.of(context).size.width;
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
                child: Image.asset('assets/ex2.jpg'),
              ),
              const Text(
                'Hip',
                style: TextStyle(
                  fontSize: 16,
                  color: AppColors.textfieldcolor,
                ),
              ),
              SizedBox(
                height: ht * 0.06,
              ),
              const Text(
                'Does poking or pressing the tendons\nor muscles around the hip causes\npain?',
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
                    controller.setHipPainful(true);
                    Get.to(TodayScreen());
                  },
                ),
              ),
              SizedBox(
                height: ht * 0.11,
                width: wt * 0.9,
                child: CustomButton(
                  title: 'No',
                  ontap: () {
                    controller.setHipPainful(false);
                    Get.to(SurveScreen2());
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
