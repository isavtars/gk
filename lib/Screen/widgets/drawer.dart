import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gk/Screen/Home/home_screen.dart';
import 'package:gk/Screen/planning/planning.dart';
import 'package:gk/Screen/userprofile/user_profile.dart';
import 'package:gk/Screen/wallet/wallet.dart';
import 'package:gk/logic/user_controller.dart';
import 'package:gk/styles/color.dart';
import 'package:gk/tools/emi_calculator.dart';

class DrawerWidget extends StatelessWidget {
  final usercontroller = Get.find<UserController>().getUsers!;
  DrawerWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text(usercontroller.fullName),
            accountEmail: Text(usercontroller.email),
            decoration: const BoxDecoration(color: kGreenColor),
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage(usercontroller.profilePic),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: () {
              Get.to(const HomeScreen());
            },
          ),
          ListTile(
            leading: const Icon(Icons.account_balance_wallet),
            title: const Text('Wallet'),
            onTap: () {
              Get.to(const WalletScreen());
            },
          ),
          ListTile(
            leading: const Icon(Icons.article),
            title: const Text('Planning'),
            onTap: () {
              Get.to(const PlanningScreeen());
            },
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('User Profile'),
            onTap: () {
              Get.to(const UserProfile());
            },
          ),
          ListTile(
            leading: const Icon(Icons.calculate),
            title: const Text('Calculate EMI'),
            onTap: () {
              Get.to(EMICalculator());
            },
          ),
        ],
      ),
    );
  }
}
