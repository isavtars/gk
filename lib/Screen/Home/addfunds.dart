import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../styles/color.dart';
import '../widgets/custom_inputs.dart';
import '../widgets/text_btn.dart';

class AddFundsScreen extends StatefulWidget {
  const AddFundsScreen({super.key});

  @override
  State<AddFundsScreen> createState() => _AddFundsScreenState();
}

class _AddFundsScreenState extends State<AddFundsScreen> {
  final _formKey = GlobalKey<FormState>();
  final amountController = TextEditingController();
  final needController = TextEditingController();
  final expensesController = TextEditingController();
  final savingsController = TextEditingController();

  final user = FirebaseAuth.instance.currentUser!;
  @override
  void initState() {
    debugPrint('your uid id ${user.uid}');
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    amountController.dispose();
    needController.dispose();
    expensesController.dispose();
    savingsController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            return OrientationBuilder(
              builder: (BuildContext context, Orientation orientation) {
                return SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: constraints.maxHeight * 0.02),
                          Row(
                            children: [
                              IconButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                icon: const Icon(Icons.keyboard_backspace),
                              ),
                              SizedBox(
                                width: constraints.maxWidth * 0.03,
                              ),
                              const Text(
                                'Add Funds',
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    fontSize: 28, fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                          SizedBox(height: constraints.maxHeight * 0.02),
                          const Text(
                            'Enter amount',
                            style: TextStyle(fontSize: 18),
                            textAlign: TextAlign.start,
                          ),
                          SizedBox(height: constraints.maxHeight * 0.02),
                          CustomeInputs(
                              textEditingController: amountController,
                              hintText: "Amount",
                              icons: Icons.currency_rupee_outlined,
                              textinputTypes: TextInputType.number,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly
                              ]),
                          SizedBox(height: constraints.maxHeight * 0.02),
                          const Text(
                            'Enter the percentage split for Needs',
                            style: TextStyle(fontSize: 18),
                            textAlign: TextAlign.start,
                          ),
                          SizedBox(height: constraints.maxHeight * 0.02),
                          CustomeInputs(
                              textEditingController: needController,
                              hintText: "50%",
                              icons: Icons.calculate,
                              textinputTypes: TextInputType.number,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly
                              ]),
                          SizedBox(height: constraints.maxHeight * 0.02),
                          const Text(
                            'Enter the percentage split for Expenses',
                            style: TextStyle(fontSize: 18),
                            textAlign: TextAlign.start,
                          ),
                          SizedBox(height: constraints.maxHeight * 0.02),
                          CustomeInputs(
                              textEditingController: expensesController,
                              hintText: "30%",
                              icons: Icons.calculate,
                              textinputTypes: TextInputType.number,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly
                              ]),
                          SizedBox(height: constraints.maxHeight * 0.02),
                          const Text(
                            'Enter the percentage split for Savings',
                            style: TextStyle(fontSize: 18),
                            textAlign: TextAlign.start,
                          ),
                          SizedBox(height: constraints.maxHeight * 0.02),
                          CustomeInputs(
                              textEditingController: savingsController,
                              hintText: "20%",
                              icons: Icons.calculate,
                              textinputTypes: TextInputType.number,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly
                              ]),
                          SizedBox(height: constraints.maxHeight * 0.02),
                          const Text(
                            'If the split percentage for Needs, Expenses and Savings are not given it will be taken as 50%, 30% and 20% respectively.',
                            style: TextStyle(color: kGrayTextC, fontSize: 14),
                            textAlign: TextAlign.start,
                          ),
                          SizedBox(height: constraints.maxHeight * 0.04),
                          TButton(
                              constraints: constraints,
                              btnColor: Theme.of(context).primaryColor,
                              btnText: 'Add',
                              onPressed: () async {}),
                          SizedBox(
                              height: orientation == Orientation.portrait
                                  ? constraints.maxHeight * 0.04
                                  : constraints.maxHeight * 0.08),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
