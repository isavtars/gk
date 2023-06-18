import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gk/logic/user_controller.dart';

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
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage(usercontroller.profilePic),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: () {
              // TODO: Navigate to HomeScreen
            },
          ),
          ListTile(
            leading: const Icon(Icons.account_balance_wallet),
            title: const Text('Wallet'),
            onTap: () {
              // TODO: Navigate to WalletScreen
            },
          ),
          ListTile(
            leading: const Icon(Icons.article),
            title: const Text('Planning'),
            onTap: () {
              // TODO: Navigate to PlanningScreen
            },
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('User Profile'),
            onTap: () {
              // TODO: Navigate to UserProfile
            },
          ),
        ],
      ),
    );
  }
}
