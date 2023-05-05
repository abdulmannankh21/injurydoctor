import 'package:flutter/material.dart';

import '../../res/colors.dart';

class CustomButton extends StatelessWidget {
  final String title;
  var ontap;
   CustomButton({
    super.key,required this.title,required this.ontap
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        height: 60,
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
        child: Card(
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40),
          ),
          child:  Center(
              child: Text(
                title,
                style:const  TextStyle(
                    color: AppColors.primaryColor,
                    fontWeight: FontWeight.bold),
              )),
        ),
      ),
    );
  }
}
