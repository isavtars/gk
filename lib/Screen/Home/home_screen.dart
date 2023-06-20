import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../../styles/color.dart';
import '../../styles/gharkharcha_themes.dart';
import '../auth/login.dart';
import '../widgets/custom_buttons.dart';
import '../widgets/custom_cards.dart';
import '../widgets/null_errors.dart';
import 'addfunds.dart';
// import 'transcard_models.dart';
import 'package:intl/intl.dart';

//homepages
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final FirebaseFirestore _firestore = FirebaseFirestore.instance;
    final FirebaseAuth _auth = FirebaseAuth.instance;
    // Transations? transations;

    //unused variable
    // final FirebaseAuth auth = FirebaseAuth.instance;

    return Scaffold(
        body: StreamBuilder(
            stream: _firestore
                .collection('usersdata')
                .doc(_auth.currentUser!.uid)
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.data != null) {
                DocumentSnapshot<Map<String, dynamic>> map = snapshot.data!;
                Map<String, dynamic>? data = map.data();

                if (data != null &&
                    data.containsKey('needAvailableBalance') &&
                    data.containsKey('expensesAvailableBalance') &&
                    data.containsKey('savings')) {
                  dynamic total = data['needAvailableBalance'] +
                      data['expensesAvailableBalance'] +
                      data['savings'];

                  return SafeArea(
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        return OrientationBuilder(
                          builder:
                              (BuildContext context, Orientation orientation) {
                            return SingleChildScrollView(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 16),
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: constraints.maxHeight * 0.03,
                                      ),
                                      Text(
                                        "GharKharcha",
                                        style: kJakartaHeading1.copyWith(
                                            color:
                                                Theme.of(context).primaryColor,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 32),
                                      ),
                                      SizedBox(
                                        height: constraints.maxHeight * 0.02,
                                      ),
                                      //blancecards
                                      Blancecard(
                                        orientation: orientation,
                                        constraints: constraints,
                                        total: total,
                                      ),
                                      SizedBox(
                                        height: constraints.maxHeight * 0.02,
                                      ),
                                      Text(
                                        'Category Balance',
                                        style: kJakartaBodyBold.copyWith(
                                            fontSize:
                                                constraints.maxWidth * 0.05,
                                            overflow: TextOverflow.ellipsis,
                                            fontWeight: FontWeight.w200),
                                      ),
                                      SizedBox(
                                        height: constraints.maxHeight * 0.02,
                                      ),

                                      //fontcard
                                      Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            CustomCard(
                                              verHeight:
                                                  constraints.maxHeight * 0.14,
                                              horiHeight:
                                                  constraints.maxHeight * 0.35,
                                              verWidth:
                                                  constraints.maxHeight * 0.2,
                                              horiWidth:
                                                  constraints.maxWidth * 0.4,
                                              orientation: orientation,
                                              cardTitle: "Need",
                                              cardBalance:
                                                  map['needAvailableBalance']
                                                      .toStringAsFixed(0),
                                            ),
                                            CustomCard(
                                              verHeight:
                                                  constraints.maxHeight * 0.14,
                                              horiHeight:
                                                  constraints.maxHeight * 0.35,
                                              verWidth:
                                                  constraints.maxHeight * 0.2,
                                              horiWidth:
                                                  constraints.maxWidth * 0.4,
                                              orientation: orientation,
                                              cardTitle: "Expenses",
                                              cardBalance:
                                                  map['expensesAvailableBalance']
                                                      .toStringAsFixed(0),
                                            )
                                          ]),
                                      SizedBox(
                                        height: constraints.maxHeight * 0.02,
                                      ),
                                      CustomCard(
                                        verHeight: constraints.maxHeight * 0.14,
                                        horiHeight:
                                            constraints.maxHeight * 0.35,
                                        verWidth: constraints.maxHeight,
                                        horiWidth: constraints.maxWidth,
                                        orientation: orientation,
                                        cardTitle: "savings",
                                        cardBalance:
                                            map['savings'].toStringAsFixed(0),
                                      ),

                                      SizedBox(
                                        height: constraints.maxHeight * 0.02,
                                      ),

                                      Text(
                                        "All Transations",
                                        style: kJakartaBodyMedium.copyWith(
                                            fontSize: 18),
                                      ),
                                      SizedBox(
                                        height: constraints.maxHeight * 0.02,
                                      ),

                                      // StreamBuilder(
                                      //     stream: _firestore
                                      //         .collection('alltransations')
                                      //         .snapshots(),
                                      //     builder: (context, snapshot) {
                                      //       if (snapshot.hasData) {
                                      //         if (snapshot.data != null) {
                                      //           QuerySnapshot<
                                      //                   Map<String, dynamic>>
                                      //               querySnapshot =
                                      //               snapshot.data!;
                                      //           List<
                                      //                   QueryDocumentSnapshot<
                                      //                       Map<String,
                                      //                           dynamic>>>
                                      //               documents =
                                      //               querySnapshot.docs;

                                      //           List<dynamic> list = documents
                                      //               .map((doc) => doc.data())
                                      //               .toList();
                                      //           list.sort((a, b) => b[
                                      //                   'paymentDateTime']
                                      //               .compareTo(
                                      //                   a['paymentDateTime']));
                                      //           SizedBox(
                                      //             height: 300,
                                      //             child: ListView.builder(
                                      //                 itemCount: list.length,
                                      //                 itemBuilder:
                                      //                     (context, index) {
                                      //                   dynamic formatDate(
                                      //                       String date) {
                                      //                     final dynamic
                                      //                         newDate =
                                      //                         DateTime.parse(
                                      //                             date);
                                      //                     final DateFormat
                                      //                         formatter =
                                      //                         DateFormat(
                                      //                             'E, d MMMM,   hh:mm a');
                                      //                     final dynamic
                                      //                         formatted =
                                      //                         formatter.format(
                                      //                             newDate);
                                      //                     return formatted;
                                      //                   }

                                      //                   return const  AmountsCards(
                                      //                     title: "eeee",
                                      //                     dateTime: "10/20/2023",
                                      //                     amount:"10,00" ,
                                      //                     count: "10",

                                      //                   );
                                      //                 }),
                                      //           );
                                      //         } else {
                                      //           const Center(
                                      //             child: Text(
                                      //                 "Trnsation has not done"),
                                      //           );
                                      //         }
                                      //       } else {
                                      //         return const Center(
                                      //             child:
                                      //                 CircularProgressIndicator(
                                      //           color: kDefaultIconLightColor,
                                      //         ));
                                      //       }

                                      //       return const Center(
                                      //           child:
                                      //               CircularProgressIndicator(
                                      //         color: kDefaultIconLightColor,
                                      //       ));
                                      //     }),

                                      // transations
                                    ]),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  );
                } else {
                  return LayoutBuilder(
                    builder:
                        (BuildContext context, BoxConstraints constraints) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const NullErrorMessage(
                              message:
                                  'Something went wrong!\n Make sure you have verified your mail',
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            TButton(
                              constraints: constraints,
                              btnColor: Theme.of(context).primaryColor,
                              btnText: 'Sign up again!',
                              onPressed: () {
                                FirebaseAuth.instance.currentUser!.delete();
                                FirebaseAuth.instance.signOut;
                                PersistentNavBarNavigator.pushNewScreen(
                                  context,
                                  screen: const LoginScreen(),
                                  withNavBar:
                                      false, // OPTIONAL VALUE. True by default.
                                );
                              },
                            ),
                          ],
                        ),
                      );
                    },
                  );
                }
              } else {
                return Center(
                    child: CircularProgressIndicator(
                  color: Theme.of(context).primaryColor,
                ));
              }
            }));
  }

  StreamBuilder<DocumentSnapshot> alltransations(
      FirebaseFirestore _firestore, FirebaseAuth _auth) {
    return StreamBuilder<DocumentSnapshot>(
        stream: _firestore
            .collection('usersdata')
            .doc(_auth.currentUser!.uid)
            .snapshots(),
        builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.hasData) {
            // Access the document data
            final snapData = snapshot.data!.data() as Map<String, dynamic>;

            if (snapData.containsKey('alltransations')) {
              // Access the child collection data
              final childrenCollection =
                  snapData['alltransations'] as List<dynamic>;

              return SizedBox(
                height: 300,
                child: ListView.builder(
                    itemCount: childrenCollection.length,
                    itemBuilder: (context, index) {
                      // Access the data of each child document
                      final childDocumentData =
                          childrenCollection[index] as Map<String, dynamic>;

                      // Access the fields within the child document
                      final amount = childDocumentData['amount'];
                      final count = childDocumentData['count'];
                      final name = childDocumentData['name'];
                      final paymentDateTime =
                          childDocumentData['paymentDateTime'];
                      return AmountsCards(
                        amount: amount,
                        count: count,
                        title: name,
                        dateTime: formatDate(paymentDateTime),
                      );
                    }),
              );
            } else {
              return const Center(child: Text('Transations are not done yet'));
            }
          } else {
            return const Center(
                child: CircularProgressIndicator(
              color: Colors.green,
            ));
          }
        });
  }
}

class Blancecard extends StatelessWidget {
  const Blancecard({
    super.key,
    required this.orientation,
    required this.constraints,
    required this.total,
  });

  final Orientation orientation;
  final BoxConstraints constraints;
  final dynamic total;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: constraints.maxWidth,
          height: orientation == Orientation.portrait
              ? constraints.maxHeight * 0.25
              : constraints.maxHeight * 0.6,
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: const BorderRadius.all(
              Radius.circular(20),
            ),
          ),
        ),
        Positioned(
          top: constraints.maxHeight * 0.05,
          left: constraints.maxWidth * 0.07,
          child: Text(
            'Total Balance',
            style: TextStyle(
                fontSize: constraints.maxWidth * 0.06,
                color: Colors.white,
                fontWeight: FontWeight.w500),
          ),
        ),
        Positioned(
          top: constraints.maxHeight * 0.1,
          left: constraints.maxWidth * 0.05,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.currency_rupee,
                size: constraints.maxWidth * 0.08,
                color: Colors.white,
              ),
              Text(
                (total).toStringAsFixed(0),
                style: TextStyle(
                    fontSize: constraints.maxWidth * 0.08,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        Positioned(
          left: 30,
          bottom: 15,
          child: Container(
            height: orientation == Orientation.portrait
                ? constraints.maxHeight * 0.05
                : constraints.maxHeight * 0.1,
            width: orientation == Orientation.portrait
                ? constraints.maxWidth * 0.34
                : constraints.maxWidth * 0.18,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(
                Radius.circular(25),
              ),
              color: GkThemsData.isDarkMode(context) == true
                  ? kDarkGreenBackC
                  : kGreenDarkC,
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: constraints.maxWidth * 0.02,
                  vertical: constraints.maxHeight * 0.01),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.account_balance,
                    color: Colors.white,
                    size: constraints.maxWidth * 0.05,
                  ),
                  Text(
                    "220222",
                    style: TextStyle(
                        fontSize: constraints.maxWidth * 0.05,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 15,
          right: 20,
          child: Text(
            'GharKharcha',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: constraints.maxWidth * 0.05,
              color: Colors.white.withOpacity(0.5),
            ),
          ),
        ),
        Positioned(
          top: 20,
          right: 20,
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const AddFundsScreen()));
            },
            child: Container(
              height: constraints.maxHeight * 0.06,
              width: constraints.maxWidth * 0.4,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(
                  Radius.circular(25),
                ),
                color: GkThemsData.isDarkMode(context) == true
                    ? kDarkGreenBackC
                    : kGreenDarkC,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.add,
                    color: Colors.white,
                    size: constraints.maxWidth * 0.05,
                  ),
                  Text(
                    'Add Funds',
                    style: TextStyle(
                        fontSize: constraints.maxWidth * 0.048,
                        fontWeight: FontWeight.w700,
                        color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class AmountsCards extends StatelessWidget {
  const AmountsCards(
      {super.key,
      required this.dateTime,
      required this.title,
      required this.amount,
      required this.count});

  final String dateTime;
  final String title;
  final String amount;
  final String count;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Theme.of(context).cardColor),
      child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Icon(Icons.currency_rupee),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: kJakartaHeading4.copyWith(),
                ),
                Text(
                  dateTime,
                  style: kJakartaHeading4.copyWith(),
                ),
              ],
            ),
            Text(
              "heloo",
              style: kJakartaBodyRegular.copyWith(),
            )
          ]),
    );
  }
}

//date formatteds
dynamic formatDate(String date) {
  final dynamic newDate = DateTime.parse(date);
  final DateFormat formatter = DateFormat('E, d MMMM,   hh:mm a');
  final dynamic formatted = formatter.format(newDate);
  return formatted;
}
