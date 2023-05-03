import 'package:flutter/material.dart';

import '../../res/colors.dart';

class CustomListTile extends StatelessWidget {
   CustomListTile({
    super.key, required this.exercise, required this.img, required this.tip,required this.direction,required this.muscles
  });
  final String exercise;
  final String img;
  final String tip;
  List direction = [];
  List muscles = [];


  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      collapsedIconColor: AppColors.textfieldcolor,
      iconColor: AppColors.textfieldcolor,
      title:  Text(
        exercise,
        style: TextStyle(
          fontSize: 14,
        ),
      ),

      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  SizedBox(
                      height: MediaQuery.of(context).size.height * 0.1,
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: Image.asset(img)),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.1,
                    width: MediaQuery.of(context).size.width * 0.4,
                    child:  Text(
                      direction as String,
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.1,
                    width: MediaQuery.of(context).size.width * 0.4,
                    child:  Text(
                      tip,
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  SizedBox(
                      height: MediaQuery.of(context).size.height * 0.1,
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: Image.asset('assets/ex1.jpg')),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.1,
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: Text(
                      muscles as String ,style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
