import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:injurydoctor/Screens/Widgets/CustomButton.dart';
import 'package:injurydoctor/res/colors.dart';

class SelectHeight extends StatefulWidget {
  const SelectHeight({Key? key}) : super(key: key);

  @override
  State<SelectHeight> createState() => _SelectHeightState();
}

class _SelectHeightState extends State<SelectHeight> {
  @override
  Widget build(BuildContext context) {
    double ht = MediaQuery.of(context).size.height;
    double wt = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: ht * 0.1,
                ),
                const Text(
                  'Height',
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
                    decoration: InputDecoration(
                      hintText: 'Enter height',
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
                GestureDetector(
                  onTap: (){},
                  child: SizedBox(
                      height: ht * 0.12,
                      width: wt * 0.93,
                      child: CustomButton(
                        title: 'Continue',
                        ontap: () {
                          Get.to(const SelectHeight());
                        },
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
