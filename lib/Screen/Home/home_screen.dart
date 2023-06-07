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
                          Blancecard(
                            orientation: orientation,
                            constraints: constraints,
                          ),
                          SizedBox(
                            height: constraints.maxHeight * 0.02,
                          ),
                          Text(
                            'Category Balance',
                            style: kJakartaBodyBold.copyWith(
                                fontSize: constraints.maxWidth * 0.05,
                                overflow: TextOverflow.ellipsis,
                                fontWeight: FontWeight.w200),
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

                                  return AmountsCards(
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

class Blancecard extends StatelessWidget {
  const Blancecard({
    super.key,
    required this.orientation,
    required this.constraints,
  });

  final Orientation orientation;
  final BoxConstraints constraints;
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
                "80,1000",
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
