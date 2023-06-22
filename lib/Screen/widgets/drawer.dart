import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gk/Screen/Bugets/buget_home_screen.dart';
import 'package:gk/Screen/auth/login.dart';
import 'package:gk/Screen/planning/planning.dart';
import 'package:gk/Screen/userprofile/user_profile.dart';
import 'package:gk/Screen/wallet/wallet.dart';
import 'package:gk/logic/user_controller.dart';
import 'package:gk/styles/color.dart';
import 'package:gk/tools/emi_calculator.dart';

import '../../model/drawer_entry.dart';
import '../../tools/inc/exp/incomeexp.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  // final usercontroller = Get.find<UserController>().getUsers!;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              const UserAccountsDrawerHeader(
                accountName: Text(
                  'usercontroller.fullName',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                accountEmail: Text(
                  'usercontroller.email',
                  style: TextStyle(color: Colors.white),
                ),
                decoration: BoxDecoration(color: kKarobarcolor),
                currentAccountPicture: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    backgroundColor: kKarobarcolor,
                    // backgroundImage: NetworkImage('usercontroller.profilePic'),
                  ),
                ),
              ),
              ListTile(
                leading: const Icon(
                  Icons.business,
                  color: kGreenColor,
                ),
                title: const Text('Your Status'),
                onTap: () {},
              ),
              const SizedBox(
                height: 5,
              ),
              const TitleWithDrawer(
                title: "MANAGEMENT",
              ),
              ListTile(
                leading: const Icon(
                  Icons.home,
                  color: kGreenColor,
                ),
                title: const Text('Home'),
                onTap: () {
                  Get.to(const HomeScreen());
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.account_balance_wallet,
                  color: kGreenColor,
                ),
                title: const Text('Wallet'),
                onTap: () {
                  Get.to(const WalletScreen());
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.article,
                  color: kKarobarcolor,
                ),
                title: const Text('Planning'),
                onTap: () {
                  Get.to(const PlanningScreeen());
                },
              ),

              //calculatedemi
              ListTile(
                leading: const Icon(
                  Icons.calculate,
                  color: kKarobarcolor,
                ),
                title: const Text('Calculate EMI'),
                onTap: () {
                  Get.to(const EMICalculator());
                },
              ),

              //cash at bank
              ListTile(
                leading: const Icon(
                  Icons.wallet,
                  color: kKarobarcolor,
                ),
                title: EntryItem(dataforcash.first),
              ),

              //incomeexp
              ListTile(
                leading: const Icon(
                  Icons.wallet,
                  color: kGreenColor,
                ),
                title: const Text('Income/Expenses'),
                onTap: () {},
              ),
              const SizedBox(
                height: 5,
              ),

              const TitleWithDrawer(
                title: "HELP & SUPPORT",
              ),
              ListTile(
                leading: const Icon(
                  Icons.announcement,
                  color: kGreenColor,
                ),
                title: const Text('Notices'),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(
                  Icons.contact_emergency,
                  color: kGreenColor,
                ),
                title: const Text('Contact us'),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(
                  Icons.help,
                  color: kGreenColor,
                ),
                title: const Text('Learn to use'),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(
                  Icons.star,
                  color: kGreenColor,
                ),
                title: const Text('Rate this app'),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(
                  Icons.share,
                  color: kGreenColor,
                ),
                title: const Text('Share this app'),
                onTap: () {},
              ),
              const SizedBox(
                height: 5,
              ),
              const TitleWithDrawer(
                title: "SYSTEM",
              ),
              //logout

              //profile
              ListTile(
                leading: const Icon(
                  Icons.person,
                  color: kGreenColor,
                ),
                title: const Text('Profile'),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(
                  Icons.logout,
                  color: Colors.red,
                ),
                title: const Text(
                  'LOGOUT',
                  style: TextStyle(color: Colors.red),
                ),
                onTap: () {
                  _showLogoutConfirmationDialog(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TitleWithDrawer extends StatelessWidget {
  const TitleWithDrawer({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 13.0),
            child: Text(
              title,
              style: kJakartaBodyBold.copyWith(
                  fontSize: 16, fontWeight: FontWeight.w400),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          const Divider()
        ]);
  }
}

//for the
class EntryItem extends StatelessWidget {
  const EntryItem(this.entry, {super.key});

  final Entry entry;

  Widget _buildTiles(Entry root) {
    if (root.children.isEmpty) return ListTile(title: Text(root.title));
    return ExpansionTile(
      iconColor: kKarobarcolor,
      textColor: kKarobarcolor,
      key: PageStorageKey<Entry>(root),
      title: Text(root.title),
      children: root.children.map(_buildTiles).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildTiles(entry);
  }
}

void _showLogoutConfirmationDialog(BuildContext context) {
  Navigator.pop(context);
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Confirm Logout'),
        content: const Text('Are you sure you want to logout?'),
        actions: [
          TextButton(
            child: const Text(
              'Cancel',
              style: TextStyle(color: kKarobarcolor),
            ),
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog
            },
          ),
          TextButton(
            child: const Text(
              'Logout',
              style: TextStyle(color: Colors.red),
            ),
            onPressed: () {
              // Perform logout operation here
              FirebaseAuth.instance.signOut();
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()));
              Navigator.of(context).pop(); // Close the dialog
            },
          ),
        ],
      );
    },
  );
}
