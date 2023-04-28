import 'package:flutter/material.dart';
import 'package:injurydoctor/res/colors.dart';
import 'Widgets/CustomButton.dart';
import 'Widgets/HomeScreen Widgets/MainText.dart';
import 'Widgets/HomeScreen Widgets/ProgressBar_BackPain.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double ht = MediaQuery.of(context).size.height;
    double wt = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: ht * 0.5,
            width: wt * 1,
            color: AppColors.primaryColor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MainText(
                        name: 'Hi Alvin Chung!',
                      ),
                      SizedBox(height: ht * 0.01),
                      const Text(
                        'Designed by specialist doctors for optimal treatment and pain reduction',
                        style: TextStyle(
                          fontSize: 16,
                          color: AppColors.bgColor,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: ht * 0.12,
                  width: wt * 1,
                  color: AppColors.textfieldcolor,
                  child: CustomButton(
                    title: 'Start',
                    ontap: () {},
                  ),
                ),
              ],
            ),
          ),
          const ExpansionTile(
            collapsedIconColor: AppColors.textfieldcolor,
            iconColor: AppColors.textfieldcolor,
            title: Text(
              'Pain in your hip joint',
              style: TextStyle(
                  color: AppColors.textfieldcolor, fontWeight: FontWeight.bold),
            ),
          ),
          ProgressBar_BackPain_Container(wt: wt, ht: ht),
        ],
      ),
    );
  }
}
