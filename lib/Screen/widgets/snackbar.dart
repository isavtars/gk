import 'package:flutter/material.dart';
import 'package:get/get.dart';

showSnackBar({required String text, required Color color}) {
  Get.snackbar(
    "Error occures",
    text,
    snackPosition: SnackPosition.BOTTOM,
    backgroundColor: color,
    titleText: Center(
      child: Text(
        text,
        style: const TextStyle(
            fontWeight: FontWeight.bold, fontSize: 22, color: Colors.white),
      ),
    ),
  );
}
