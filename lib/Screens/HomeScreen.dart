import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:injurydoctor/res/colors.dart';
import 'Widgets/CustomButton.dart';
import 'Widgets/HomeScreen Widgets/MainText.dart';
import 'Widgets/HomeScreen Widgets/ProgressBar_BackPain.dart';

class HomeScreen extends StatelessWidget {
  final HomeController _controller = Get.put(HomeController());

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
              ],
            ),
          ),
          SizedBox(height: ht * 0.04),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Pain in your hip joint',
                style: TextStyle(fontSize: 20,
                    color: AppColors.textfieldcolor, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(height: ht * 0.04),

          ProgressBar_BackPain_Container(wt: wt, ht: ht),
        ],
      ),
    );
  }
}


class HomeController extends GetxController {

  var selectedPainIndex = 0.obs;

  void setSelectedPainIndex(int index) {
    selectedPainIndex.value = index;
  }
}