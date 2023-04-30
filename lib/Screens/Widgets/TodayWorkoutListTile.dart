import 'package:flutter/material.dart';

import '../../res/colors.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    super.key, required String workout,
  });

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      collapsedIconColor: AppColors.textfieldcolor,
      iconColor: AppColors.textfieldcolor,
      leading: SizedBox(
          height: MediaQuery.of(context).size.height * 0.05,
          child: Image.asset('assets/hipjointpain.jpg')),
      title: const Text(
        'Estimated Time',
        style: TextStyle(
          fontSize: 14,
        ),
      ),
      subtitle: const Text(
        '25 Minutes',
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
                      child: Image.asset('assets/ex1.jpg')),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.1,
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: const Text(
                      'We know daily exercise is good for optimizing\n health. But with so many options \nand limitless information available, it’s easy',
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
                    child: const Text(
                      'We know daily exercise is good for optimizing\n health. But with so many options \nand limitless information available, it’s easy',
                      style: TextStyle(
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
