import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:injurydoctor/Screens/Surve%20Screens/SurveScreen4.dart';
import 'package:injurydoctor/Screens/Widgets/CustomButton.dart';
import 'package:injurydoctor/res/colors.dart';

class SurveScreen3 extends StatefulWidget {
  const SurveScreen3({Key? key}) : super(key: key);

  @override
  State<SurveScreen3> createState() => _SurveScreen3State();
}

class _SurveScreen3State extends State<SurveScreen3> {
  final SurveScreen3Controller _controller = Get.put(SurveScreen3Controller());
  double _currentSliderValue = 20;

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
                'How painful is it when the pain is at\nit\'s worst?',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: AppColors.textfieldcolor,
                ),
              ),
              SizedBox(
                height: ht * 0.01,
              ),
              const Text(
                'Your answer will be starting point for tracking your pain\nand how it develops in the future.',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w300,
                  color: AppColors.textfieldcolor,
                ),
              ),
              SizedBox(
                height: ht * 0.4,
              ),
              Obx(() => Slider(
                value: _controller.painLevel.value,
                onChanged: (double value) {
                  setState(() {
                    _controller.painLevel.value = value;
                  });
                },
                divisions: 100,
                max: 100,
                label: _controller.painLevel.value.round().toString(),
                activeColor: AppColors.primaryColor,
                inactiveColor: AppColors.textfieldcolor,
              )),
              SizedBox(
                  height: ht * 0.12,
                  child: CustomButton(
                      title: 'Save',
                      ontap: () {
                        Get.to(SurveScreen4());
                      })),
            ],
          ),
        ),
      ),
    );
  }
}

class SurveScreen3Controller extends GetxController {
  var painLevel = 20.0.obs;
}
