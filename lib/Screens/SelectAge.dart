import 'package:flutter/material.dart';
import 'package:injurydoctor/Screens/Widgets/CustomButton.dart';
import 'package:injurydoctor/res/colors.dart';

class SelectAge extends StatelessWidget {
  const SelectAge({Key? key}) : super(key: key);

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
                    ontap: () {},
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
