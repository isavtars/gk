import 'package:flutter/material.dart';

import 'package:gharkhracha/styles/color.dart';
import 'package:gharkhracha/styles/gharkharcha_themes.dart';

import '../widgets/custom_cards.dart';
import 'addfunds.dart';
import 'transcard_models.dart';
import 'package:intl/intl.dart';

//homepages
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return OrientationBuilder(
              builder: (BuildContext context, Orientation orientation) {
                return SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: constraints.maxHeight * 0.03,
                          ),
                          Text(
                            appsname,
                            style: kJakartaHeading1.copyWith(
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.w600,
                                fontSize: 32),
                          ),
                          SizedBox(
                            height: constraints.maxHeight * 0.02,
                          ),
                          //blancecards
                          Stack(
                            children: [
                              Container(
                                height: orientation == Orientation.portrait
                                    ? constraints.maxHeight * 0.3
                                    : constraints.maxHeight * 0.6,
                                decoration: BoxDecoration(
                                    color: Theme.of(context).primaryColor,
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(20))),
                              ),
                              Positioned(
                                  left: 30,
                                  top: 40,
                                  child: Text(
                                    'Total Balance',
                                    style: kJakartaBodyMedium.copyWith(
                                        fontWeight: FontWeight.w500,
                                        fontSize: constraints.maxHeight * 0.035,
                                        color: Colors.white),
                                  )),
                              Positioned(
                                  left: 20,
                                  top: 75,
                                  child: Icon(
                                    Icons.currency_rupee,
                                    color: Colors.white,
                                    size: constraints.maxHeight * 0.055,
                                  )),
                              Positioned(
                                  left: 60,
                                  top: 70,
                                  child: SizedBox(
                                    height: 60,
                                    child: Text(
                                      'Rs 90,000',
                                      style: kJakartaBodyMedium.copyWith(
                                          fontWeight: FontWeight.w500,
                                          fontSize:
                                              constraints.maxHeight * 0.05,
                                          color: Colors.white),
                                    ),
                                  )),
                              Positioned(
                                  bottom: 15,
                                  left: 30,
                                  child: Container(
                                    height: orientation == Orientation.portrait
                                        ? constraints.maxHeight * 0.05
                                        : constraints.maxHeight * 0.1,
                                    width: orientation == Orientation.portrait
                                        ? constraints.maxWidth * 0.34
                                        : constraints.maxWidth * 0.4,
                                    decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(25),
                                      ),
                                      color: GkThemsData.isDarkMode(context) ==
                                              true
                                          ? kDarkGreenBackC
                                          : kGreenDarkC,
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 4, horizontal: 8),
                                      child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            const Icon(
                                              Icons.account_balance,
                                              size: 19,
                                              color: Colors.white,
                                            ),
                                            Text(
                                              "2120001452",
                                              style: kJakartaBodyBold.copyWith(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 13),
                                            )
                                          ]),
                                    ),
                                  )),
                              Positioned(
                                bottom: 15,
                                right: 20,
                                child: Text(
                                  appsname,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: Colors.white.withOpacity(0.5),
                                  ),
                                ),
                              ),
                              Positioned(
                                  right: 22,
                                  top: 20,
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const AddFundsScreen()));
                                    },
                                    child: Container(
                                      height:
                                          orientation == Orientation.portrait
                                              ? constraints.maxHeight * 0.07
                                              : constraints.maxHeight * 0.2,
                                      width: orientation == Orientation.portrait
                                          ? constraints.maxWidth * 0.36
                                          : constraints.maxWidth * 0.2,
                                      decoration: BoxDecoration(
                                        color:
                                            GkThemsData.isDarkMode(context) ==
                                                    true
                                                ? kDarkGreenBackC
                                                : kGreenDarkC,
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(25),
                                        ),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          children: [
                                            const Expanded(
                                              child: Icon(
                                                Icons.add,
                                                color: Colors.white,
                                                size: 20,
                                              ),
                                            ),
                                            Text(
                                              "Add  funds",
                                              style:
                                                  kJakartaBodyRegular.copyWith(
                                                      color: Colors.white,
                                                      fontSize: 13),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ))
                            ],
                          ),
                          SizedBox(
                            height: constraints.maxHeight * 0.02,
                          ),
                          Text(
                            'Category Balance',
                            style: kJakartaBodyBold.copyWith(
                                fontSize: 23, fontWeight: FontWeight.w200),
                          ),
                          SizedBox(
                            height: constraints.maxHeight * 0.02,
                          ),

                          //fontcard
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomCard(
                                  verHeight: constraints.maxHeight * 0.14,
                                  horiHeight: constraints.maxHeight * 0.35,
                                  verWidth: constraints.maxHeight * 0.2,
                                  horiWidth: constraints.maxWidth * 0.4,
                                  orientation: orientation,
                                  cardTitle: "Need",
                                  cardBalance: "100,00",
                                ),
                                CustomCard(
                                  verHeight: constraints.maxHeight * 0.14,
                                  horiHeight: constraints.maxHeight * 0.35,
                                  verWidth: constraints.maxHeight * 0.2,
                                  horiWidth: constraints.maxWidth * 0.4,
                                  orientation: orientation,
                                  cardTitle: "Expenses",
                                  cardBalance: "20,000",
                                )
                              ]),
                          SizedBox(
                            height: constraints.maxHeight * 0.02,
                          ),
                          CustomCard(
                            verHeight: constraints.maxHeight * 0.14,
                            horiHeight: constraints.maxHeight * 0.35,
                            verWidth: constraints.maxHeight,
                            horiWidth: constraints.maxWidth,
                            orientation: orientation,
                            cardTitle: "Saving",
                            cardBalance: "80,000",
                          ),

                          SizedBox(
                            height: constraints.maxHeight * 0.02,
                          ),

                          Text(
                            "All Transations",
                            style: kJakartaBodyMedium.copyWith(fontSize: 18),
                          ),
                          SizedBox(
                            height: constraints.maxHeight * 0.02,
                          ),

                          SizedBox(
                            height: 300,
                            child: ListView.builder(
                                itemCount: TransCard.transCard.length,
                                itemBuilder: (context, index) {
                                  dynamic formatDate(String date) {
                                    final dynamic newDate =
                                        DateTime.parse(date);
                                    final DateFormat formatter =
                                        DateFormat('E, d MMMM,   hh:mm a');
                                    final dynamic formatted =
                                        formatter.format(newDate);
                                    return formatted;
                                  }

                                  return ProductsCards(
                                    transCard: TransCard.transCard[index],
                                    dateTime: formatDate(
                                        TransCard.transCard[index].dateTime),
                                  );
                                }),
                          )
                        ]),
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

class ProductsCards extends StatelessWidget {
  const ProductsCards(
      {super.key, required this.transCard, required this.dateTime});

  final TransCard transCard;
  final String dateTime;

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
                  transCard.titleName,
                  style: kJakartaHeading4.copyWith(),
                ),
                Text(
                  dateTime,
                  style: kJakartaHeading4.copyWith(),
                ),
              ],
            ),
            Text(
              transCard.amounts,
              style: kJakartaBodyRegular.copyWith(),
            )
          ]),
    );
  }
}
