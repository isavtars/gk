import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';

import '../../styles/color.dart';
import '../widgets/custom_buttons.dart';
import '../widgets/null_errors.dart';

class PlanningScreeen extends StatefulWidget {
  const PlanningScreeen({super.key});

  @override
  State<PlanningScreeen> createState() => _PlanningScreeenState();
}

class _PlanningScreeenState extends State<PlanningScreeen> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  bool isAutoPayOn = false;
  bool isCPenabled = false;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: _firestore
            .collection('usersdata')
            .doc(_auth.currentUser!.uid)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data != null) {
              DocumentSnapshot<Map<String, dynamic>> map = snapshot.data!;

              bool isEFenabled = map['isEFenabled'];
              bool isCPenabled = map['isCPenabled'];
              // dynamic targetEmergencyFunds = map['targetEmergencyFunds'];
              // dynamic collectedEmergencyFunds = map['collectedEmergencyFunds'];
              // dynamic targetCarFunds = map['targetCarFunds'];
              // dynamic collectedCarFunds = map['collectedCarFunds'];

              return Scaffold(
                body: SafeArea(
                  child: LayoutBuilder(
                    builder:
                        (BuildContext context, BoxConstraints constraints) {
                      return OrientationBuilder(
                        builder:
                            (BuildContext context, Orientation orientation) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  SizedBox(
                                    height: constraints.maxHeight * 0.03,
                                  ),
                                  const Text(
                                    'Planning ',
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                        fontSize: 28,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  SizedBox(
                                    height: constraints.maxHeight * 0.02,
                                  ),
                                  const Text(
                                    'Default plans',
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  SizedBox(
                                    height: constraints.maxHeight * 0.02,
                                  ),
                                  isEFenabled == false
                                      ? Container(
                                          height: orientation ==
                                                  Orientation.portrait
                                              ? constraints.maxHeight * 0.08
                                              : constraints.maxHeight * 0.2,
                                          width: double.maxFinite,
                                          decoration: BoxDecoration(
                                              color: Theme.of(context)
                                                  .primaryColor,
                                              borderRadius:
                                                  const BorderRadius.all(
                                                      Radius.circular(12))),
                                          child: TextButton(
                                              onPressed: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            const EmergencyPlanningScreen()));
                                              },
                                              child: const Text(
                                                'Emergency Funds',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              )),
                                        )
                                      : planningCard(
                                          map,
                                          "Emergency Funds",
                                          map['targetEmergencyFunds']
                                              .toStringAsFixed(0),
                                          map['collectedEmergencyFunds']
                                              .toStringAsFixed(0),
                                          10, 00,

                                          // map['targetEmergencyFunds']
                                          //     .toStringAsFixed(0),
                                          // map['collectedEmergencyFunds']
                                          //     .toStringAsFixed(0),
                                        ),
                                  SizedBox(
                                    height: constraints.maxHeight * 0.02,
                                  ),
                                  isCPenabled == false
                                      ? Container(
                                          height: orientation ==
                                                  Orientation.portrait
                                              ? constraints.maxHeight * 0.08
                                              : constraints.maxHeight * 0.2,
                                          width: double.maxFinite,
                                          decoration: BoxDecoration(
                                              color: Theme.of(context)
                                                  .primaryColor,
                                              borderRadius:
                                                  const BorderRadius.all(
                                                      Radius.circular(12))),
                                          child: TextButton(
                                              onPressed: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            const CarPlanningScreen()));
                                              },
                                              child: const Text(
                                                'Car Plan',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              )),
                                        )
                                      : planningCard(
                                          map as Map<String, dynamic>,
                                          "Emergency Funds",
                                          map['targetEmergencyFunds']
                                              .toStringAsFixed(0),
                                          map['collectedEmergencyFunds']
                                              .toStringAsFixed(0),
                                          map['targetEmergencyFunds']
                                              .toStringAsFixed(0),
                                          map['collectedEmergencyFunds']
                                              .toStringAsFixed(0),
                                        ),
                                  SizedBox(
                                    height: constraints.maxHeight * 0.03,
                                  ),
                                  const Text(
                                    'Add plans',
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  SizedBox(
                                    height: constraints.maxHeight * 0.02,
                                  ),
                                  TButton(
                                      constraints: constraints,
                                      btnColor: Theme.of(context).primaryColor,
                                      btnText: '+ Add new plan',
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const AddNewPlanScreen()));
                                      }),
                                  SizedBox(
                                    height: orientation == Orientation.portrait
                                        ? constraints.maxHeight * 0.06
                                        : constraints.maxHeight * 0.1,
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              );
            } else {
              return const NullErrorMessage(
                message: 'Something went wrong!',
              );
            }
          } else {
            return const Center(
              child: CircularProgressIndicator(
                color: kGreenColor,
              ),
            );
          }
        });
  }

  Stack planningCard(dynamic map, textName, targetFunds, collectedFunds,
      comparetargetFunds, comparecollectedFunds) {
    return Stack(children: [
      Container(
        height: 320,
        decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: const BorderRadius.all(Radius.circular(20))),
      ),
      Positioned(
        left: 35,
        top: 25,
        child: Text(
          textName,
          style: const TextStyle(
              fontSize: 30, color: Colors.white, fontWeight: FontWeight.w500),
        ),
      ),
      const Positioned(
        left: 35,
        top: 80,
        child: Text(
          'Target Amount',
          style: TextStyle(
              fontSize: 22, color: Colors.white, fontWeight: FontWeight.w400),
        ),
      ),
      const Positioned(
        left: 25,
        top: 115,
        child: Icon(
          Icons.currency_rupee,
          color: Colors.white,
          size: 55,
        ),
      ),
      Positioned(
        left: 85,
        top: 105,
        child: Text(
          targetFunds,
          style: const TextStyle(
              fontSize: 56, color: Colors.white, fontWeight: FontWeight.w600),
        ),
      ),
      Positioned(
        right: 20,
        bottom: 15,
        child: Text(
          'Gharkharch',
          style: TextStyle(
              fontSize: 22,
              color: Colors.white.withOpacity(0.4),
              fontWeight: FontWeight.bold),
        ),
      ),
      const Positioned(
        left: 35,
        bottom: 110,
        child: Text(
          'Colllected Funds',
          style: TextStyle(
              fontSize: 22, color: Colors.white, fontWeight: FontWeight.w400),
        ),
      ),
      const Positioned(
        left: 25,
        bottom: 50,
        child: Icon(
          Icons.currency_rupee,
          color: Colors.white,
          size: 55,
        ),
      ),
      Positioned(
        left: 85,
        bottom: 45,
        child: Text(
          collectedFunds,
          style: const TextStyle(
              fontSize: 56, color: Colors.white, fontWeight: FontWeight.w600),
        ),
      ),
      // if (comparetargetFunds <= comparecollectedFunds)
      const Positioned(
        top: 30,
        right: 25,
        child: Icon(
          Icons.check_circle,
          size: 90,
          color: Colors.white,
        ),
      ),
    ]);
  }
}

class AddNewPlanScreen extends StatelessWidget {
  const AddNewPlanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class CarPlanningScreen extends StatelessWidget {
  const CarPlanningScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class EmergencyPlanningScreen extends StatelessWidget {
  const EmergencyPlanningScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
