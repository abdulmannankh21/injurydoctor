import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:injurydoctor/Screens/SelectHeight.dart';
import 'package:injurydoctor/Screens/Widgets/CustomButton.dart';
import 'package:injurydoctor/res/colors.dart';

class GenderScreen extends StatelessWidget {
  const GenderScreen({Key? key}) : super(key: key);

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
                height: ht * 0.15,
              ),
              const Text(
                'Gender',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textfieldcolor,
                ),
              ),
              SizedBox(
                height: ht * 0.09,
                width: wt * 0.8,
                child: Custombtn(
                  title: 'Male',
                  ontap: () {
                    Get.to(const SelectHeight());
                  },
                  icon: const Icon(
                    Icons.male,
                    color: AppColors.textfieldcolor,
                  ),
                ),
              ),
              SizedBox(
                height: ht * 0.09,
                width: wt * 0.8,
                child: Custombtn(
                  title: 'Female',
                  ontap: () {
                    Get.to(const SelectHeight());
                  },
                  icon: const Icon(
                    Icons.female,
                    color: AppColors.textfieldcolor,
                  ),
                ),
              ),
              SizedBox(
                height: ht * 0.09,
                width: wt * 0.8,
                child: Custombtn(
                  title: 'Other',
                  ontap: () {
                    Get.to(const SelectHeight());
                  },
                  icon: const Icon(
                    Icons.transgender,
                    color: AppColors.textfieldcolor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Custombtn extends StatelessWidget {
  final String title;
  var ontap;
  var icon;

  Custombtn({super.key, required this.title, this.icon, this.ontap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Card(
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40),
          ),
          child: Center(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              icon,
              Text(
                title,
                style: const TextStyle(
                    color: AppColors.primaryColor, fontWeight: FontWeight.bold),
              ),
            ],
          )),
        ),
      ),
    );
  }
}
