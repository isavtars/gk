import 'package:flutter/material.dart';
import 'package:gk/styles/color.dart';

enum Dcolor { expenses, income, netamount }

class IncomeExpenses extends StatefulWidget {
  const IncomeExpenses({super.key});

  @override
  State<IncomeExpenses> createState() => _IncomeExpensesState();
}

class _IncomeExpensesState extends State<IncomeExpenses> {
  List<String> dropedownmenu = ["Day", "Month", "Years"];

  String dropeablevalue = "Day";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kKarobarcolor,
        title: Text(
          "Income Expenses",
          style: kJakartaHeading3.copyWith(
            fontSize: 18,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {},
            child: Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    border: Border.all(color: Colors.white)),
                child: Text(
                  "Categories",
                  style: kJakartaBodyMedium.copyWith(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                )),
          )
        ],
      ),
      backgroundColor: kKarobarcolor,
      body: SafeArea(child: LayoutBuilder(builder: (context, constraints) {
        return SingleChildScrollView(
          child: Container(
            color: kKarobarcolor,
            child: Column(children: [
              //displaycontainer
              Container(
                height: constraints.maxHeight * 0.13,
                padding: const EdgeInsets.all(20),
                margin:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ],
                    color: Colors.white,
                    borderRadius: const BorderRadius.all(Radius.circular(10))),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          prices(prices: "10,000"),
                          Text(
                            "Income",
                            style: kJakartaBodyMedium.copyWith(
                                fontSize: 15, fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          prices(prices: "10,000"),
                          Text(
                            "Expensess",
                            style: kJakartaBodyMedium.copyWith(
                                fontSize: 15, fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          prices(prices: "10,000"),
                          Text("Net amount",
                              style: kJakartaBodyMedium.copyWith(
                                  fontSize: 15, fontWeight: FontWeight.w500))
                        ],
                      )
                    ]),
              ),

              const SizedBox(
                height: 8,
              ),

              Container(
                color: Colors.white,
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //filtterRow
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          dropedowncont(constraints),
                          const Text("SelectedDate and Years ")
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),

                      Text(
                        "All Income & Expenses",
                        style: kJakartaHeading3.copyWith(
                            fontSize: 16, fontWeight: FontWeight.w400),
                      ),
                      const SizedBox(
                        height: 15,
                      ),

                      //Transtations List
                      Container(
                        width: constraints.maxWidth,
                        height: constraints.maxHeight * 0.18,
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: const Offset(0, 3),
                              ),
                            ],
                            color: Colors.white,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(5))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            //leftside
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Recharges",
                                      style: kJakartaBodyBold.copyWith(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600)),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Text("Remarks",
                                      style: kJakartaBodyBold.copyWith()),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Text("FEatchDate",
                                      style: kJakartaBodyBold.copyWith())
                                ]),
                            //RightSide

                            prices(prices: "10,000")
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),

                      AspectRatio(
                          aspectRatio: 1.1,
                          child: Image.asset("assets/images/addTrans.png"))
                    ]),
              )
            ]),
          ),
        );
      })),
    );
  }

  Container dropedowncont(BoxConstraints constraints) {
    return Container(
      width: constraints.maxWidth * 0.48,
      height: constraints.maxHeight * 0.09,
      padding: const EdgeInsets.all(10),
      decoration:
          const BoxDecoration(color: Color.fromARGB(255, 240, 238, 238)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            dropeablevalue,
            style: kJakartaHeading3.copyWith(fontSize: 15, color: kGreenColor),
          ),
          DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              onChanged: (value) {
                setState(() {
                  dropeablevalue = value!;
                });
              },
              icon: const Icon(Icons.keyboard_arrow_down),
              elevation: 0,
              style: const TextStyle(fontSize: 19, color: kGreenColor),
              items:
                  dropedownmenu.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: kJakartaHeading3.copyWith(
                        fontSize: 15, color: kGreenColor),
                  ),
                );
              }).toList(),
            ),
          )
        ],
      ),
    );
  }

  Row prices({required String prices}) {
    return Row(
      children: [
        Text(
          "Rs.",
          style: kJakartaBodyMedium.copyWith(
              color: kKarobarcolor, fontSize: 15, fontWeight: FontWeight.w500),
        ),
        Text(
          prices,
          style: kJakartaBodyMedium.copyWith(
              color: kKarobarcolor, fontSize: 15, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}
