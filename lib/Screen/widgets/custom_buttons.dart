import 'package:flutter/material.dart';
import 'package:gk/styles/sizeconfig.dart';

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

class TButton extends StatelessWidget {
  const TButton(
      {super.key,
      this.loading = false,
      required this.constraints,
      required this.btnColor,
      required this.btnText,
      required this.onPressed});

  final BoxConstraints constraints;
  final Color btnColor;
  final String btnText;
  final Function() onPressed;
  final bool loading;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: constraints.maxWidth,
      height: constraints.maxHeight * 0.072,
      decoration: BoxDecoration(
        color: btnColor,
        borderRadius: const BorderRadius.all(Radius.circular(12)),
      ),
      child: TextButton(
        onPressed: onPressed,
        child: loading
            ? const CircularProgressIndicator(
                color: Colors.white,
              )
            : Text(
                btnText,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w400),
              ),
      ),
    );
  }
}
