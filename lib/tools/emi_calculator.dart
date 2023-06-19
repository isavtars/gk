import 'dart:math';

import 'package:flutter/material.dart';
import 'package:gk/Screen/widgets/custom_inputs.dart';



class EMICalculator extends StatefulWidget {
  @override
  _EMICalculatorState createState() => _EMICalculatorState();
}

class _EMICalculatorState extends State<EMICalculator> {
  TextEditingController principalController = TextEditingController();
  TextEditingController interestRateController = TextEditingController();
  TextEditingController tenureController = TextEditingController();
  double emi = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('EMI Calculator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CustomeInputs(
              textEditingController: principalController,
              hintText: 'Principal Amount',
              icons: Icons.attach_money,
              validators: (value) {
                if (value.isEmpty) {
                  return 'Please enter the principal amount';
                }
                return null;
              },
              textinputTypes: TextInputType.number,
            ),
            const SizedBox(height: 16.0),
            CustomeInputs(
              textEditingController: interestRateController,
              hintText: 'Interest Rate (%)',
              icons: Icons.monetization_on,
              validators: (value) {
                if (value.isEmpty) {
                  return 'Please enter the interest rate';
                }
                return null;
              },
              textinputTypes: TextInputType.number,
            ),
            const SizedBox(height: 16.0),
            CustomeInputs(
              textEditingController: tenureController,
              hintText: 'Tenure (months)',
              icons: Icons.event,
              validators: (value) {
                if (value.isEmpty) {
                  return 'Please enter the tenure';
                }
                return null;
              },
              textinputTypes: TextInputType.number,
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: calculateEMI,
              child: const Text('Calculate EMI'),
            ),
            const SizedBox(height: 16.0),
            Text(
              'EMI: $emi',
              style: const TextStyle(fontSize: 18.0),
            ),
          ],
        ),
      ),
    );
  }

  void calculateEMI() {
    double principal = double.tryParse(principalController.text) ?? 0.0;
    double interestRate = double.tryParse(interestRateController.text) ?? 0.0;
    double tenure = double.tryParse(tenureController.text) ?? 0.0;

    double monthlyInterestRate = interestRate / 12 / 100;
    double emiNumerator = principal * monthlyInterestRate * pow(1 + monthlyInterestRate, tenure);
    double emiDenominator = pow(1 + monthlyInterestRate, tenure) - 1;

    setState(() {
      emi = emiNumerator / emiDenominator;
    });
  }
}
