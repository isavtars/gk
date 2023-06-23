import 'package:flutter/material.dart';

import 'package:gk/styles/color.dart';

class IncomeADD extends StatelessWidget {
  const IncomeADD({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kKarobarcolor,
      body: Stack(
        children: [
          SafeArea(child: LayoutBuilder(builder: (context, constraints) {
            return Column(
              children: [
                Text("Heloo"),
              ],
            );
          })),
        ],
      ),
    );
  }
}
