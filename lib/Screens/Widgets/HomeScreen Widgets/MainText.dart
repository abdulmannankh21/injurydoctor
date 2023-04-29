import 'package:flutter/material.dart';

import '../../../res/colors.dart';

class MainText extends StatelessWidget {
  String name;
  MainText({
    super.key,required this.name
  });

  @override
  Widget build(BuildContext context) {
    return  Text(
      name,
      style:const  TextStyle(
          fontSize: 28,
          color: AppColors.bgColor,
          fontWeight: FontWeight.bold),
    );
  }
}