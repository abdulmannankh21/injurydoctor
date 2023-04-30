import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:injurydoctor/Screens/NavBar.dart';
import 'package:injurydoctor/Screens/Widgets/CustomButton.dart';
import 'package:injurydoctor/res/colors.dart';

class SurveScreen4 extends StatelessWidget {
  final SurveScreen4Controller controller = Get.put(SurveScreen4Controller());

  SurveScreen4({Key? key}) : super(key: key);

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
                height: ht * 0.05,
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
                'How long have you been\nexperiencing pain?',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: AppColors.textfieldcolor,
                ),
              ),
              SizedBox(
                height: ht * 0.2,
              ),
              SizedBox(
                  height: ht * 0.11,
                  width: wt * 0.9,
                  child: CustomButton(
                      title: 'Less then 1 month',
                      ontap: () => controller.setPainDuration('Less then 1 month'))),
              SizedBox(
                  height: ht * 0.11,
                  width: wt * 0.9,
                  child: CustomButton(
                      title: '1-2 months',
                      ontap: () => controller.setPainDuration('1-2 months'))),
              SizedBox(
                  height: ht * 0.11,
                  width: wt * 0.9,
                  child: CustomButton(
                      title: '2-3 months',
                      ontap: () => controller.setPainDuration('2-3 months'))),
              SizedBox(
                  height: ht * 0.11,
                  width: wt * 0.9,
                  child: CustomButton(
                      title: 'More then 3 months',
                      ontap: () => controller.setPainDuration('More then 3 months'))),
            ],
          ),
        ),
      ),
    );
  }
}
class SurveScreen4Controller extends GetxController {
  var painDuration = ''.obs;

  void setPainDuration(String value) {
    painDuration.value = value;
    Get.to(MyNavBar());
  }
}