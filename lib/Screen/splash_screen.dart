import 'dart:async';
import 'package:get/get.dart';
import 'package:flutter/material.dart';


import '../styles/color.dart';
import 'widgets/bottom_navbar.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Simulating a delay of 2 seconds for the splash screen
    Future.delayed(const Duration(seconds: 4), () {
      // Navigate to the main screen
      Get.off(const BottomNav());
    });

    return Column(
      children: [
        Expanded(child: Image.asset("assets/images/logo.png")),
        Expanded(
          child: AnimatedBuilder(
            animation: Tween<double>(begin: 0, end: 1).animate(
              CurvedAnimation(
                parent: const AlwaysStoppedAnimation(1),
                curve: const Interval(0, 0.5, curve: Curves.easeOut),
              ),
            ),
            builder: (BuildContext context, Widget? child) {
              return Opacity(
                opacity: Tween<double>(begin: 0.0, end: 1.0).evaluate(
                  CurvedAnimation(
                    parent: const AlwaysStoppedAnimation(1),
                    curve: const Interval(0.5, 1.0, curve: Curves.easeOut),
                  ),
                ),
                child: TweenAnimationBuilder<double>(
                  tween: Tween<double>(begin: 0, end: 1),
                  duration: const Duration(seconds: 2),
                  builder: (BuildContext context, double value, Widget? child) {
                    return Transform.scale(
                      scale: value,
                      child: Container(
                        margin: const EdgeInsets.only(top: 350),
                        child: Text(
                          'GharKharcha',
                          textAlign: TextAlign.center,
                          style: kJakartaHeading3.copyWith(
                            decoration: TextDecoration.none,
                            fontSize: 50,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
