import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gk/styles/color.dart';

showSnackBar(BuildContext context,
    {required String text, required Color color}) {
  Get.snackbar(
    "Error occures",
    text,
  
    snackPosition: SnackPosition.BOTTOM,
    backgroundColor: Theme.of(context).canvasColor,
    titleText: Center(
      child: Text(
        color == Colors.red ? "Error" : "Success",
        style: kJakartaHeading1.copyWith(
            fontWeight: FontWeight.bold, fontSize: 22, color: color),
      ),
    ),
  );
}
