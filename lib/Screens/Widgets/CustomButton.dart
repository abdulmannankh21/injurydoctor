import 'package:flutter/material.dart';

import '../../res/colors.dart';

class CustomButton extends StatelessWidget {
  var icon;
  final String title;
  var ontap;
   CustomButton({
    super.key,required this.title,required this.ontap,this.icon
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
        child: Card(
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40),
          ),
          child:  Center(
              child: Row(
                children: [
                  icon,
                  Text(
                    title,
                    style:const  TextStyle(
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
