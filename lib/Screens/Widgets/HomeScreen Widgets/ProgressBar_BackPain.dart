import 'package:flutter/material.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';
import '../../../res/colors.dart';

class ProgressBar_BackPain_Container extends StatelessWidget {
  const ProgressBar_BackPain_Container({
    super.key,
    required this.wt,
    required this.ht,
  });

  final double wt;
  final double ht;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: wt * 0.9,
      height: ht * 0.25,
      color: AppColors.bgColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            leading: Image.asset('assets/hipjointpain.jpg'),
            title: const Text(
              'Back Pain',
              style: TextStyle(
                  color: AppColors.textfieldcolor, fontSize: 12),
            ),
            subtitle: const Text(
              'Mobility',
              style: TextStyle(
                  color: AppColors.textfieldcolor,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child:  Text(
              'PROGRESS',
              style: TextStyle(
                  color: AppColors.textfieldcolor,
                  fontSize: 12,
                  fontWeight: FontWeight.w400),
            ),
          ),
          SizedBox(
            height: ht * 0.01,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: FAProgressBar(
              size: 15,
              progressColor: AppColors.textfieldcolor,
              currentValue: 100,
              displayText: '%',
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 110, vertical: 20),
            child: Text(
              'Learn more about phase 1',
              style: TextStyle(
                  color: AppColors.textfieldcolor,
                  fontSize: 12,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}


