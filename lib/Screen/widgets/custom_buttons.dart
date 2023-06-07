import 'package:flutter/material.dart';
import 'package:gharkhracha/styles/sizeconfig.dart';

import '../../styles/color.dart';

class CustomeBtn extends StatelessWidget {
  const CustomeBtn(
      {super.key, required this.btnTitleName, required this.onPress});
  final Widget btnTitleName;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return GestureDetector(
      onTap: onPress,
      child: Container(
        height: 55,
        width: double.maxFinite,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: kGreenColor),
        child: Center(
          child: btnTitleName,
        ),
      ),
    );
  }
}
