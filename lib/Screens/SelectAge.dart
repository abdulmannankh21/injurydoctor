import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:injurydoctor/Screens/Surve%20Screens/SurveScreen1.dart';
import 'package:injurydoctor/Screens/Widgets/CustomButton.dart';
import 'package:injurydoctor/res/colors.dart';
import 'package:injurydoctor/routes/route_names.dart';
import 'package:injurydoctor/routes/routes.dart';

class SelectAge extends StatelessWidget {
  final AgeController ageController = Get.put(AgeController());

  @override
  Widget build(BuildContext context) {
    double ht = MediaQuery.of(context).size.height;
    double wt = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: ht * 0.1,
              ),
              const Text(
                'Age',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textfieldcolor),
              ),
              SizedBox(
                height: ht * 0.02,
              ),
              SizedBox(
                height: ht * 0.05,
                width: wt * 0.8,
                child: TextField(
                  keyboardType: TextInputType.number,
                  onChanged: (value) => ageController.age.value = int.tryParse(value) ?? 0,
                  decoration: InputDecoration(
                    hintText: 'Enter Age',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(
                        color: AppColors.textfieldcolor,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(
                        color: AppColors.textfieldcolor,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: ht * 0.60,
              ),
              SizedBox(
                  height: ht * 0.12,
                  width: wt * 0.93,
                  child: CustomButton(
                    title: 'Continue',
                    ontap: ageController.age.value != 0 ? () => Get.toNamed(RouteNames.weight) : null,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

class AgeController extends GetxController {
  var age = 0.obs; // Using an RxInt to observe changes

  void setAge(int newAge) {
    age.value = newAge; // Updating the value of age
  }
}