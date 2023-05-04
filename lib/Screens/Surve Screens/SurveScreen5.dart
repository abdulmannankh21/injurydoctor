import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injurydoctor/Screens/Surve%20Screens/SurveScreen3.dart';
import 'package:injurydoctor/Screens/Widgets/CustomButton.dart';
import 'package:injurydoctor/res/colors.dart';

import '../../routes/route_names.dart';

class SurveScreen5 extends StatelessWidget {
  const SurveScreen5({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SurveScreen5Controller());
    final arguments = Get.arguments as Map<String, dynamic>;
    final name = arguments['name'] as String;
    final image = arguments['image'] as String;
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
                'Please proceed upon\nacknowledgement from medical\nprofessional',
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
                      title: 'Proceed',
                      ontap: () async {
                        bool value = true;
                        controller.setMedicalProfessionalDetermination(value);
                        Get.to(SurveScreen3(), arguments: arguments);
                      })),
              SizedBox(
                  height: ht * 0.11,
                  width: wt * 0.9,
                  child: CustomButton(
                      title: 'Exit',
                      ontap: () {
                        bool value = false;
                        controller.setMedicalProfessionalDetermination(value);
                        Get.toNamed(RouteNames.hurting);
                      })),
            ],
          ),
        ),
      ),
    );
  }
}

class SurveScreen5Controller extends GetxController {
  RxBool isMedicalProfessionalDetermination = RxBool(false);

  void setMedicalProfessionalDetermination(bool value) {
    isMedicalProfessionalDetermination.value = value;
  }
}
